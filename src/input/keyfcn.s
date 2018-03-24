#include "mainframe.h"

;;; ************************************************************
;;;
;;; KEYFC - table dispatch on key
;;;
;;; Read the keycode and jump to the corresponding handler using
;;; a jump table.  This is essentially KEY-FC in the TIME module.
;;;
;;; IN: Key down, A[2:0] holds table length minus 1
;;;     Last entry in table must be 000 to mark end of table.
;;;
;;; OUT: C.X= 0 (to make it easy to increment for digit keys)
;;;
;;; USED: A, C
;;;
;;; NOTE: The key is down when entering. Any wait for key release
;;;       and debounce handing is the reposibility of the caller.
;;;
;;; ************************************************************

              .section code, noroot
              .public KEYFC

KEYFC:        acex    x
              c=0     m
              rcr     11
              a=c     m
              c=keys                ; read key
              rcr     3
              a=c     x
              c=stk                 ; get table address
10$:          cxisa                 ; read next keycode from table
              c=c+1   m             ; point to next entry
              ?c#0    x             ; end of table?
              gonc    20$           ; yes
              ?a#c    x             ; no, equal to key down?
              goc     10$           ; no
              c=0     x             ; yes, set C.X= 0
20$:          c=c+a   m             ; point to address
              gotoc
