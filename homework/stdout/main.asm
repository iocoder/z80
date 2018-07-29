; --------------------------------------------
;
; Routines for printing text 
; Mostafa Abdelaziz (iocoder@aol.com)
;
; --------------------------------------------
;

        INCLUDE "spectrum.inc"
        ORG     $8000

; --------------------------------------------

START   ; CLEAR SCREEN

        CALL  CLS

        ; PRINT SOMETHING
        LD      HL, STRHEL
        CALL    PRINTS

        ; PRINT NUM
        LD      HL, $AB12
        CALL    PRINTXX

        ; PRINT NL
        LD      A, NL
        CALL    PRINTC

        ; PRINT REG DUMP
        LD      A, $01
        LD      B, $02
        LD      C, $03
        LD      D, $04
        LD      E, $05
        LD      H, $06
        LD      L, $07
        LD      IX, $0809
        ;LD     IY, $0A0B
        CALL    DUMP

        ; DONE
        RET

STRHEL  DEFB    "HELLO WORLD! ", 0

; --------------------------------------------

CLS     ; CLEAR SCREEN
        CALL    ROM_CLS
        ; OPEN CHANNEL 2
        LD      A, $02
        CALL    ROM_CHANN_OPEN
        ; DONE
        RET

; --------------------------------------------

PRINTC  ; PRINT CHAR FROM A
        RST     RST_PRINTA
        RET

; --------------------------------------------

PRINTS  ; PRINT STRING AT HL
        LD      A, (HL)
        OR      A
        ; RET IF $00 encountered
        RET     Z
        ; PRINT A
        CALL    PRINTC
        ; NEXT CHAR
        INC     HL
        JP      PRINTS

; --------------------------------------------

PRINTX  ; PRINT HEXADECIMAL NUMBER IN A
        PUSH    AF
        ; PRINT UPPER HALF
        SRL     A
        SRL     A
        SRL     A
        SRL     A
        CP      $0A
        JR      C, DIG1
        ADD     A, $37
        CALL    PRINTC
        JR      NXT1
DIG1    ADD     A, $30
        CALL    PRINTC
NXT1    ; RESTORE A
        POP     AF
        ; PRINT LOWER HALF
        AND     $0F
        CP      $0A
        JR      C, DIG2
        ADD     A, $37
        CALL    PRINTC
        JR      NXT2
DIG2    ADD     A, $30
        CALL    PRINTC
NXT2    ; DONE
        RET

; --------------------------------------------

PRINTXX ; PRINT HEXADECIMAL NUMBER IN HL
        PUSH    AF
        ; PRINT H
        LD      A, H
        CALL    PRINTX
        ; PRINT L
        LD      A, L
        CALL    PRINTX
        ; RESTORE A
        POP     AF
        ; DONE
        RET

; --------------------------------------------

DUMP    ; PRINT REGISTER DUMP
        LD      (SPCPY), SP
        ; PRINT HEADER
        PUSH    HL
        PUSH    AF
        LD      HL, REG1
        CALL    PRINTS
        POP     AF
        POP     HL
        ; PRINT 8BIT REGISTERS
        PUSH    AF
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, B
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, C
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, D
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, E
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, H
        CALL    PRINTX
        LD      A, ' '
        CALL    PRINTC
        LD      A, L
        CALL    PRINTX
        POP     AF
        ; PRINT LINE 2
        PUSH    HL
        PUSH    AF
        LD      HL, REG2
        CALL    PRINTS
        POP     AF
        POP     HL
        ; PRINT 16BIT REGISTERS
        PUSH    HL
        PUSH    AF
        LD      HL, (SPCPY)
        CALL    PRINTXX
        LD      A, ' '
        CALL    PRINTC
        LD      A, ' '
        CALL    PRINTC
        PUSH    IX
        POP     HL
        CALL    PRINTXX
        LD      A, ' '
        CALL    PRINTC
        LD      A, ' '
        CALL    PRINTC
        PUSH    IY
        POP     HL
        CALL    PRINTXX
        POP     AF
        POP     HL
        ; PRINT LINE 3
        PUSH    HL
        PUSH    AF
        LD      HL, REG3
        CALL    PRINTS
        POP     AF
        POP     HL
        ; DONE
        RET

REG1    DEFB    NL
        DEFB    "-----------------------", NL
        DEFB    "     REGISTER DUMP     ", NL
        DEFB    "-----------------------", NL
        DEFB    "A  B  C  D  E  H  L", NL, 0
REG2    DEFB    NL
        DEFB    "-----------------------", NL
        DEFB    "SP    IX    IY", NL, 0
REG3    DEFB    NL
        DEFB    "-----------------------", NL
        DEFB    NL, 0

SPCPY   DEFW    $0000

; --------------------------------------------

        ; SPECIAL CHARS
NL      EQU     $0D
INK     EQU     $10
PAPER   EQU     $11
FLASH   EQU     $12
AT      EQU     $22

; --------------------------------------------

        ; END PROGRAM
        END     START
