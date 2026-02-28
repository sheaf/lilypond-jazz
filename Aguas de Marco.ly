
\version "2.24.4"

\include "sam-jazz-chords.ily"

\language "english"

title = "Águas de Março"
composer = "A. C. Jobim"
arranger = "Sam Derbyshire"
scoreRoot = bf
rootChoice = bf
numPages = 0
staffSize = 20.5
lyricsSize = -0.8

WantMelody = ##f
WantChords = ##t
WantLyrics = ##f
ChordRhythms = ##f
WantDiagrams = ##t

\include "predefined-guitar-fretboards.ly"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf/af }
  #guitar-tuning
  "4-3;x;3-1-(;3-1;3-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { g:m6 }
  #guitar-tuning
  "3-2;x;2-1;3-3;3-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { ef:m6/gf }
  #guitar-tuning
  "2-3;x;1-1;2-4;1-2;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { f:6 }
  #guitar-tuning
  "1-1;x;3-3;2-2;3-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { e:9 }
  #guitar-tuning
  "x;7-2;6-1;7-3;7-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { ef:maj9 }
  #guitar-tuning
  "x;6-2;5-1;7-4;6-3;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { af:13 }
  #guitar-tuning
  "4-1-(;x;4-1;5-2;4-1-);6-4;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:sus2.6 }
  #guitar-tuning
  "6-3;x;5-1;5-2;6-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:sus4.7.9 }
  #guitar-tuning
  "6-3;x;6-4;5-2;4-1;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:9 }
  #guitar-tuning
  "6-3;x;6-4;5-2;3-1;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { c/e }
  #guitar-tuning
  "x;7-3;5-1-(;5-1-);8-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { e:m7.5- }
  #guitar-tuning
  "x;7-1;8-3;7-2;8-4;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { ef:m6 }
  #guitar-tuning
  #'((mute 6)
     (place-fret 5 6 3)
     (place-fret 4 8 4)
     (place-fret 3 5 1)
     (place-fret 2 7 2)
     (barre 4 2 5)
     (mute 1))

\storePredefinedDiagram
  #default-fret-table
  \chordmode { ef':m6 }
  #guitar-tuning
  "x;6-2;x;5-1;7-4;6-3;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { ef:m6/bf }
  #guitar-tuning
  "6-3;x;4-1;5-4;4-2;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:maj9 }
  #guitar-tuning
  "x;1-1-(;3-4;2-3;1-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { e/d }
  #guitar-tuning
  "x;5-3;x;4-1;5-4;4-2;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { df/cf }
  #guitar-tuning
  "7-3;x;6-1-(;6-1;6-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:maj7 }
  #guitar-tuning
  "6-1;x;7-3;7-4;6-2;x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf:m7 }
  #guitar-tuning
  "6-1-(;x;6-1;6-1;6-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { c/bf }
  #guitar-tuning
  "6-3;x;5-1-(;5-1;5-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { cf/bf }
  #guitar-tuning
  "6-4;x;4-1-(;4-1;4-1-);x;"

\storePredefinedDiagram
  #default-fret-table
  \chordmode { bf }
  #guitar-tuning
  "6-4;x;3-1-(;3-1;3-1-);x;"

variant = \tweak extra-offset #'(4.1 . 3.9) _"*"

\defineBarLine "|" #'("|" "|" "|")
\defineBarLine "||-x" #'("||" "||" "||")

startBar = {
  \once \override Staff.BarLine.X-extent = #'(0 . 0)
  \bar "||-x"
}

breakopt =
#(if (or WantMelody WantLyrics)
  #{ \break #}
  #{ {} #}
)
end_four =
#(if (or WantMelody WantLyrics)
  #{ \bar "x-||" \break #}
  #{  \bar "||" s1 \override Score.BarLine.stencil = ##f s1*3 \break \revert Score.BarLine.stencil #}
)

\defineBarLine "||-x2" #'("" "||" "||")
startBarTwo = {
  \once \override Staff.BarLine.X-extent = #'(0 . 0)
  \bar "||-x2"
}

Chords = \chordmode {
  \autoTagChords {

    \numericTimeSignature\time 4/4
    \tempo \markup { \fontsize #-0.5 "Bossa nova" } 4=146

    % Only display the chord when it changes
    \set chordChanges = ##t

\mark \markup { \bold \rounded-box { "Intro" } }
\bar "||-x" \repeat percent 4 { bf1/af } \bar "x-||" \break

% A stick, a stone...
\mark \markup { \bold \rounded-box { "A" } } \startBar
\repeat percent 2 { bf1/af } | g:m6      | ef:m6/gf  | \breakopt
| f:6       | e:9         | ef:maj9   | af:13     | \break
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | c1/e      | ef:m6     | \breakopt
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | e1:m7.5-  | ef:m6     | \bar "x-||" \break

% It's the wind blowing free..
\mark \markup { \bold \rounded-box { "B" } } \startBar
| bf:sus2.6 | bf/af       | g:m6      | ef:m6/gf  | \breakopt
| f:6       | e:9         | ef:maj9   | ef':m6  \variant   | \bar "x-||" \break

% The foot, the ground...
\startBar
| bf:sus2.6 | bf/af              | g:m6      | ef:m6/gf  | \breakopt
| f:6       | bf2:sus4.7.9 bf2:9 | c1/e      | ef:m6     | \break
| bf:sus2.6 | bf/af              | g:m6      | ef:m6/gf  | \end_four

% A spear, a spike...
\once \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
  #'((alignment-distances . (5)))
\mark \markup { \bold \rounded-box { "C" } } \startBarTwo
| f:6       | e:9                | ef:maj9  | af:13     | \breakopt
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | c1/e     | ef:m6     | \break
| bf:sus2.6 | bf/af              | g:m6     | ef:m6/gf  | \breakopt
| f:6       | bf2:sus4.7.9 bf2:9 | c1/e     | ef:m6     | \bar "x-||" \break

% A float, a drift...
\once \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
  #'((alignment-distances . (5)))
\mark \markup { \bold \rounded-box { "D" } } \startBar
| bf:sus2.6 | bf/af            | g:m6     | ef:m6/gf  | \breakopt
| f:6       | e:9              | ef:maj9  | ef':m6 \variant   | \bar "x-||" \pageBreak

% Instrumental
\mark \markup { \bold \rounded-box { "E" } } \startBar
| bf:maj9   | e/d         | \repeat percent 2 { df/cf }    | \breakopt
            | bf/af       | g:m6     | ef:m6/gf  | \break
| f:6       | e:9         | ef:maj9  | ef':m6 \variant   | \breakopt
| bf:sus2.6 | bf/af       | g:m6     | ef:m6/gf  | \bar "x-||" \break

% A snake, a stick...
\mark \markup { \bold \rounded-box { "F" } } \startBar
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | e1:m7.5-  | ef:m6   | \breakopt
| bf:maj7   | bf:m7              | c/bf      | cf/bf   | \bar "x-||" \break

% A pin, a needle...
\mark \markup { \bold \rounded-box { "G" } } \startBar
| bf        | bf2:sus4.7.9 bf2:9 | e1:m7.5-  | ef:m6     | \breakopt
| bf:maj7   | bf:m7              | c/bf      | ef:m6/bf  | \break
| bf:maj7   | bf:m7              | c/bf      | cf/bf     | \end_four

% A stick, a stone
\once \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
  #'((alignment-distances . (5)))
\mark \markup { \bold \rounded-box { "H" } } \startBarTwo
| f:6       | e:9                | ef:maj9  | af:13     | \breakopt
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | c1/e     | ef:m6     | \break
| f:6       | bf2:sus4.7.9 bf2:9 | c1/e     | ef:m6/gf  | \end_four

% Instrumental
\once \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details
  #'((alignment-distances . (5)))
\mark \markup { \bold \rounded-box { "I" } } \startBarTwo
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | e1:m7.5-  | ef:m6/gf  | \breakopt
| bf:sus2.6 | bf2:sus4.7.9 bf2:9 | c1/e      | ef:m6     | \break
| bf:maj7   | bf:m7              | c/bf      | cf/bf     | \breakopt
| bf | bf | \bar "|."

}}

Melody = \relative bf {
  % Intro
  | R1 * 4 |

  % A
  | r4 d bf d
  | bf4 d8 d d c bf bf ~
  | bf4 d8 d d c bf bf ~
  | bf4 d8 d d c bf bf ~

  | bf4 d8 d d c bf bf ~
  | bf d c bf ~ bf d c bf ~
  | bf d c bf ~ bf d c bf ~
  | bf d c bf ~ bf d c bf ~

  | bf4. f'8 f f f bf ~
  | bf4. bf,8 bf bf bf g' ~
  | g4. bf,8 bf bf bf gf' ~
  | gf4. bf,8 bf bf bf f' ~

  | f4. f8 f f f bf ~
  | bf4. bf,8 bf4 bf8 g'8 ~
  | g4. d8 bf4 d8 bf8 ~
  | bf8 d d d ~ d c bf bf ~

  | bf4 d8 c bf d c bf ~
  | bf d c bf ~ bf d c bf ~
  | bf4 d8 c bf d c bf ~
  | bf d c bf ~ bf d c bf ~

  % B
  | bf4 d8 c bf d c4
  | bf d8 c bf d c bf ~
  | bf4 d8 c bf d c bf ~
  | bf d c bf ~ bf d c bf ~

  | bf4 d bf d
  | bf4. d8 d c bf bf ~
  | bf4. d8 d c bf bf ~
  | bf4 d8 d ~ d c4 bf8 ~

  | bf4. f'8 f4 f8 bf ~
  | bf4. bf,8 bf bf bf g' ~
  | g4 d8 bf ~ bf d bf4
  | r4. d8 d c bf bf ~

  | bf4. d8 d c bf bf ~
  | bf4 d8 d ~ d c bf bf ~
  | bf d c bf ~ bf d c bf ~
  | bf4 d8 c bf d c bf ~

  % C
  | bf4 d bf d
  | bf d bf d
  | bf d bf d
  | bf4. d8 d c bf bf ~

  | bf4. f'8 f f f bf
  | r8 bf, bf bf ~ bf bf bf g' ~
  | g4. bf,8 bf bf bf gf' ~
  | gf bf, bf bf ~ bf bf bf f' ~

  | f4 d8 bf ~ bf4 d8 bf ~
  | bf4 d8 bf ~ bf4 d8 bf ~
  | bf4 d8 c bf d c bf ~
  | bf c d bf ~ bf d c bf ~

  | bf4. f'8 f g f ef ~
  | ef4. ef8 d ef d c ~
  | c4 d8 c bf d c bf ~
  | bf df c bf ~ bf df c bf ~

  % D
  | bf r8 d4 bf f'8 bf
  | r4. d,8 bf4 f'8 bf
  | r4 d,8 bf ~ bf d bf4
  | r4. d8 d c bf bf ~

  | bf4 d8 c bf d c4
  | bf d8 c bf d c bf ~
  | bf4 d8 c bf d c bf ~
  | bf d c bf ~ bf d c bf ~

  % E
  | bf4 gs' e gs
  | e gs gs8 fs e df' ~
  | df4 f, df f

  | df f f8 ef df bf' ~
  | bf4 d, d8 c bf g' ~
  | g4 d d8 c bf gf' ~
  | gf4 d d8 c bf a' ~

  | a4 d, d8 c bf af' ~
  | af4 d, d8 c bf c ~
  | c4 d d8 c bf c ~
  | c d4 d8 d c bf bf ~

  | bf4 d bf d
  | bf d d8 c bf bf ~
  | bf4 d d8 c bf bf ~
  | bf4 d d8 c bf bf ~

  % F
  | bf4 f'8 f ~ f f bf4
  | r4 bf,8 bf bf bf bf g' ~
  | g4 bf,8 bf bf bf bf gf' ~
  | gf bf, bf bf ~ bf bf bf f' ~

  | f4 d bf d
  | bf d bf d8 bf ~
  | bf4 d8 bf ~ bf d bf bf
  | r4. d8 d d c bf

  % G
  | bf4 d bf d
  | bf8 bf d4 bf d
  | bf d bf d
  | bf8 bf d bf ~ bf4 d8 bf ~

  | bf4. f'8 f f f bf ~
  | bf bf ~ bf bf,8 bf bf bf g' ~
  | g4 bf,8 bf bf bf bf gf' ~
  | gf4 bf,8 bf bf bf bf f' ~

  | f4 d8 c bf d c4
  | bf4 df8 c bf df c bf ~
  | bf4 df8 c bf df c bf ~
  | bf df cf bf ~ bf df cf bf ~

  % H
  | bf4 d bf d
  | bf4. d8 d c bf bf ~
  | bf4. d8 d c bf bf ~
  | bf d d4. c8 ~ c bf ~

  | bf4. d8 d c bf bf ~
  | bf4. d8 bf ~ bf d bf ~
  | bf4. d8 bf ~ bf d bf ~
  | bf4. d8 d c bf bf ~

  | bf4 d8 c bf d c4
  | bf d8 c bf d c bf ~
  | bf4 d8 c bf d c bf ~
  | \tuplet 3/2 { bf4 d c bf d c }

  % I
  | << bf2 \tuplet 3/2 { bf'4 bf, bf bf bf af' ~ } >>
  | \tuplet 3/2 { af4 bf, bf bf bf g' ~ }
  | \tuplet 3/2 { g bf, bf bf bf gf' ~ }
  | \tuplet 3/2 { gf bf, bf bf bf f' ~ }

  | \tuplet 3/2 { f bf, bf bf bf f' ~ }
  | \tuplet 3/2 { f bf, bf bf bf e ~ }
  | \tuplet 3/2 { e bf bf bf bf ef ~ }
  | \tuplet 3/2 { ef bf bf bf bf d ~ }

  | \tuplet 3/2 { d bf bf bf bf df ~ }
  | \tuplet 3/2 { df bf bf bf bf c ~ }
  | \tuplet 3/2 { c bf bf bf bf cf ~ }
  | \tuplet 3/2 { cf bf bf bf bf bf ~ }

  | bf4 d' \staccato bf \staccato d' \staccato | bf4 \staccato r2. |
}

Lyrics_English = \lyricmode {
  A stick, a stone, it's the end of the road.
  It's the rest of a stump.
  It's a lit -- tle a -- lone.
  It's a sli -- ver of glass.
  It is life, it's the sun.
  It is night, it is death.
  It's a trap, it's a gun.

  The oak when it blooms, a fox in the brush.
  The knot of the wood, the song of a thrush.

  The wood of the wind.
  A cliff, a fall.
  A scratch, a lump.
  It is no -- thing at all.

  It's the wind blo -- wing free,
  it's the end of the slope,
  it's a beam, it's a void,
  it's a hunch, it's a hope.

  And the ri -- ver bank talks of the wa -- ters of March.
  It's the end of the strain, it's the joy in your heart.

  The foot, the ground.
  The flesh and the bone.
  The beat of the road.
  A sling -- shot stone.

  A fish, a flash!
  A sil -- ver -- y glow.
  A fight, a bet.
  The range of a bow.

  The bed of the well, the end of the line.
  The dis -- may in the face, it's a loss, it's a find.

  A spear, a spike, a point, a nail.
  A drip, a drop, the end of the tale.
  A truck -- load of bricks in the soft mor -- ning light.
  The shot of a gun in the dead of the night.

  A mile, a must, a thrust, a bump.
  It's a girl it's a rhyme it's a cold it's the mumps.
  The plan of the house the bo -- dy in bed,
  and the car that got stuck, it's the mud, it's the mud.


  A float, a drift!
  A flight, a wing.
  A hawk, a quail.
  The pro -- mise of spring.

  And the ri -- ver bank talks of the wa -- ters of March.
  It's the pro -- mise of life.
  It's the joy in your heart.

  \repeat unfold 73 { \skip 1 }

  A snake, a stick. It is John, it is Joe.
  It's a thorn in your hand and a cut on your toe.
  A point, a grain. A bee, a bite.
  A blink, a bu -- zzard. A su -- dden stroke of night.

  A pin, a nee -- dle. A sting, a pain.
  A snail, a ri -- ddle, a wasp, a strain.
  A pass in the moun -- tains.
  A horse and a mule.
  In the dis -- tance the shelves rode three sha -- dows of blue.

  And the ri -- ver bank talks of the wa -- ters of March.
  It's the pro -- mise of life in your heart in your heart.

  A stick, a stone. The end of the load.
  The rest of a stump. A lone -- some road.
  A sli -- ver of glass. A life, the sun.
  A night. A death. The end of the run.

  And the ri -- ver bank talks of the wa -- ters of March.
  It's the end of all strain it's the joy in your heart.

}

LyricsChoice = \Lyrics_English

\include "lead-sheet.ily"
