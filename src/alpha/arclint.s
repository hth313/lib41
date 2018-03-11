#include "mainframe.h"

;;; **********************************************************************
;;;
;;; ARCLI - append X to alpha as integer number
;;;
;;; **********************************************************************

              .pubweak ARCLINT
              .section code, noroot

              .name   "ARCLINT"
ARCLINT:      c=regn  14
              n=c                   ; N= flag register
              c=0                   ; FIX 0, CF 29
              pt=     3             ; (no alpha mode - return before ARGOUT)
              lc      8
              regn=c  14
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
              golong  NFRPU
