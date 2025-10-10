#(set-global-staff-size 20.0)

\include "sam-jazz-chords.ily"

\version "2.24.4"
\pointAndClickOff


% A4 paper layout
\paper {
    paper-width = 21.0\cm
    paper-height = 29.7\cm
    top-margin = 1\cm
    bottom-margin = 1.5\cm
    left-margin = 1.2\cm
    right-margin = 1.1\cm
    between-system-space = 1.5\cm
    indent = 1.5\cm
}

\layout {
  % Set indentation of first line
  indent = 0.0

  % Adjust rehearsal mark position
  \override Score.RehearsalMark.break-align-symbols = #'('staff-bar)
  \override Score.Clef.break-align-anchor-alignment = #0

  % Set chord symbol font
  \override ChordName.font-name = "Academico"
  \override ChordName.font-size = #2.5

  \context { \Score

    % Hide bar numbers
    \remove "Bar_number_engraver"

    % Add an initial barline on all staves
    \override SystemStartBar.collapse-height = 1
    \override SystemStartBar.transparent = ##f

    % Hide clef and key signature on subsequent staves
    \override Clef.break-visibility = #'#(#f #f #f)
    \override KeySignature.break-visibility = #'#(#f #f #f)
  }

}

% Code for rootless slash chords
#(define (rootless-chord-names in-pitches bass inversion context)
   (ignatzek-chord-names `(,(ly:make-pitch 0 0 0) ,(ly:make-pitch 0 0 0)) bass inversion context))
#(define (empty-namer pitch lower?) (make-simple-markup "﹘"))
retainChordNoteNamer =
\applyContext
  #(lambda (context)
     (let ((rn (ly:context-property context 'chordRootNamer)))
       (ly:context-set-property! context 'chordNoteNamer rn)))
rl = {
  \retainChordNoteNamer
  \once \set chordNameFunction = #rootless-chord-names
  \once \set chordRootNamer = #empty-namer
}
