
\version "2.24.4"

\include "sam-jazz-chords.ily"

\language "english"

title = "Thom Thumb"
composer = "Jacob Collier"
arranger = "Sam Derbyshire"
scoreRoot = bf
rootChoice = bf
numPages = 1
staffSize = 17.5
lyricsSize = -1.0
WantLyrics = ##t
WantChords = ##t
WantDiagrams = ##f
WantMelody = ##t

Form = {

  \tempo 4=130
  \numericTimeSignature\time 3/4

  \mark \markup { \bold \rounded-box { "I" } } \section
  s2.*4 \break

  \repeat volta 2 {

  \mark \markup { \bold \rounded-box { "A" } } \section

  \repeat unfold 3 { s2.*4 \break }
  s2.*3 \break

  }

  \mark \markup { \bold \rounded-box { "B" } } \section
  \repeat unfold 4 { s2.*4 \break }


  \mark \markup { \bold \rounded-box { "O" } } \section
  s2.*3 s2.*4 \bar "x-||"
}

Chords = \chordmode {
  % Only display the chord when it changes
  \set chordChanges = ##t
  \set noChordSymbol = ""

  | e2. | e/b | e | e/b |

  | e2.              | cs:m7   | b2:3.5.9.11 b4:3.5.9 | e2.       |
  | cs:m7            | a:6.9   | b2:3.5.9.11 b4:3.5.9 | b4.  a    |
  | e2.:5.9/gs       | a:6.9   | b:3.5.9.11           | a:maj9/cs |
  | fs4.:m7 e:5.9/gs | a2.:6.9 | b2:3.5.9.11 b4:3.5.9 |

  | g2.      | a:m7    | g/b     | c:m6     |
  | g/d      | ef:aug  | c:6.9/e | b:5.9/ds |
  | e:5.9/gs | a:6.9   | g/b     | c:m6     |
  | g/d      | ef:aug  | c:6.9/e | af:7/ef  |

  | af:maj9.11+ | ef:aug | af:maj9.11+ |
  | e:3.5.9     | cs:m7  | e:3.5.9       | cs:m7 |


}

% Rhythm markings
ChordRhythms = { }

#(define (scoop-stencil grob)
  (ly:stencil-combine-at-edge
   (ly:note-head::print grob) 0 -1
   (grob-interpret-markup grob
    (markup #:with-dimensions '(0 . 0) '(0 . 0)
     #:translate '( -2 . -1) #:musicglyph "brackettips.up" )) 0.2 )
)

scoop = \once \override NoteHead.stencil = #scoop-stencil


Melody = \relative e'' {
  \clef "treble"
  \key e \major

  | s2. *4 |

  | b4. b8 b4 | b4. a8 gs4 | fs gs8 gs4. | r2. |
  | b2  b8 b8 | b8 a8 ~ a4 gs8 fs8 ~ | fs2 r4 |
  | \tuplet 4/3 { fs2 gs4 a4 } | a4 gs8 fs8 ~ 8 e8 ~ |
  | e4 e8 ds8 ~ 8 cs8 ~ | cs8 b8 ~ b4 r4 |
  | fs'4 gs4 a8 a8 ~ |
  | a4. \once \teeny \once \stemDown \once \autoBeamOff gs8 \( gs8 \) fs8 |
  | e4 ds8 cs8 ~ cs8 b8 ~ | b2. |

  | b'2. | b | b4. c8 d8 c ~ | c b ~ b4 a4 |
  | g2.  | g | g4. a8 g8 fs ~ | fs4 e8 ds8 ~ ds4 |
  | b'2. | b | r8 b4. c8 d8 | c4 b4 a4 |
  | g2.  | g | g4. a8 ~ a8. g16 | fs2 e8 ds8 ~ |

  | ds2. |
}

LyricsEnglish= \lyricmode {

<<
{
Light up the stove of your coun -- te -- nance.
You're all that ma -- tters to me.
I am a lake or a stone or an hour -- glass.
I am a joke _ that is was -- ted on me.
}

\new Lyrics {
\set associatedVoice = "Melody"
Wrap me in scarves of your con -- fi -- dence.
Rend me to ta -- tters, I'm free.
I'll be a steak or a bone or an oven -- glove.
I'll be the is -- land _ that drowns in the sea.
}

>>

Thom Thumb
Where did you come from?
I'm lost, soft, drow -- ning in e -- very -- thing.
Thom Thumb
Thought you were gone and I found you, in -- side of e -- very -- thing.

}

LyricsChoice = \LyricsEnglish
\include "lead-sheet.ily"
