#include "mainframe.h"
#include "lib41.h"

              .extern LBL_ALPHA, LBL_BITWISE, LBL_RANDOM
              .section FAT
XROMno:       .equ    17

              .con    XROMno        ; XROM number
              .con    (FatEnd - FatStart) / 2 ; number of entry points
FatStart:
              .fat    Header        ; ROM header
              FAT     ARCLINT
              FAT     ASHFX
              FAT     ATOXR
              FAT     XTOAL
              FAT     BCDAND
              FAT     BCDOR
              FAT     BCDXOR
              FAT     BCDNOT
              FAT     SEED
              FAT     RNDM
              FAT     2D6
              FAT     KILLBUF
              FAT     BUF?
              FAT     BUFSIZE
              .fatrpn LBL_ALPHA
              .fatrpn LBL_BITWISE
              .fatrpn LBL_RANDOM
FatEnd:       .con    0,0


;;; ************************************************************
;;;
;;; ROM header.
;;;
;;; ************************************************************

              .section code

              .name   "-LIB41 1A"   ; The name of the module
Header:       rtn


              .section poll
;;; **********************************************************************
;;;
;;; Poll vectors, module identifier and checksum
;;;
;;; **********************************************************************

              .con    0             ; Pause
              .con    0             ; Running
              .con    0             ; Wake w/o key
              .con    0             ; Powoff
              .con    0             ; I/O
              .con    0             ; Deep wake-up
              .con    0             ; Memory lost
              .text   "14TL"        ; Identifier LT-41
              .con    0             ; checksum position
