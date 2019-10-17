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
#define FATOFF(x) (LFE(x) - FatStart) / 2

FAT:          .macro  entry
              .public LFE(entry)
LFE(entry):   .fat    `\entry`
              .endm

FATRPN:       .macro  entry
              .public LFE(entry)
LFE(entry):   .fatrpn `\entry`
              .endm

;;; RPN function when compiled with a prefix
prefixFATRPN  .macro  prefix, entry
              .public LFE(entry)
LFE(entry):   .fatrpn `\prefix\entry`
              .endm

;;; Make it easy to populate a key table
KeyEntry:     .macro  fun
              .con   FATOFF(fun)
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
#ifndef OS4_H
              .extern chkbuf, chkbufx
#endif
              ;; Named routines
              .extern BUFSIZE, `BUF?`, KILLBUF


;;; **********************************************************************
;;;
;;; Checksum operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern `LUHN?`


;;; **********************************************************************
;;;
;;; Conversion related.
;;;
;;; **********************************************************************

              ;; Support routines
              .extern AXtoX, AtoX, AtoX10, AtoXDrop, AtoXFill
              .extern BCD2BIN, XBCD2BIN
              .extern `getX<256`, `getX<999`, `getA<999`

              ;; Named routines
              .extern CODE, DECODE


;;; **********************************************************************
;;;
;;; Execution control operations.
;;;
;;; **********************************************************************

              ;; Named routines
              .extern `XEQ>GTO`, `PC<>RTN`, `RTN?`, GE


;;; **********************************************************************
;;;
;;; Input
;;;
;;; **********************************************************************

              ;; Support routines
              .extern KEYFC

              ;; Named routines
              .extern `Y/N?`


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

#ifndef OS4_H
              .extern displayERR, errorMessage, errorExit
              .extern noRoom
#endif

#endif // __LIB41__
