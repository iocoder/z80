; --------------------------------------------
;
; My First Z80 Program
; Mostafa Abdelaziz (iocoder@aol.com)
;
; --------------------------------------------
;

		INCLUDE "spectrum.inc"
		ORG		$8000

; --------------------------------------------

START:	; PRINT SOMETHING
		LD		A, 'H'
		RST		RST_PRINTA
		LD		A, 'E'
		RST		RST_PRINTA
		LD		A, 'L'
		RST		RST_PRINTA
		LD		A, 'L'
		RST		RST_PRINTA
		LD		A, 'O'
		RST		RST_PRINTA
		LD		A, ' '
		RST		RST_PRINTA
		LD		A, 'W'
		RST		RST_PRINTA
		LD		A, 'O'
		RST		RST_PRINTA
		LD		A, 'R'
		RST		RST_PRINTA
		LD		A, 'L'
		RST		RST_PRINTA
		LD		A, 'D'
		RST		RST_PRINTA
		LD		A, '!'
		RST		RST_PRINTA

		; HALT
		DI
		HALT

		; Routine End
		END 	START

; --------------------------------------------
