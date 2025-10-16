\version "2.24.4"

\include "sam-jazz-chords.ily"

\language "english"

title = "My Foolish Heart"
composer = "Victor Young"
scoreRoot = bf
rootChoice = bf
numPages = 1
staffSize = 19.0
lyricsSize = -0.8

Form = {

\tempo \markup { \fontsize #-0.5 "Jazz ballad" } 4=60
\numericTimeSignature\time 4/4

\mark \markup { \bold \rounded-box { "Intro" } }
\repeat unfold 2 { s1*4 \break }

\mark \markup { \bold \rounded-box { "A1" } } \section
\repeat unfold 2 { s1*4 \break }

\mark \markup { \bold \rounded-box { "B" } } \section
\repeat unfold 2 { s1*4 \break }

\mark \markup { \bold \rounded-box { "A2" } } \section
\repeat unfold 2 { s1*4 \break }

\mark \markup { \rounded-box { \bold "C" } } \section
s1*4 \break
s1*2 \mark \markup { \musicglyph "scripts.varcoda" } s1*2 \break \bar "|."

\mark \markup { \musicglyph "scripts.varcoda" } \section
s1*3 \bar "|."

}

Chords = \chordmode {
  % Intro
  | bf1   | g1:m9 | c2:m7 f2:7 | bf1:6.9    |
  | g1:m7 | c1:9  | f1:7       | f1:7.8+.9+ |

  %A1
  | bf2:maj9 ef2:maj7 | d2:m11 g2:7.13-   | c2:m9 \rl c2:m7/bf | a2:sus13 a2:9.13- |
  | d2:m11    d2:7.9- | g2:m7  df2:13.11+ | c1:m7              | c1:m7.11.5-       |

  %B
  | bf1:maj9           | f2:m6.9 bf2:9.13- | ef1:maj7           | a2:m7.5- d2:7 |
  | g2:m      g2:m7.7+ | g2:m7   c2:7      | c2:m7     g2:7.13- | c2:m7    f2:7 |

  %A2
  | bf2:maj9 ef2:maj7 | d2:m11 g2:7.13-   | c2:m9 \rl c2:m7/bf | a2:sus13    a2:9.13-    |
  | d2:m11    d2:7.9- | g2:m7  df2:13.11+ | c2:m7 \rl c2:m7/bf | a2:m7.11.5- d2:7.9-.13- |

  %C
  | g1:m7          | gf1:7                             | bf2:maj13 ef2:maj13 | d2:m7.5-      g2:7       |
  | c2:m7 g2:7.13- | c4:9 c4:9.13- f4:sus13 f4:7.9-.9+ | bf2:6.9   g2:m9     | gf2:maj7.11+ f2:7.9-.9+ |

  % Coda
  | bf2:6.9 g2:m9 | c2:m7 cf2:maj7.11+ | bf1:6.9 |
}

Lyrics_English = \lyricmode {
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
There's a line be -- tween love and fa -- sci -- na -- tion
That's hard to see, on an eve -- ning such as this
For they both give the ve -- ry same sen -- sa -- tion
When you're lost in the ma -- gic of a kiss

%
Her lips are much too close to mine
Be -- ware, my foo -- lish heart
But should our ea -- ger lips com -- bine
Then let the fi -- re start
For this time, it is -- n't fa -- sci -- na -- tion
Or a dream that will fade and fall a -- part
It's love
This time it's love, my foo -- lish heart

}

Melody = \relative bf' {

\clef "treble"
\numericTimeSignature\time 4/4
\key bf \major


%\autoPageBreaksOff
\set strictBeatBeaming = ##t

% Intro
r8 bf8 a8 bf8 a4 f4 |
a4 a2. |
r8 g8 a8 bf8 c4 a4 |
g1 |

r8 bf8 bf8 bf8 d4 d8 d8 |
\times 2/3 { d4 d4 a4 } g2 |
r8 c8 c8 c8 c4. d8 |
c2. f,4 |

% A1
f2 ~ f8 bf,8 d8 f8 |
g8 a8 g2 g4 |
g2 ~ g8 c,8 ef8 g8 |
a2. a4 |

a2 ~ a8 d,8 f8 a8 |
bf8 c8 bf2 bf4 |
bf2 ~ bf8 ef,8 g8 bf8 |
c2. bf8 c8 |

% B
d4. d16 d16 d8 d8 c8 bf8 |
d4 d4 ~ d8 d8 c8 bf8 |
c4 c8 c8 c8 d8 c8 bf8 |
c2. bf8 a8 |

bf8 bf8 ~ bf8 bf8 bf8 c8 a8 g8 |
bf4 bf2 g8 gs8 |
a4 a8 a8 a8 a8 g8 f8 |
a2. g4 |

% A2
f2 ~ f8 bf,8 d8 f8 |
g8 a8 g2 g4 |
g2 ~ g8 c,8 ef8 g8 |
a2. a4 |

a2 ~ a8 d,8 f8 a8 |
bf8 c8 bf2 bf4 |
bf2 ~ bf8 ef,8 g8 bf8 |
d2. c4 |

% C
bf8 bf8 ~ bf8 bf8 bf8 a8 g8 a8 |
bf4 bf2 bf8 c8 |
d4. d16 d16 d8 d8 c8 bf8 |
d,2. g4 |

bf2 ~ bf8 ef,8 g8 bf8 |
c4 d4 bf4 c4 | bf1 ~ | bf1 |

% Coda
bf4 f4 g8 f8 g8 bf8 |
c4 d4 f4 d4 |
c1
}


#(define WantChords #t)
#(define WantLyrics #t)
LyricsChoice = \Lyrics_English
#(define ChordRhythms #f)

\include "lead-sheet.ily"
