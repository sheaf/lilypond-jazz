
\version "2.24.4"

\include "sam-jazz-chords.ily"

\language "english"

title = "Something Heavy"
composer = "Jacob Collier"
arranger = "Sam Derbyshire"
scoreRoot = bf
rootChoice = bf
numPages = 0
staffSize = 20.0
lyricsSize = -1.0
WantLyrics = ##t
WantChords = ##t
WantMelody = ##t

Form = {

  \tempo 4=70
  \numericTimeSignature\time 4/4

  \repeat unfold 2 {

  \mark \markup { \bold \rounded-box { "I" } } \section
  s1*4 \break

  \mark \markup { \bold \rounded-box { "A1" } } \section

  \repeat unfold 2 { s1*4 \break }

  \mark \markup { \bold \rounded-box { "A2" } } \section
  \repeat unfold 2 { s1*4 \break }

  \mark \markup { \bold \rounded-box { "B" } } \section
  \repeat unfold 2 { s1*4 \break }

  }

  \mark \markup { \bold \rounded-box { "A1'" } } \section
  \repeat unfold 2 { s1*4 \break }

  \mark \markup { \bold \rounded-box { "A2'" } } \section
  \repeat unfold 2 { s1*4 \break }
  s1*6 \break

  \mark \markup { \bold \rounded-box { "B'" } } \section
  s1*4 \break
  s1*6 \break
  s1*4 \bar "|."
}


Chords = \chordmode {
  % Only display the chord when it changes
  \set chordChanges = ##t
  \set noChordSymbol = ""

  \repeat unfold 4 { bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 }
  | ef2:maj9 f2:3.5.9/ef | ef2:maj9 f2:3.5.9/ef |
  | bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |

  | bf:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |
  | bf:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |
  | ef2:maj9 f2:3.5.9/ef | ef2:maj9 f:sus4.7.9 |
  | bf2:3.5.9  f/bf | bf2:3.5.9 ~ 8 f4.:sus4.7.9 |

  | ef1:maj9 | f2:3.5.9.11 bf:/f | ef1:maj9 | f2:3.5.9.11 bf:/f |
  | ef2:maj9 f2:/ef | bf:3.5.9/d g:m7 | c1:m11 ~ | c2:m11 f2:sus4.7.9 |


  \repeat unfold 4 { bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 }
  | ef2:maj9 f2:3.5.9/ef | ef2:maj9 f2:3.5.9/ef |
  | bf:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |

  | bf:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |
  | bf:3.5.9 bf:6.9 | bf:maj9 bf:9 |
  | ef:maj7 ef:m6 | ef:maj7 f:sus4.7.9 |
  | bf:6.9 f/bf | bf:6.9 c4:m7 bf4:/d |

  | ef1:maj9 | f2:3.5.9.11 bf:6.9 | ef1:maj9 | f2:3.5.9.11 g:m7 |
  | ef2:maj9 f2:/ef | bf:3.5.9/d g:m7 | c1:m11 ~ | c2:m11 f2:sus4.7.9 |

  % A1'
  \repeat unfold 2 { bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 }
  | ef2:maj9 f2:3.5.9/ef | ef2:maj9 f2:3.5.9/ef |
  | bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |

  % A2'
  \repeat unfold 4 { bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 }
  | ef2:maj9 f2:3.5.9/ef | ef2:maj9 f2:sus4.7.9 | |
  | bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 |
  | bf2:3.5.9 bf:6.9 | bf:maj9 c4:m7 bf4:/d |

  % B'
  | ef1:maj9 | f1:3.5.9.11  | ef1:maj9 | f2:3.5.9.11 g:m7 |
  | ef2:maj9 f2:/ef | bf:3.5.9/d g:m7 | c1:m11 ~ | c2:m11 f2:sus4.7.9 |
  | c1:m11 ~ | c2:m11 f2:sus4.7.9 |
  \repeat unfold 2 { bf2:3.5.9 bf:6.9 | bf:maj9 bf:6.9 }

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


Melody = \relative bf' {
\clef "treble"
\key bf \major

  | R1*3 |
  | r2 r8 bf8 a16 g16 f8
  | g8 f8 ~ 2 r4 |

  | r2 r8. bf16 a8. g16 f16 g16 f8 ~ f2 r4

  | r2 r8 bf,8 f'8 d8 ~ | 4. c8 ~ 2 | r2 r4 \ottava #-1 g16 g16 f8 ~ |
  | 8 \scoop d'8 ~ 2. | \ottava #0 r2 r8. bf'16 ( a8. ) g16 |

  % A2
  | f16 g16 ~ g16 f16 ~ 2 r4 |
  | r2 r8 bf,16 bf'16 ~ bf8. a16 |
  | g16 f16 g8 f8. ( ef16 d4 ) r4 |
  | r2 r8 bf8 f'8 d8 ~ | d4. c8 ~ 2 |
  | r2. \ottava #-1 g16 g16 f8 ~ | 2 \ottava #0 r2 |
  | r4. bf'8 d8 f8 ~ 8 g8 ~ |

  % B
  | 4.. f16 g16 f16 g8 ~ g16 f16 f8 ~ | 8 d4. \breathe r8 bf16 d16 ~ 16 f g8 ~ |
  | 4.. f16 g f g8 d f ~ |
  | f4. r8 \breathe r8 bf,16 \acciaccatura a'8 ( bf16 ) ~ 16 a8. |
  | g4. g16 f g f g8. f16 f8 ~ |
  | 8 d4. \breathe r8 bf8 f'8 ef8 ~ |
  | 4. ~ ( 16 d16 c8. bf8. g8 ~ ) |
  | 4 \breathe r8. f16 g8 g g16 f f8 ~ | \pageBreak

  % I
  | 2 r2 | R1*2 |
  | r2 r8 bf8 ~ bf8 a16 g16 |

  % A1
  | g16 f8. ~ 16 d16 f8 ~ 4 r4 |

  | r2 r8. bf16 ~ 16 a16 g8 (f8.) f16 d16 g16 f f ~ f8 (d4.) |

  | r2 r8 bf8 f'8 d8 ~ | 4. c8 ~ 2 | r2 r8. \ottava #-1 g16 g16 g16 f8 ~ |
  | 8 \scoop d'8 ~ 2. | \ottava #0 r2 r8 bf'8 ~ 8 a16 g16 |

  % A2
  | g16 f4.. ~ 4 r4 |
  | r2 r4 bf16 a8 g16 |
  | g16 f4.. ~ 4 r4 |
  | r2 r8 bf,8 f'16 d16 d8 ~ | d4. c8 ~ 2 |
  | r2 \ottava #-1 g16 g16 g8 g16 g16 f8 ~ | 1 \ottava #0 |
  | r4. bf'8 d8 f8 ~ 8 g8 ~ |

  % B
  | 2 g16 f16 g8 ~ g16 f16 f8 ~ | 8 d4. \breathe r8 bf16 d16 ~ 16 f g8 ~ |
  | 4.. f16 g f g8 d f ~ |
  | f4. r8 \breathe r8 bf,16 \acciaccatura a'8 ( bf16 ) ~ 16 a8. |
  | g4. g16 f g f g8. f16 f8 ~ |
  | 8 d4. \breathe r8 bf8 f'8 ef8 ~ |
  | 4. ~ ( 16 d16 c8. bf8. g8 ~ ) |
  | 4 \breathe r8. f16 g8 g g16 f f8 ~ | \pageBreak

  % A1'
  | 8 d'4. ~ 8 f4. ~ | 4 r4 r8 g8 f16 f8. ~ |
  | 8  d'4. ~ ( 4 ~ 16 c ~ 8 ~  16 g f8 ~ 8 ef8 ~ 16 d16 c8 ~ 16 f, g f ) ~ 1 |
  | R1 * 2 | r2 r8 bf8 ~ 8 a16 g16 |

  % A2'
  | f8 g8 f4 ~ 4 r4 |
  | r2 r8 bf8 a16 g16~ 16 f16 |
  | g16 f4.. ~ 4 r4 |
  | r2 r8 bf,8 bf'16 a16 g8 | f8 g8 f2 r4 |
  | r2. bf16 a16 g8 ~ | 8 f16 d f2. |
  | r2 r8 bf,8 \appoggiatura ef (f8.) \bendAfter #-2 c16 | d4. c8 ~ c2 |
  | r2 \ottava #-1 g8 8 16 16 f8 ~ | 2 \ottava #0 r2 |

  | R1 * 2 | r4. bf'8 d8 f8 ~ 8 g8 ~ |

  % B'
  | 4.. d16 g16 f16 g8 ~16 f16 f8 ~ | 8 d4. \breathe r8 bf8 d8 f16 g16 ~ |
  | 4.. f16 g f f8 ~ f16 d16 f8 ~ |
  | f4. r8 \breathe r8 bf,16 \acciaccatura a'8 ( bf16 ) ~ 16 a8. |
  | g4.. f16 g f g8. f16 f8 ~ |
  | 8 d4. \breathe r8 bf8 f'8 ef8 ~ |
  | 4. ~ ( 16 d16 c8. bf8. g8 ~ ) |
  | 4 r4 \breathe r8 bf8 f'4  |
  | ef4. ~ ( 16 d16 c8. bf8. g8 ) ~ |
  | 4 r8. f16 g8 g16 g16 ~ g16 f16 f8 ~ | f2 r2 |
  | R1 * 3 |

}

LyricsEnglish= \lyricmode {
I've been hol -- ding some -- thin'
Some -- thin' kin -- da he -- avy
So let go now
Let it go now
You're ge -- ttin' ol -- der
The world's a li -- ttle sma -- ller
Just let go now
Let it go

Well e -- very time I feel a weight u -- pon me
I hold a line to keep it all in -- side
And all my life
You've been hol -- ding on be -- side me
and I know... it's time to let it go

I'm go -- nna give you the moon
Hold your hand like a big ba -- lloo~n
Don't let go now
Don't let it go now
Light as a fea -- ther
I'm rea -- lly some -- one
Don't let me go now
ne -- ver gonna let you go
And e -- very time I build a wall around me
You hold a line to pull me back to life
And all this time, you ne -- ver stopped thin -- king of me, but I know...
it's time to let it go now ooh
let it go ooh

I've been fee -- ling some -- thing
Since the day you left me
I'm si -- tting on your shoul -- ders
I'm on top of the world
Don't let me go now please don't let me go
And in my mind you throw your arms a -- round me
I find a way to bring you back to life
And all this time
I di -- dn't let you love me, but I know...
now I know... it's time to let you go

}

LyricsChoice = \LyricsEnglish
\include "lead-sheet.ily"
