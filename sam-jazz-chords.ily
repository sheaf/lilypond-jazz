\version "2.24.4"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% My tweaks to https://github.com/OpenLilyPondFonts/lilyjazz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% TODO: see also https://github.com/martineausimon/lilypond-lib


% modification of the procedure "chordRootNamer"
%---- Definition of chord alterations -------
#(define (JazzChordNames pitch majmin)	;majmin is a required argument for "chordNamer", but not used here
  (let* ((alt (ly:pitch-alteration pitch)))(
   let* ((alt-ix (+ 2 (* 2 alt))))(
   let* ((alt-scale (vector-ref #(1.0 0.9 0 0.9 1.6) alt-ix)))(
   let* ((alt-raise (vector-ref #(0.6 0.7 0.8 0.8 -1.4) alt-ix)))(
   let* ((pitch-ix (ly:pitch-notename pitch)))(
    make-line-markup
      (list
	(make-simple-markup
	  (vector-ref #("C" "D" "E" "F" "G" "A" "B") pitch-ix)
  )
	(markup
    (if
      (= alt 0)
	    (markup "")
      ; Make the alteration relatively big, between super and normal-size-super
      (markup
        ; Move the alteration closer to some letters (A, D)
        #:hspace (vector-ref #(0 -0.1 0 0.1 0 -0.3 0) pitch-ix)
        #:hspace (vector-ref #(-0.4 -0.15 0 -0.2 -0.1) alt-ix)
        #:scale (cons alt-scale alt-scale)
        #:raise alt-raise
        #:normal-size-super
        (make-simple-markup
        	(vector-ref #("𝄫" "♭" "" "♯" "𝄪") alt-ix)
        )
        ; Make the alteration width 0 because it's a superscript,
        ; which means it doesn't overlap with the subscript.
        #:hspace (vector-ref #(-1.7 -1.0 0 -0.9 -1.4) alt-ix)

        ; Re-adjust for per-letter alteration adjustement
        #:hspace (vector-ref #(0 0.2 0 0 0 0.4 0) pitch-ix)
      )
    )
    ; Manual kerning adjustments
    #:hspace (vector-ref #(0 -0.1 0 -0.3 0 0.1 0) pitch-ix)
  )
))))))))

#(define-markup-command (csub layout props arg) (string?)
  (interpret-markup layout props
    (markup #:raise 0.75 (markup #:sub arg))))

%----- markup commands to make it easier to write chords -----

#(define-markup-command (acHalf layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "ø" #:csub extension)))

#(define-markup-command (acDim layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "o" #:csub extension)))

#(define-markup-command (acMin layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "m" #:csub extension)))

#(define-markup-command (acMaj layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "Δ" #:csub extension)))

#(define-markup-command (acMinMaj layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "m" #:csub "Δ" #:csub extension)))

#(define-markup-command (acAug layout props extension) (string?)
  (interpret-markup layout props
    (markup #:csub "+" #:csub extension)))

%{
% for chords with up to three alterations, stacked on top of each other
#(define-markup-command (acAlt layout props strA strB strC) (string? string? string?)
  (interpret-markup layout props
    (markup
      #:csub strA
      #:fontsize 1.5 "["
      #:fontsize -4
      #:raise -1.2
      #:column (strB strC)
      #:fontsize 1.5 "]"
    )
  )
)
%}


JazzChordsList = {
% 3 notes
  <c es ges>-\markup { \acDim #"" } % :dim
  <c es g>-\markup { \acMin #"" } % :m
  <c e ges>-\markup { \csub #"♭5" } % :5-
  <c e gis>-\markup { \acAug #"" } % :aug
  <c es gis>-\markup { \acMin #"♭5" } % :m5+ (Ab/C)

% minor third chords - 4 notes
  <c es ges beses>-\markup { \acDim #"7" } % :dim7
  <c es g a>-\markup { \acMin #"6" } % :m6
  <c es ges bes>-\markup { \acHalf #"7" } % :m7.5-
  <c es g bes>-\markup { \acMin #"7" } % :m7
  <c es gis bes>-\markup { \acMin #"7♯5" } % :m7.5+
  <c es g b>-\markup { \acMinMaj #"7" } % :m7+
  <c es g d'>-\markup { \acMin #"add9" } % :m5.9

% major 7 chords
  <c e g b>-\markup { \acMaj #"7" } % :maj7
  <c e g b fis'>-\markup { \acMaj #"7♯11" } % :maj7.11+
  <c e g b d'>-\markup { \acMaj #"9" } % :maj9
  <c e g b d' fis'>-\markup { \acMaj #"9♯11" } % :maj9.11+
  <c e g b d' a'>-\markup { \acMaj #"13" } % :maj13
  <c e g b d' fis' a'>-\markup { \acMaj #"13♯11" } % :maj13.11+
  <c e g b d' f'>-\markup { \acMaj #"11" } % :maj11

% #5/b5 major chords
  <c e ges b>-\markup { \acMaj #"7♭5" } % :maj.5-
  <c e gis b>-\markup { \acMaj #"7♯5" } % :maj.5+

% minor third chords - 5+ notes
  <c es g a d'>-\markup { \acMin #"6/9" } % :m6.9
  <c es g bes d'>-\markup { \acMin #"9" } % :m9
  <c es ges bes d'>-\markup { \acHalf #"9" } % :m9.5-
  <c es g b d'>-\markup { \acMinMaj #"9" } % :m9.7+
  <c es g bes f'>-\markup { \acMin #"11" } % :m7.11
  <c es g bes a'>-\markup { \acMin #"13" } % :m7.13
  <c es g bes d' f'>-\markup { \acMin #"11" } % :m11
  <c es ges bes f'>-\markup { \acHalf #"11" } % :m7.11.5-
  <c es g bes d' f' a'>-\markup { \acMin #"13" } % :m13

% major third chords - 5 notes
  <c e g d'>-\markup { \csub #"(9)" } % :5.9
  <c e g a d'>-\markup { \csub #"6/9" }	% :6.9

% dominant chords
  <c e g bes>-\markup { \csub #"7" } % :7
  <c e g bes d'>-\markup { \csub #"9" } % :9
  <c e g bes d' a'>-\markup { \csub #"13" } % :9.13
  <c e g bes d' aes'>-\markup { \csub #"9♭13" } % :9.13-

% altered dominant chords
  <c e ges bes>-\markup { \csub #"7♭5" } % :7.5-
  <c e gis bes>-\markup { \csub #"7♯5" } % :7.5+
  <c e g bes des'>-\markup { \csub #"7♭9" } % :9-
  <c e g bes d' fis'>-\markup { \csub #"9♯11" } % :9.11+
  <c e g bes dis'>-\markup { \csub #"7♯9" } % :9+
  <c e g bes fis'>-\markup { \csub #"7♯11" } % :7.11+
  <c e g bes aes'>-\markup { \csub #"7♭13" } % :7.13-
  <c e g bes d' a' >-\markup { \csub #"13" } % :13
  <c e g bes des' a' >-\markup { \csub #"13♭9" } % :13.9-
  <c e g bes des' aes' >-\markup { \csub #"7♭9♭13" } % :8.9-.13-
  <c e g bes d' a' fis'>-\markup { \csub #"13♯11" } % :13.11+

  % hack for b9#9
  <c e g bes cis' dis'>-\markup { \csub #"7♭9♯9" } % :7.8+.9+
  <c e g bes cis' dis' a'>-\markup { \csub #"13♭9♯9" } % :13.8+.9+
  <c e g bes cis' dis' aes'>-\markup { \csub #"♭9♯9♭13" } % :13-.8+.9+

% suspended chords
  <c d g>-\markup { \csub #"sus2" } % :sus2
  <c f g>-\markup { \csub #"sus4" } % :sus4
  <c f g bes>-\markup { \csub #"7sus4" } % :sus4.7
  <c f g bes d'>-\markup { \csub #"9sus" } % :sus4.7.9
  <c f g a>-\markup { \csub #"6sus" } % :sus4.6
  <c f g bes a'>-\markup { \csub #"13sus" } % :sus4.7.13
  <c f g a'>-\markup { \csub #"13sus" } % :sus13
  <c f g bes des'>-\markup { \csub #"7sus4♯9" } % :sus4.7.9-
  <c f g bes des' a'>-\markup { \csub #"13sus♯9" } % :sus4.7.13.9-
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

% variable needed to use chord exceptions
JazzChords = #(append (sequential-music-to-chord-exceptions JazzChordsList #t) ignatzekExceptions)

% modify the default ChordNames context
\layout {
  \context {
    \ChordNames
    chordRootNamer = #JazzChordNames	% update the chord names
    chordNameExceptions = #JazzChords	% update the chord exceptions

    % Set chord symbol font
    \override ChordName.font-name = "Academico, Bold"
    \override ChordName.font-size = #2.3

  }
}
