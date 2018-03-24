#include "mainframe.h"

;;; ************************************************************
;;;
;;; KEYFC - Read the keycode and jump to the corresponding
;;;       handler using a jump table.  Similar to KEY-FC in
;;;       the TIME module.
;;; IN: Key down, A[1:0] holds table length minus 1
;;;     S12 1= Long jump within same 1K
;;;       0= Short jump to table after
;;;     Last entry in table must be 000
;;;
;;; OUT: C.X=0 For digit entry
;;;
;;; USED: A(X&M), C(X&M), S12
;;;
;;; ************************************************************

              .section code, noroot
              .public KEYFCN, KEYFC

KEYFCN:       s12=0                 ; normal KEYFC
KEYFC:        acex    x             ; get table length
              c=0     m
              rcr     11            ; adjust to address field
              a=c     m             ; keep in A.M
              c=keys                ; read key
              rcr     3
              a=c     x
              c=stk                 ; get table address
1$:           cxisa                 ; read next keycode from table
              c=c+1   m             ; point to next entry
              ?c#0    x             ; end of table?
              gonc    2$            ; yes
              ?a#c    x             ; no, equal to key down?
              goc     1$            ; no
              c=0     x             ; yes
2$:           c=c+a   m             ; point to address
              ?s12=1                ; long jump ?
              goc     3$            ; yes
              gotoc                 ; no
3$:           s12=0                 ; get rid of private flag
              golong  GOLONG+1      ; do longjmp
