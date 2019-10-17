#include "mainframe.h"
#include "lib41.h"

;;; **********************************************************************
;;;
;;; Logical operations based on BCD encoded integers.
;;;
;;; BCDAND - logical and X,Y
;;; BCDOR  - logical or X,Y
;;; BCDXOR - logical xor X,Y
;;; BCDNOT - logical not X
;;;
;;; These routines work on BCD integers in X and Y, no word size or such
;;; is taken in account.
;;;
;;; **********************************************************************

              .pubweak BCDAND, BCDOR, BCDXOR, BCDNOT
              .section Lib41Code, noroot

              .name   "BCDNOT"
BCDNOT:       gsbp    XBCD2BIN
              c=-c-1                ; sets carry
              s0=1                  ; use FILLXL later
              s1=0
              goto    mask_and_return

              .name   "BCDAND"
BCDAND:       s5=0                  ; notify operation is AND
              goto    LOGA

              .name   "BCDOR"
BCDOR:        s5=1                  ; operation is OR
LOGA:         s6=0
              goto    LOGOM

              .name   "BCDXOR"
BCDXOR:
              s5=1                  ; operation is XOR
              s6=1

LOGOM:        c=regn  Y             ; get Y
              a=c
              gsbp    BCD2BIN       ; convert Y to binary
              m=c                   ; keep it away in M for a while
              gsbp    XBCD2BIN      ; read and convert X to binary
              s1=1                  ; use DROPST later
              a=c                   ; X --> A
              c=m                   ; Y --> C
              ?s5=1                 ; decode operation to perform
              gonc    1$
              ?s6=1
              goc     2$
              c=c|a                 ; perform OR
              goto    mask_and_return
2$:           m=c                   ; perform XOR
              c=c|a
              cmex
              c=c&a
              c=-c-1
              a=c
              c=m
1$:           c=c&a                 ; perform AND

mask_and_return:
              a=c                   ; result to A
              pt=     7             ; create 32 bits mask: 000000FFFFFFFF
              c=0     w
              c=c-1   wpt
              c=c&a                 ; mask result to 32 bits
              a=c                   ; move final result to A
              golp    AtoX10
