#include "mainframe.h"

;;; **********************************************************************
;;;
;;; errorMessage - display an error message
;;;
;;; errorExit - exit with error
;;;
;;; **********************************************************************

              .pubweak displayERR, errorMessage, errorExit

              .section Lib41Code, noroot

displayERR:   gosub   MESSL
              .messl  " ERR"
errorExit:    gosub   LEFTJ
              s8=1
              gosub   MSG105
              golong  ERR110

errorMessage: gosub   ERRSUB
              gosub   CLLCDE
              golong  MESSL


;;; **********************************************************************
;;;
;;; noRoom - display NO ROOM error message
;;;
;;; **********************************************************************

              .section Lib41Code, noroot
              .pubweak noRoom
noRoom:       gsbp    errorMessage
              .messl  "NO ROOM"
              golp    errorExit
