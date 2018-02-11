#include "mainframe.h"

;;; **********************************************************************
;;;
;;; VMANT - View mantissa of X
;;;
;;; **********************************************************************

              .pubweak VMANT

              .section code, noroot
              .name   "VMANT"
VMANT:        c=regn  X
              gosub   CHK_NO_S      ; check ALPHA DATA
              sethex
              c=regn  d
              m=c
              pt=     4             ; FIX 9
              lc      9
              lc      8
              regn=c  d
              c=regn  X
              c=0     x             ; get mantissa
              c=0     s             ; abs(X)
              gosub   DSPCRG        ; display
              golong  STMSGF        ; set message flag
