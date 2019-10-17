#ifdef OS4
#include "OS4.h"
#endif
#include "mainframe.h"
#include "lib41.h"

XASN05:       .equlab 0x27ad        ; unofficial entry point

;;; **********************************************************************
;;;
;;; MKXYZ - make key by X Y Z
;;;
;;; IN: Z - prefix
;;;     Y - postfix
;;;     X - keycode
;;;
;;; This is a mcode version of the very popular MK (PPC ROM) and
;;; MKX (with extended functions).
;;; This version does not harm the buffers and it is fast too!!
;;;
;;; Note: Code is heavily borrowed from Extended Funtions module.
;;;
;;; **********************************************************************

              .pubweak MKXYZ, Assign2
              .section Lib41Code, noroot

              .name   "MKXYZ"
MKXYZ:        c=regn  z
              gosub   BCDBIN
              rcr     12
              cbex                  ; save fcn in B
              c=regn  y
              gosub   BCDBIN
              pt=      1
              cbex    wpt

;;; **********************************************************************
;;; Get the keycode and transform it into the internal keycode
;;; format. This code was borrowed from the extended functions
;;; module.
;;; **********************************************************************

              c=regn  x
              ?c#0    xs
              gonc    MKX10
MKXERR:
#ifdef OS4
              gosub errorMessage
#else
              gsbp    errorMessage  ; key code error
#endif
              .messl  "KEYCODE ERR"
#ifdef OS4
              golong  errorExit
#else
              golp    errorExit
#endif

MKX10:        a=c
              c=c-1   x             ; X<10?
              goc     MKXERR
              c=c-1   x             ; X>99?
              gonc    MKXERR
              rcr     11            ; C[1]=row C[0]=column
              a=c     x
              pt=     0
              ?c#0    pt            ; column = 0?
              gonc    MKXERR
              ldi     0x90
              pt=     1
              ?a<c    pt            ; row <= 8?
              gonc     MKXERR
              ldi     0x46
              ?a<c    pt
              goc     MKX15
              c=c-1   x
MKX15:        pt=     0
              ?a<c    pt
              gonc    MKXERR
              lc      1
              pt=     1
              ?a#c    pt
              goc     MKX20
              ?a#c    wpt
              gonc    MKX20
              a=a+1   wpt
MKX20:        a=a-1   x
              acex    x
              a=c     x
              csr     x
              asl     x
              acex    pt
              a=c     x
              ?a#0    s
              gonc    Assign2
              ldi     8
              a=a+c   x

;;; **********************************************************************
;;;
;;; Assign2 - this routine will assign any 2 byte function to a given key
;;;
;;; IN: A[1:0] - logical keycode
;;;     B[3:0] - 2-byte function to be assigned
;;;
;;; Possible error: Packing, Try Again
;;;
;;; Uses: A, B, C, N, M, S0-S9
;;;       P[13:10],LAZY T[3:0] (but NOT the Q register!!)
;;;
;;;;************************************************************

Assign2:      gosub   ENCP00
              pt=     3             ; store fcn in P[13:10]
              c=regn  P
              rcr     10
              c=b     wpt
              rcr     4
              regn=c  P
              c=regn  10            ; store keycode
              acex    wpt
              regn=c  10

;;;*************************************************************
;;; Test if the key already is assigned, if so delete the
;;; old assignment.
;;;*************************************************************
              a=c     wpt
              gosub   TBITMA
              ?c#0                  ; key taken?
              gonc    ASN02         ; no
              c=regn  10            ; clear keycode
              a=c
              s1=1
              gosub   GCPKC         ; clear the key
              gonc     .+3
ASN02:        gosub   SRBMAP        ; set bit
              c=regn  P             ; get the fcn again
              rcr     10
              cbex
              c=regn  10            ; and the keycode
              a=c
              asl
              asl
              golong  XASN05        ; assign it
