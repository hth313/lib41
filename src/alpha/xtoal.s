#include "mainframe.h"
#include "lib41.h"

;;; **********************************************************************
;;;
;;; XTOAL  - take character code from X and prepend to alpha register
;;;
;;; If alpha is full, this will shift alpha one position to the right.
;;;
;;; **********************************************************************

              .pubweak XTOAL

              .section code, noroot
              .name   "XTOAL"
XTOAL:        gsbp    `X<256`
              m=c                   ; M= character
              pt=     3             ; set up first address
              lc      6             ; for alpha   0x6008
              LDI     8
              a=c                   ; A= address
              ldi     24            ; C.X= max alpha length
              n=c
              pt=     3
              s0=0
10$:          c=n
              c=c-1   x
              goc     20$           ; alpha empty!!
              n=c
              gosub   NXBYTA        ; get next char
              c=0     xs
              ?c#0    x             ; null?
              goc     15$           ; no, leave loop
              s0=1                  ; yes, alpha not full
              goto    10$
15$:          ?s0=1
              gsubc   DECADA

;;; A[3:0] points to where we will PUT THE NEW CHARACTER.
              ?s0=1                 ; alpha full?
              goc     20$           ; no

;;; Alpha register is full, address to first position in alpha is in A[3:0]
;;; and M[1:0] contains the character to be inserted at the left end.
;;; Now shift alpha right one position.
              b=a                   ; save A
              ?s13=1
              gosub   TONE7X        ; give warning if not running
              abex                  ; restore A
              c=regn  P             ; shift alpha right
              pt=     1
              bcex    wpt
              rcr     2
              regn=c  P
              c=regn  O
              bcex    wpt
              rcr     2
              regn=c  O
              c=regn  N
              bcex    wpt
              rcr     2
              regn=c  N
              c=regn  M
              bcex    wpt
              rcr     2
              regn=c  M
              pt=     3
20$:          c=m
              golong  PTBYTA        ; store new character
