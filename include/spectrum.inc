; --------------------------------------------
;
; ZX Spectrum Header File
; Mostafa Abdelaziz (iocoder@aol.com)
;
; --------------------------------------------
;

; --------------------------------------------
;   ROM RESTART ROUTINES
; --------------------------------------------

; RST_START:
; ----------
; - DESCR:      ROM Entry point
; - INPUTS:     N/A
; - OUTPUTS:    N/A
RST_START:		EQU		$00

; RST_ERROR:
; ----------
; - DESCR:      ?
; - INPUTS:     N/A
; - OUTPUTS:    N/A
RST_ERROR:		EQU		$08

; RST_PRINTA:
; -----------
; - DESCR:      Print character
; - INPUTS:     [A]: Character to print
; - OUTPUTS:    N/A
RST_PRINTA:	    EQU		$10

; RST_GETCHAR:
; ------------
; - DESCR:      If buf[cur] is a pintable character, return buf[cur] in A, 
;               otherwise, increase cur and keep looping until we find a 
;               printable char.
; - INPUTS:     N/A
; - OUTPUTS:    [A]: first printable char in buffer.
RST_GETCHAR:    EQU		$18

; RST_NEXTCHAR:
; -------------
; - DESCR:      Increase buffer pointer (cur) then jump to ROM_GETCHAR
; - INPUTS:     N/A
; - OUTPUTS:    [A]: next printable char in buffer.
RST_NEXTCHAR:	EQU		$20

; RST_FPCALC:
; -----------
; - DESCR:      Enable FP Calculator
; - INPUTS:     N/A
; - OUTPUTS:    N/A
RST_FPCALC:		EQU		$28

; RST_BCSPACES:
; -------------
; - DESCR:      Allocate free space
; - INPUTS:     [BC]: Number of locations
; - OUTPUTS:    ?
RST_BCSPACES:	EQU		$30

; RST_MASKINT:
; -------------
; - DESCR:      Timer Interrupt: increase RTC and scan keyboard
; - INPUTS:     N/A
; - OUTPUTS:    N/A
RST_MASKINT:	EQU		$38

; --------------------------------------------
;   ROM SCREEN ROUTINES
; --------------------------------------------
ROM_CLS     	EQU		$0D6B
ROM_CL_ALL		EQU		$0DAF
ROM_CHANN_OPEN	EQU		$1601
