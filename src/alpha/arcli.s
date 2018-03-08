#include "mainframe.h"

;;; **********************************************************************
;;;
;;; ARCLI - append X to alpha as integer number
;;;
;;; **********************************************************************

              .pubweak ARCLI
              .section code, noroot

              .name   "ARCLI"
ARCLI:        c=regn  14            ;
              n=c                   ; N= flag register
              rcr     2
              c=0     xs            ; DSP 0
              cstex
              s7=1                  ; FIX
              cstex
              rcr     4
              cstex
              s2=0                  ; CF 29
              cstex
              rcr     8
              regn=c    14
              c=regn  X
              a=c
              a=a-1   s             ; check alpha data
              a=a-1   s
              goc     10$
              s5=1
              gosub   INTFRC        ; get integer part
10$:          bcex
              gosub   XARCL         ; append to alpha
              c=n                   ; restore flag register
              regn=c  14
              rtn
