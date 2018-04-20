#include "mainframe.h"

;;; **********************************************************************
;;;
;;; LUHN? - the Luhn algorithm as used by credit card numbers
;;;
;;; IN: Y - upper part of the number as BCD encoded NNN
;;;     X - lower 14 digits of the number as BCD encoded NNN
;;;
;;; Out: In run mode, display YES or NO
;;;      In program, skip next line if checksum does not match
;;;
;;; This routine expects the number to be entered as BCD digits into
;;; Y and X. 14 digits fit into a register, so any digits above need
;;; to go to Y.
;;;
;;; Entering a number can be done in Alpha register and use CODE,
;;; or use Ladybug module. Set word size to 56 and hex mode, then
;;; just entered the BCD digits:
;;;     WSIZE 56
;;;     HEX
;;;     343232_ H
;;;     LUHN?
;;;
;;; Reference: https://en.wikipedia.org/wiki/Luhn_algorithm
;;;
;;; **********************************************************************

              .pubweak `LUHN?`

              .section code, noroot
              .name "LUHN?"
`LUHN?`:      c=regn  X
              setdec
              s7=1                  ; doing X
              a=0                   ; clear sum
              csr                   ; skip over checksum digit
              pt=     0
              s0=1                  ; double

5$:           bcex                  ; B= digits

10$:          c=0
              bcex    pt            ; take next digit
              bsr
              ?s0=1                 ; double?
              gonc    15$           ; no
              c=c+c                 ; yes
              s0=0
              goto    17$
15$:          s0=1                  ; double next time
17$:          a=a+c                 ; add to sum
              csr                   ; compensate for 10-digit
              c=-c    pt
              a=a-c
              ?b#0                  ; more digits?
              goc     10$           ; yes

              ?s7=1
              gonc    30$
              s7=0                  ; doing Y (also needed by SKP/NOSKP)
              c=regn  Y
              s0=0                  ; do not double next time
              goto    5$

30$:          b=a                   ; multiply by 9
              asl
              a=a-b
              c=regn  X             ; get orignal input
              ?a#c    pt            ; checksum OK?
              golnc   NOSKP
              golong  SKP
