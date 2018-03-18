#include "mainframe.h"
#include "lib41.h"

;;; **********************************************************************
;;;
;;; ATOXR - rightmost character from alpha register to X
;;;
;;; Similar to ATOX in Extended Functions, but takes the rightmost
;;; character and return its numeric code to X.
;;;
;;; **********************************************************************

              .pubweak ATOXR
              .section code, noroot

              .name   "ATOXR"
ATOXR:        c=regn  M
              c=0     xs
              bcex                  ; B.X= rightmost char
              c=regn  M             ; shift alpha register 1 char right
              pt=     1
              a=c
              c=regn  N
              acex    wpt
              acex
              rcr     2
              regn=c  M
              c=regn  O
              acex    wpt
              acex
              rcr     2
              regn=c  N
              c=regn  P
              acex    wpt
              acex
              rcr     2
              regn=c  O
              c=regn  P
              rcr     6
              c=0     wpt
              rcr     10
              regn=c  P
              abex                  ; A.X= rightmost char
              golp    AXtoX
