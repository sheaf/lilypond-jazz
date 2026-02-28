#(set-global-staff-size staffSize)

\version "2.24.4"

\pointAndClickOff

% A4 paper layout
\paper {

    ragged-bottom = ##f

    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 0.7\cm
    bottom-margin = 0.9\cm
    left-margin = 1.4\cm
    right-margin = 0.9\cm
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

  % Controls the space between the title/header and the first system
  markup-system-spacing = #'(
    (basic-distance . 5)
    (minimum-distance . 2)
    (padding . -6)
    (stretchability . 0)
  )
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


% Print barlines & time signatures for chords if there are no other staves.
chordBarEngraver =
  #(if (not (or (false-if-exception WantMelody) (false-if-exception WantBass)))
  #{ \with {
     \consists "Bar_engraver"
     \override BarLine.bar-extent = #'(-2 . 2)
     \consists "Time_signature_engraver"
  }#}
  #{ \with {} #}
  )

% For a chord-only score, make all bars line up by using proportional notation.
setNoteProportions =
  #(if (not (or (false-if-exception WantMelody) (false-if-exception WantBass)))
  #{
    \with {
      proportionalNotationDuration = #(ly:make-moment 1/8)
      \override SpacingSpanner.strict-note-spacing = ##t
      \override SpacingSpanner.uniform-stretching = ##t
    }
  #}
  #{ \with { } #}
)

% The score definition
\score {

<<

% Chord diagrams
#(if (false-if-exception WantDiagrams)
#{
\new FretBoards \with {
  % Make dots contain finger numbers
  \override FretBoard.fret-diagram-details.finger-code = #'in-dot
  % Adjust dot size
  \override FretBoard.fret-diagram-details.dot-radius = #0.42

  % Use arabic numerals for fret number
  \override FretBoard.fret-diagram-details.number-type = #'arabic
  % Put fret number to the left
  \override FretBoard.fret-diagram-details.label-dir = #LEFT
  % Make fret number larger
  \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.6
  % Move fret number up
  \override FretBoard.fret-diagram-details.fret-label-vertical-offset = #-1.1
  \override FretBoard.fret-diagram-details.fret-label-horizontal-offset = #0.3

  % Use bar for barre
  \override FretBoard.fret-diagram-details.barre-type = #'straight

  \override FretBoard.font-series = #'bold

  % Reduce padding
  \override VerticalAxisGroup.staff-affinity = ##f
  \override VerticalAxisGroup.staff-staff-spacing =
    #'((basic-distance . 0.0)
       (minimum-distance . 0.0)
       (padding . 0.6)
       (stretchability . 0))

  % Move diagrams slightly to the right
  \override FretBoard.extra-offset = #'(1.0 . 0)

  \override FretBoard.color = #(x11-color 'grey30)

  } { \keepWithTag #'diagram \Chords }
#})


% Chords
#(if (false-if-exception WantChords)
#{
\new ChordNames \with {

  % Add barlines/time signatures if there are no other staves.
  \chordBarEngraver

  % For small asterisks on alternate chords
  \consists "Text_engraver"

  % For repeat percent signs
  \consists "Percent_repeat_engraver"

  } \chordmode
  { \transpose \scoreRoot \rootChoice { \keepWithTag #'score \Chords }
  \label "lastPgNo" }
#})

#(if (false-if-exception WantMelody)
#{
\new Staff <<

    \Form

% Chord rhythm
#(if (and (false-if-exception WantChords) (false-if-exception ChordRhythms))
#{
  \new Voice = "Rhythm" \with
  { \override NoteHead.style = #'slash
    \override NoteHead.font-size = #-3
    \override NoteHead.no-ledgers = ##t
    \override Stem.details.lengths = #'(3.3)
    \override Stem.details.beam-lengths = #'(3.3)
   }
   { \ChordRhythms }
#}
)

    \key bf \major
      \new Voice = "Melody" { \Melody }
#(if (false-if-exception WantLyrics)
#{
      \new Lyrics \lyricsto "Melody" { \LyricsChoice \label "lastPgNo" }
#}
)
  >>
#})

>>

\layout {

  % Adjust tempo marking position
  \override Score.MetronomeMark.self-alignment-X = #-1.1
  \override Score.MetronomeMark.break-align-symbols = #'(clef)

  % Adjust rehearsal mark position
  \override Score.RehearsalMark.self-alignment-X = #0.8

  indent = 0
  ragged-right = ##f
  ragged-last = ##f

  \context { \Score

    % For a chord-only score, make all bars line up by using proportional notation.
    \setNoteProportions

    % Set lyrics font size
    \override LyricText.font-size = \lyricsSize

    % Hide bar numbers
    \remove "Bar_number_engraver"

    % Add an initial barline for staff groups,
    % even when there's only one staff in the group.
    \override SystemStartBar.collapse-height = 0

    % Hide clef and key signature on subsequent staves
    \override Clef.break-visibility = #'#(#f #f #f)
    \override KeySignature.break-visibility = #'#(#f #f #f)

    % Don't allow automatic line breaks
    \override NonMusicalPaperColumn.line-break-permission = ##f

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

\defineBarLine "|" #'("|" "|" "|")
\defineBarLine "||" #'("||" "||" "||")
