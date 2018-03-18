;;; **********************************************************************
;;;
;;; Lib41 exports.
;;;
;;; This file is part of the Lib41 project which aims to collect many
;;; useful routines for the HP-41, suitable for making your own modules.
;;;
;;; Refer to the documentation for more details about the routines,
;;; or inspect the source.
;;;
;;; **********************************************************************

#ifndef __LIB41__
#define __LIB41__

;;; **********************************************************************
;;;
;;; Macros for FAT entries which also defines the special label needed
;;; for local used from RPN code.
;;;
;;; **********************************************************************

#define LFE(x)  `FAT entry: \x`

FAT:          .macro  entry
              .public LFE(entry)
LFE(entry):   .fat    `\entry`
              .endm


;;; **********************************************************************
;;;
;;; Alpha operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern ARCLINT, ASHFX, ATOXR, XTOAL


;;; **********************************************************************
;;;
;;; Assignment operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern ASNOFF, MAPKEYS, MKXYZ


;;; **********************************************************************
;;;
;;; Bitwise operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern BCDAND, BCDOR, BCDXOR, BCDNOT


;;; **********************************************************************
;;;
;;; Buffer operations.
;;;
;;; **********************************************************************

              ;; Support routines
              .extern chkbuf, chkbufx

              ;; Named routines
              .extern BUFSIZE, `BUF?`, KILLBUF


;;; **********************************************************************
;;;
;;; Execution control operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern `XEQ>GTO`, `PC<>RTN`, `RTN?`, GE


;;; **********************************************************************
;;;
;;; Conversion related.
;;;
;;; **********************************************************************

              ;; Support routines
              .extern AXtoX, AtoX, AtoXDrop
              .extern BCD2BIN, XBCD2BIN
              .extern `X<256`, `X<999`, `A<999`

              ;; Named routines
              .extern CODE, DECODE


;;; **********************************************************************
;;;
;;; Pseudo random numbers related.
;;;
;;; **********************************************************************

              ;; Support routines
              .extern RNDM0, RNDMA, StoreSeed

              ;; Named routines
              .extern `RNDM`, `SEED`, `2D6`


;;; **********************************************************************
;;;
;;; Stack operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern APX, VMANT


;;; **********************************************************************
;;;
;;; Utilities.
;;;
;;; **********************************************************************

              .extern displayERR, errorMessage, errorExit
              .extern noRoom

#endif // __LIB41__
