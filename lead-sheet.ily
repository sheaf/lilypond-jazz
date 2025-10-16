#(set-global-staff-size staffSize)

\version "2.24.4"

\pointAndClickOff

% A4 paper layout
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 0.7\cm
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
        \raise #0.9 \scale #'(0.7 . 0.7) \fromproperty #'page:page-number-string
        \hspace #-0.3
        \raise #0.2 \rotate#-30 \scale #'(0.3 . 0.5) "|"
        \hspace #-0.4
        \lower #0.9 \scale #'(0.7 . 0.7) \page-ref #'lastPgNo "0" "?"
      }
    }

  evenHeaderMarkup = \markup
    \fill-line {
      \fromproperty #'header:title
      \null
      \if \should-print-page-number \line {
        \raise #0.9 \scale #'(0.7 . 0.7) \fromproperty #'page:page-number-string
        \hspace #-0.3
        \raise #0.2 \rotate#-30 \scale #'(0.3 . 0.5) "|"
        \hspace #-0.4
        \lower #0.9 \scale #'(0.7 . 0.7) \page-ref #'lastPgNo "0" "?"
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
      \hspace #2
    }
  }
  arranger =
    #(if (and (defined? 'arranger) (not (string-null? arranger)))
       #{ \markup {
            \column {
              \vspace #-0.7
              \line { \fontsize #-1.5 { "arr: " \arranger } }
              \hspace #2
            }
          } #}
       #{ \markup {} #})

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

  % Align chord names to the bottom not the center,
  % so that there isn't huge amounts of vertical space when slash chords
  % are involved.
  \override ChordName.stencil =
     #(lambda (grob)
        (let* ((stencil (ly:text-interface::print grob))
               (ext (ly:stencil-extent stencil Y))
               (bottom (car ext))
               )
         (if (finite? bottom)
           (ly:stencil-translate stencil (cons 0 (- bottom)))
           stencil
         )
        )
      )
  }
  { \transpose \scoreRoot \rootChoice \Chords }
#})

\new Staff <<

  \Form

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
  \new Lyrics \lyricsto "Melody" { \LyricsChoice }
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

    % Move lyrics a bit closer to staff
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0.8

    % Winged repeat signs
    startRepeatBarType = "[|:"
    doubleRepeatBarType = ":|][|:"
    endRepeatBarType = ":|]"

    % Use upright+bold for D.S., D.C. etc
    dalSegnoTextFormatter =
      #(lambda (context return-count marks)
         (let ((m (format-dal-segno-text context return-count marks)))
           (and m (markup #:upright #:bold m)))
       )
  }
}}
