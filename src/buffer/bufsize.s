#include "mainframe.h"
#include "lib41.h"

;;; **********************************************************************
;;;
;;; BUFSIZE - give the size of a buffer in number of registers
;;;
;;; IN: buffer number in X
;;; OUT: size or 0 if not found.
;;;
;;; **********************************************************************

              .pubweak BUFSIZE
              .section code, noroot

              .name   "BUFSIZE"
BUFSIZE:      gsbp chkbufx
              c=0                   ; (P+1) not found, return zero

              a=0
              rcr     10            ; C[1:0]= size
              c=0     xs            ; C[2:0]= size
              acex    x             ; A= size
                                    ; C.X= 0
              dadd=c                ; select chip 0
              golp     AtoXFill


;;; **********************************************************************
;;;
;;; BUF? - test for presence of a buffer
;;;
;;; The BUFSIZE routine could be used as an alternative by testing the
;;; result for zero.
;;;
;;; IN: buffer number in x
;;; OUT: size or 0 if not found.
;;;
;;; **********************************************************************

              .pubweak `BUF?`
              .section code, noroot

              .name   "BUF?"
`BUF?`:       s7=0
              gsbp    chkbufx
              goto    10$
              golong  NOSKP
10$:          golong  SKP
