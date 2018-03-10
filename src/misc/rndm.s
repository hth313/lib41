#include "mainframe.h"

IGDHMS:       .equ    0x5AB6         ; time module

;;; **********************************************************************
;;;
;;; RNDM - produce a random number
;;;
;;; Seed is kept inside buffer 6. If no buffer exists it will be created
;;; and the initial random number will be taken from time information in
;;; the time module. If there is no time module present, a zero will be
;;; stored as initial seed.
;;;
;;; Seed buffer is:
;;; 6601SSSSSS0EEE
;;; in other words, it is a single register buffer with a 6-digit
;;; (fractional) decimal number where the mantissa is right
;;; justified 3 position during storage.
;;;
;;; **********************************************************************

              .pubweak RNDM, SEED
              .extern chkbuf, noRoom
              .section code, noroot

              .name   "RNDM"
RNDM:         gsbp    chkbuf6       ; seek seed buffer
              goto    1$            ; (P+1) no buffer
              acex                  ; move packed seed to A

              a=0     s             ; unpack seed
              asl     m
              asl     m
              asl     m

              setdec
              c=0                   ; 9821
              ldi     3
              pt=     12
              lc      9
              lc      8
              lc      2
              lc      1
              gosub   MP2_10        ; multiply
              a=c
              c=0                   ; .211327
              c=c-1   x             ; exponent: 999
              pt=     12
              lc      2
              lc      1
              lc      1
              lc      3
              lc      2
              lc      7
              gosub   AD2_10        ; add

              s5=0
              gosub   INTFRC        ; get fractional part
              a=c                   ; seed to A
              b=a                   ; result to B

              asr     m             ; pack seed
              asr     m
              asr     m

              c=data                ; read buffer header
              pt=     9             ; build new buffer header using new
                                    ; seed
              acex    wpt
              data=c                ; write updated buffer back

              golong  RCL           ; recall random number to x

1$:           gsbp    2$            ; create a SEED buffer
              goto    RNDM          ; start over

2$:           c=0                   ; invent a new seed
              gosub   IGDHMS        ; init and get hms
              ?c#0
              gonc    store_seed    ; got seed from timer

              rcr     9             ; no timer, just make up a seed
              setdec
              c=0     x
              c=c-1   x             ; 999
              goc     store_seed    ; always jump (we know cy is set)

              .name   "SEED"
SEED:         c=regn  x             ; entry for SEED

store_seed:                         ; new seed in C
              setdec                ; take fractional part of seed
              s5=0
              gosub   INTFRC
              sethex
              n=c                   ; save in N

              gsbp    chkbuf6       ; find seed buffer
              goto    create_seed_buffer

              acex                  ; buffer header to A
              c=n                   ; get new seed
              acex                  ; seed to A
              asr     m             ; pack seed
              asr     m
              asr     m
              pt=     9             ; build new header
              acex    wpt
              data=c                ; write back updated header
              rtn


;;; Create buffer 6601SSS...
create_seed_buffer:
              acex    x
              m=c                   ; first free reg addr
              c=0                   ; select chip 0
              dadd=c
              gosub   MEMLFT        ; get number of free registers
              c=c-1   x             ; we need just one
              goc     1$            ; no room
              c=m                   ; select header register
              dadd=c
              pt=     13            ; write dummy header
              lc      6
              lc      6
              lc      0
              lc      1
              data=c
              c=n
              goto    store_seed

1$:           rgo     noRoom        ; no room to create seed buffer

chkbuf6:      ldi     6
              a=c
              golp    chkbuf
