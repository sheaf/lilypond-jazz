#(set-global-staff-size staffSize)

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
    print-first-page-number = ##t
    page-count = \numPages

  oddHeaderMarkup = \markup
    \fill-line {
      { \unless \on-first-page { \fromproperty #'header:title " " } }
      \null
      \if \should-print-page-number \line {
        \fromproperty #'page:page-number-string / \page-ref #'lastPgNo "0" "?"
      }
    }

  evenHeaderMarkup = \markup
    \fill-line {
      \fromproperty #'header:title
      \null
      \if \should-print-page-number \line {
        \fromproperty #'page:page-number-string / \page-ref #'lastPgNo "0" "?"
      }
    }

}

\header {
  title = \markup % \override #'(font-name . "Academico, Bold")
    { \fontsize #-1 \title
    }
  composer = \markup {
    \column {
      \vspace #-0.7
      \fontsize #-0.5 \bold \composer
    }
    \hspace #2
  }

  % Don't display "Engraved by LilyPond"
  tagline = ##f
}


% The score definition
\score {

<<

% Chords
#(if WantChords
#{
\new ChordNames \chords \with {
  % Move chords slightly further from staff
  % In particular: don't allow them to be pushed into the staff due to lyrics
  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.3
  }
  { \transpose \scoreRoot \rootChoice \Chords }
#})

\new Staff <<

% Chord rhythm
#(if (and WantChords ChordRhythms)
#{
  \new Voice = "Rhythm" { \ChordRhythms }
#})

% Melody
  \new Voice = "Melody"
    { \transpose \scoreRoot \rootChoice \Melody
      \label "lastPgNo" % "-/N" page number trick
    }

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

#(if (and WantChords ChordRhythms)
  ; This context might not exist, in which case don't create it with \context.
#{
  \context Voice = "Rhythm" {

    \override NoteHead.style = #'slash
    \override NoteHead.font-size = #-3
    \override NoteHead.no-ledgers = ##t
    \override Stem.details.lengths = #'(3.3)
    \override Stem.details.beam-lengths = #'(3.3)

  }
#})

>>

\layout {

  % Adjust tempo marking position
  \override Score.MetronomeMark.self-alignment-X = #-1.1
  \override Score.MetronomeMark.break-align-symbols = #'(clef)

  % Adjust rehearsal mark position
  \override Score.RehearsalMark.self-alignment-X = #0.8
  %\override Score.RehearsalMark.padding = #0.1
  %\override Score.RehearsalMark.Y-offset = #-3

  % Set lyrics font size
  \override LyricText.font-size = \lyricsSize

  \context { \Score

    % Hide bar numbers
    \remove "Bar_number_engraver"

    % Add an initial barline for staff groups,
    % even when there's only one staff in the group.
    \override SystemStartBar.collapse-height = 0

    % Hide clef and key signature on subsequent staves
    \override Clef.break-visibility = #'#(#f #f #f)
    \override KeySignature.break-visibility = #'#(#f #f #f)

    % Winged repeat signs
    startRepeatBarType = "[|:"
    doubleRepeatBarType = ":|][|:"
    endRepeatBarType = ":|]"

  }
}}
