
\version "2.24.4"

\include "sam-jazz-chords.ily"

\language "english"

title = "Tell Me A Bedtime Story"
composer = "Herbie Hancock"
scoreRoot = g
rootChoice = g
numPages = 2
staffSize = 20.0
lyricsSize = 0

Chords = \chordmode {

  % Only display the chord when it changes
  \set chordChanges = ##t

  \set noChordSymbol = ""

  | \repeat unfold 3 { g1:maj7.11+ ~ | 1 | fs1:m9 ~ | 1 | }
  | g1:maj7.11+ | fs:m9 | c1:maj7.11+ ~ | 2.. b8:maj7 ~ |
  | 4. g4.:maj7 e4:maj7 ~ | 4 c2:maj7 ~ 8 b8:maj7 ~ | 4. g4.:maj7 e4:maj7 ~ | 4 c2.:maj7 |

  %B1
  | b1:sus4.7.9 | b:9.13- | e2:maj7 r8 e4.:7.9+ | ef1:7.9+ |
  | d1:maj7 | cs1:m7 | c1:maj7.11+ ~ | 2.. b8:maj7 ~ |
  | 4. g4.:maj7 e4:maj7 ~ | 4 c2:maj7 ~ 8 b8:maj7 ~ | 4. g4.:maj7 e4:maj7 ~ | 4 c2.:maj7 |

  % C
  | b4.:sus7{}4. a4:sus7 ~ | 1 | gs1:m7 | e1:m9 |

  \time 5/4

  | cs4:m7{}4. 4 4. | ds4:m7{}4. 4 4. | e4:m7{}4. 4 4. | fs4:m7{}4. 4 4. |

  \time 4/4

  | g1:maj7.11+ ~ | 1 | fs1:m9 ~ | 1 |
  | e1:m7 | a1:7 | d1:maj7 | c2..:maj7 b8:maj7 ~ |
  | 4. g4.:maj7 e4:maj7 ~ | 4 c2:maj7 ~ 8 b8:maj7 ~ | 4. g4.:maj7 e4:maj7 ~ | 4 c2.:maj7 |

  % Coda

  | \repeatTie e4:maj7 c4:maj7 ~ 4. b8:maj7 ~ |
  \repeat volta 2 {
    | b4.:maj7 g8:maj7 ~ 4 e4:maj7 ~ | 4 c4:maj7 ~ 4. b8:maj7 ~ |
  }

}

% Rhythm markings
MyRhythm = \relative b''
 { | s1 * 16 |
   | \repeatTie b4. 4. 4 ~ | 4 2~8 8~ | 4. 4. 4~ | 4 2. |
   | s1 * 2 | b2 c8 \rest b4. | s1 |

   | s1 * 4 |
   | \repeatTie b4. 4. 4 ~ | 4 2~8 8~ | 4. 4. 4~ | 4 2. |

   | s1 * 4 |
   | b4 4. 4 4. | 4 4. 4 4. | 4 4. 4 4. | 4 4. 4 4. |

   | s1 * 15 |
 }

breveFiveFour =
#(define-music-function (note) (ly:music?)
   #{
     \once \override NoteHead.duration-log = #-1
     \scaleDurations 5/4 { $note }
   #})

Melody = \relative g' {

\clef "treble"
\numericTimeSignature\time 4/4
\key d \major % D major = G lydian
\tempo \markup { \fontsize #-0.5 "Funk/fusion" } 4=124

\mark \markup { \bold \rounded-box { "Intro" } }
r4 a2  gs8 fs8 | e4 cs8 a8~8 cs8~8 b8~|1~|2 r2 | \break
r4 a'2 gs8 fs8 | e4 cs8 a8~8 cs8~8 b8~|1~|2 fs'8 a b a | \break

\repeat volta 2 {
\mark \markup { \bold \rounded-box { "A" } } \section
cs1~| 2 8 e8 \tuplet 3/2 { b16 c b } a8 | b1~| b2 fs8 a b a| \break
cs1~| 2 8 e8 \tuplet 3/2 { b16 c b } a8 | fs1 | r4 e4 d8 e~8 fs ~| \break
fs1~| 2.. 8~| 2 d8 e~e fs~| 2 8 a b a | \break

\mark \markup { \bold \rounded-box { "B1" } } \section
cs1~|2 8 e \tuplet 3/2 { b16 c b } a8 | b1~ | 2 fs8 a b a | \break
\repeat unfold 6 { bs16 cs16 r8 } bs16 cs16 fs8 \tuplet 3/2 { b,16 c b } a8 |
fs1 | r4 e d8 e~e fs~ | \break
1~|2.. 8~|2 d8 e~e fs~|1| \break

\mark \markup { \rounded-box { \bold "C" } }  \section
\improvisationOn b4. b4. b4 ~ | 4 \improvisationOff b8 cs \tuplet 3/2 { c b a } fs a |
cs ds cs2.~ | 2 b4 a | \break

\time 5/4
  \breveFiveFour gs1 |
  \breveFiveFour gs1 |
  \breveFiveFour b1 |
b4_\staccato r4. r8 fs8 a b a | \break

\time 4/4

\mark \markup { \bold \rounded-box { "B2" } } \section
cs1~|2 8 e \tuplet 3/2 { b16 c b } a8 | b1~ | 2 fs8 a b a | \break
\repeat unfold 6 { bs16 cs16 r8 } bs16 cs16 fs8 \tuplet 3/2 { b,16 c b } a8 |
fs1 | r4 e d8 e~e fs~ | \break
4. b4. cs4 ~|4 d2~d8 ds8~|4. fs4. g4 ~| \mark \markup { \musicglyph "scripts.coda" } 1| \break }

% Coda
\mark \markup { \musicglyph "scripts.coda" } \section
  | \repeatTie \improvisationOn b,4 4 ~ 4. b8 ~ |
  \repeat volta 2 {
    |  b4. b8 ~ 4 b4 ~ | 4 b4 ~ 4. b8 \laissezVibrer \improvisationOff |
  }
}

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
        \fromproperty #'page:page-number-string / \page-ref #'last "0" "?"
      }
    }

  evenHeaderMarkup = \markup
    \fill-line {
      \fromproperty #'header:title
      \null
      \if \should-print-page-number \line {
        \fromproperty #'page:page-number-string / \page-ref #'last "0" "?"
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

  \context {
    \RhythmicStaff
    \remove "Time_signature_engraver"
    \remove "Clef_engraver"
    \override BarLine.transparent = ##t
    \override StaffSymbol.line-count = #0
    \override NoteHead.style = #'slash
    \override NoteHead.font-size = #-2
  }

  \context {
    \Voice
  }


}

% The score definition
\score {

<<

% Chords
\new ChordNames \chords \with {
      % Move chords slightly further from staff
      % In particular: don't allow them to be pushed into the staff due to lyrics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.3
     }
    { \transpose \scoreRoot \rootChoice \Chords }

% Chord rhythm
\new Staff <<
  \new Voice = "rhythm" \with
   { \override NoteHead.style = #'slash
     \override NoteHead.font-size = #-3
     \override NoteHead.no-ledgers = ##t
     \override Stem.details.lengths = #'(3.3)
     \override Stem.details.beam-lengths = #'(3.3)
   } { \voiceOne \stemUp \MyRhythm }

% Melody
  \new Voice = "Melody" { \shiftOff \transpose \scoreRoot \rootChoice \Melody \label "last" }
>>
>>

}

