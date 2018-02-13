#include "mainframe.h"

;;; **********************************************************************
;;;
;;; errorMessage - display an error message
;;;
;;; errorExit - exit with error
;;;
;;; **********************************************************************

              .pubweak displayERR, errorMessage, errorExit

              .section code, noroot

displayERR:   gosub   MESSL
              .messl  " ERR"
errorExit:    gosub   LEFTJ
              s8=1
              gosub   MSG105
              golong  ERR110

errorMessage: gosub   ERRSUB
              gosub   CLLCDE
              golong  MESSL