#include "mainframe.h"

;;; **********************************************************************
;;;
;;; ASHFX  - delete X characters from ALPHA
;;;
;;; **********************************************************************

              .pubweak ASHFX

              .section code, noroot
              .name   "ASHFX"
ASHFX:        c=regn  X
              gosub   BCDBIN
              m=c
              ldi     8
              pt=     3
              lc      6
              pt=     3
              a=c                   ; MM format of first ALPHA+1
10$:          ldi     5
              ?a<c    x
              rtnc
              gosub   NXBYTA
              c=0     xs
              ?c#0    x
              gonc    10$

;;; A[3:0] now points at the first character in alpha
20$:          ldi     5
              ?a<c    x
              rtnc
              cmex
              c=c-1   x
              rtnc
              cmex
              c=0     x
              gosub   PTBYTA
              gosub   INCADA
              goto    20$
