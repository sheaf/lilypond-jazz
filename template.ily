#(set-global-staff-size 19.0)

\version "2.24.4"

\pointAndClickOff

% A4 paper layout
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 0.4\cm
    bottom-margin = 1.3\cm
    left-margin = 1.2\cm
    right-margin = 0.7\cm
    between-system-space = 0.5\cm
    indent = 0\cm

    page-count = \numPages
}

\header {
  title = \markup % \override #'(font-name . "Academico")
    { \fontsize #-1 \title
    }
  composer = \markup {
    \column {
      \vspace #-0.7
      \fontsize #-0.5 \bold \composer
    }
    \hspace #2
  }

  % Don't dsplay "Engraved by LilyPond"
  tagline = ##f
}

\layout {

  % Adjust tempo marking position
  \override Score.MetronomeMark.self-alignment-X = #-1.1
  \override Score.MetronomeMark.break-align-symbols = #'(clef)

  % Adjust rehearsal mark position
  \override Score.RehearsalMark.self-alignment-X = #0.8
  %\override Score.RehearsalMark.padding = #0.1
  %\override Score.RehearsalMark.Y-offset = #-3

  % Set lyrics font size
  \override LyricText.font-size = #-0.8

  \context { \Score

    % Hide bar numbers
    \remove "Bar_number_engraver"

    % Add an initial barline on all staves
    \override SystemStartBar.collapse-height = 1

    % Hide clef and key signature on subsequent staves
    \override Clef.break-visibility = #'#(#f #f #f)
    \override KeySignature.break-visibility = #'#(#f #f #f)

  }

}

% The score definition
\score {

<<

% Chords
#(if WantChords
#{ \chords \with {
      % Move chords slightly further from staff
      % In particular: don't allow them to be pushed into the staff due to lyrics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.3
     }
    { \transpose bf \rootChoice \Chords }
#})

% Melody
\context Voice = "Melody" { \transpose bf \rootChoice \Melody }

% Lyrics
#(if WantLyrics
#{
  \new Lyrics
    \with {
      % Move lyrics a bit closer to staff
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0.8
     }
    \lyricsto "Melody" { \LyricsChoice }
#})

>>

}