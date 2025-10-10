\version "2.24.4"

\include "sam-jazz-chords.ily"
\include "template.ily"

\header {
  title = \markup % \override #'(font-name . "Academico")
    { "My Foolish Heart"
    }
  composer = \markup \column {
    \vspace #-0.5
    "Victor Young"
  }

  % Don't display "Engraved by LilyPond"
  tagline = ##f
}


Chords = \chordmode {
  % Intro
  | bes1  | g1:m9 | c2:m7 f2:7 | bes1:6.9   |
  | g1:m7 | c1:9  | f1:7       | f1:7.8+.9+ |

  %A1
  | bes2:maj9 ees2:maj7 | d2:m11 g2:7.13-    | c2:m9 \rl c2:m7/bes | a2:sus13 a2:9.13- |
  | d2:m11    d2:7.9-   | g2:m7  des2:13.11+ | c1:m7               | c1:m7.11.5-       |

  %B
  | bes1:maj9           | f2:m6.9 bes2:9.13- | ees1:maj7           | a2:m7.5- d2:7 |
  | g2:m      g2:m7.7+  | g2:m7   c2:7       | c2:m7     g2:7.13-  | c2:m7    f2:7 |

  %A2
  | bes2:maj9 ees2:maj7 | d2:m11 g2:7.13-    | c2:m9 \rl c2:m7/bes | a2:sus13    a2:9.13-    |
  | d2:m11    d2:7.9-   | g2:m7  des2:13.11+ | c2:m7 \rl c2:m7/bes | a2:m7.11.5- d2:7.9-.13- |

  %C
  | g1:m7          | ges1:7                            | bes2:maj13 ees2:maj13 | d2:m7.5-      g2:7       |
  | c2:m7 g2:7.13- | c4:9 c4:9.13- f4:sus13 f4:7.9-.9+ | bes2:6.9   g2:m9      | ges2:maj7.11+ f2:7.9-.9+ |

  % Coda
  | bes2:6.9 g2:m9 | c2:m7 ces2:maj7.11+ | bes1:6.9 |
}

Lyrics = \lyricmode {
%Verse
The scene is set for drea -- ming
Love's kno -- cking at the door
But oh my heart, I'm re -- luc -- tant to start
For we've been fooled be -- fore

%
The night is like a lo -- vely tune
Be -- ware, my foo -- lish heart
How white the e -- ver con -- stant moon
Take care, my foo -- lish heart
There's a line be -- tween love and fasci -- nation
That's hard to see, on an eve -- ning such as this
For they both give the ve -- ry same sen -- sa -- tion
When you're lost in the ma -- gic of a kiss

%
Her lips are much too close to mine
Be -- ware, my foo -- lish heart
But should our ea -- ger lips com -- bine
Then let the fi -- re start
For this time, it is -- n't fa -- sci -- na -- tion
Or a dream that will fade and fall apart
It's love
This time it's love, my foo -- lish heart

}

Melody = \relative bes' {

\clef "treble"
\numericTimeSignature\time 4/4
\key bes \major
%\tempo 4=60

\autoPageBreaksOff
\set strictBeatBeaming = ##t

\mark \markup { \bold \rounded-box { "Intro" } }
r8 bes8 a8 bes8 a4 f4 |
a4 a2. |
r8 g8 a8 bes8 c4 a4 |
g1 | \break

r8 bes8 bes8 bes8 d4 d8 d8 |
\times 2/3 { d4 d4 a4 } g2 |
r8 c8 c8 c8 c4. d8 |
c2. f,4 \bar "||" \break |

\mark \markup { \bold \rounded-box { "A1" } }
f2 ~ f8 bes,8 d8 f8 |
g8 a8 g2 g4 |
g2 ~ g8 c,8 es8 g8 |
a2. a4 \break |

a2 ~ a8 d,8 f8 a8 |
bes8 c8 bes2 bes4 |
bes2 ~ bes8 es,8 g8 bes8 |
c2. bes8 c8 \bar "||" \break |

\mark \markup { \bold \rounded-box { "B" } }
d4. d8 d4 c8 bes8 |
d4 d4. d8 c8 bes8 |
c4 c8 c8 c8 d8 c8 bes8 |
c2. bes8 a8 \break |

bes8 bes8 ~ bes8 bes8 bes8 c8 a8 g8 |
bes4 bes2 g8 gis8 |
a4 a8 a8 a8 a8 g8 f8 |
a2. g4 \bar "||" \break |

\mark \markup { \bold \rounded-box { "A2" } }
f2 ~ f8 bes,8 d8 f8 |
g8 a8 g2 g4 |
g2 ~ g8 c,8 es8 g8 |
a2. a4 \break |

a2 ~ a8 d,8 f8 a8 |
bes8 c8 bes2 bes4 |
bes2 ~ bes8 es,8 g8 bes8 |
d2. c4 \bar "||" \break |

\mark \markup { \rounded-box { \bold "C" } }
bes8 bes8 ~ bes8 bes8 bes8 a8 g8 a8 |
bes4 bes2 bes8 c8 |
d4. d8 d8 d8 c8 bes8 |
d,2. g4 \break |

bes2 ~ bes8 es,8 g8 bes8 |
c4 d4 bes4 c4 |
\mark \markup { \musicglyph "scripts.coda" } bes1 ~ |
bes1 \bar "|." \break |

% Coda
\mark \markup { \musicglyph "scripts.coda" } bes4 f4 g8 f8 g8 bes8 |
c4 d4 f4 d4 |
c1 \bar "|."
}


% The score definition
\score {

<<
  \chords \with {
      % Move chords slightly further from staff
      % In particular: don't allow them to be pushed into the staff due to lyrics
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.5
     }
    { \Chords }
  \context Voice = "Melody" { \Melody }
  \new Lyrics
    \with {
      % Move lyrics a bit closer to staff
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #0.8
     }
    \lyricsto "Melody" { \Lyrics }
>>
\layout {
}
}

