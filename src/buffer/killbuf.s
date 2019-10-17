#include "mainframe.h"
#include "lib41.h"

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
              .section Lib41Code, noroot

              .name   "KILLBUF"
KILLBUF:      gsbp    chkbufx
              rtn                   ; no such buffer
              c=0     s             ; mark buffer for removal
              data=c
              c=0     x             ; select chip 0
              dadd=c
              golong  PKIOAS        ; pack I/O area (and remove buffer)
