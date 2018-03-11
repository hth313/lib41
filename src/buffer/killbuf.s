#include "mainframe.h"

;;; **********************************************************************
;;;
;;; KILLBUF - remove a buffer
;;;
;;; Mark the buffer specified in X for removal and pack the I/O buffer
;;; area.
;;;
;;; IN: X - buffer number (0 - 15)
;;;
;;; **********************************************************************

              .pubweak KILLBUF
              .section code, noroot

              .name   "KILLBUF"
KILLBUF:      gsbp    chkbufx
              goto    10$           ; no such buffer
              c=0     s             ; mark buffer for removal
              data=c
              c=0     x             ; select chip 0
              dadd=c
              golong  PKIOAS        ; pack I/O area (and remove buffer)

10$:          golong  ERRNE         ; NONEXISTENT


;;; **********************************************************************
;;;
;;; CHKBUFX - locate buffer as specified in X
;;;
;;; **********************************************************************

              .pubweak chkbufx
              .extern chkbuf
              .section code, noroot

chkbufx:      c=regn  X
              gosub   BCDBIN
              a=c     x
              ldi     16
              ?a<c    x
              golong  ERRNE         ; NONEXISTENT
              golp    chkbuf
