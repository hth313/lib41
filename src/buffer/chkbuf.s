;;; **********************************************************************
;;;
;;; chkbuf - locate an I/O buffer with a given number.
;;;
;;; IN: A[0] - buffer number 0-F (hex)
;;;
;;; OUT:
;;; Returns to (P+1) if buffer not found and (P+2) if found.
;;; If found C will contain the contents of the buffer header
;;; register and the header register will be selected.
;;; If not found, we will leave an arbitrary register selected.
;;; A[2:0] will have the address of the buffer header if found.
;;;
;;; USES: A, C, PT (=12)
;;;
;;; Code orignally from the Time module.
;;;
;;; **********************************************************************

              .pubweak chkbuf
              .section code, noroot

chkbuf:       acex    x             ; main find entry point
              rcr     2             ; C[12]= buffer number
              pt=     12
              ldi     191           ; C.X= address one below buffer area
              a=c
1$:           a=a+1   x             ; main loop
2$:           c=0     x             ; select chip 0
              dadd=c
              c=regn  c             ; find chain head .END.
              ?a<c    x             ; have we reached chainhead?
              rtnnc                 ; yes, return to (P+1), not found
              acex    x             ; no, select and load register
              dadd=c
              acex    x
              c=data                ; read next register
              ?c#0                  ; if it is empty, then we reached end
              rtnnc                 ; of buffer area, return to not found
                                    ; location
              c=c+1   s             ; is it a key assignment register (KAR)?
              goc     1$            ; yes, move to next register
              ?a#c    pt            ; no, must be a buffer, have we found
                                    ; the buffer we are searching for?
              goc     3$            ; no
              c=stk                 ; yes, fix (P+2) as return point
              c=c+1   m
              stk=c
              c=data                ; Load header register to C
              rtn

3$:           rcr     10            ; wrong buffer, skip to next
              c=0     xs
              a=a+c   x
              goto    2$
