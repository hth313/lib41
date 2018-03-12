#include "mainframe.h"

;;; **********************************************************************
;;;
;;; MAPKEYS - rebuild the entire keyboard assignment map
;;;
;;; Code borrowed from extended functions module (and probably coming from
;;; the card reader originally).
;;;
;;; **********************************************************************

              .pubweak MAPKEYS
              .section code, noroot

              .name   "MAPKEYS"
MAPKEYS:      c=regn  15
              c=0     m
              c=0     s
              regn=c  15
              ldi     0xbf
1$:           c=c+1   x
              s7=0
              regn=c  10
              a=c
              c=regn  13
              acex
              ?a#c    x             ; chainhead?
              gonc    3$            ; yes
2$:           dadd=c
              c=data
              a=c
              c=0     x
              dadd=c
              acex
              c=c+1   s
              gonc    3$            ; done with KARs
              pt=     1
              ?s7=1                 ; first key?
              gonc    .+2           ; yes
              rcr     6
              ?c#0    wpt
              gonc    4$            ; No keycode
              a=c
              gosub   TBITMA
              gosub   SRBMAP        ; Set bit
4$:           c=regn  10
              ?s7=1                 ; done with 2nd?
              goc     1$            ; yes
              s7=1                  ; no
              goto    2$
3$:           c=regn  9
              pt=     3
              a=c     wpt
              gosub   DECADA
              gosub   DECADA
              c=regn  10
              acex    wpt
              regn=c  10
              gosub   GTFEND
5$:           pt=     3
              gosub   GTLINK
              ?c#0    x
              rtnnc                 ; chainhead - done
              gosub   UPLINK
              c=c+1   s             ; Is it an END?
6$:           gonc    5$            ; Yes
              c=0     x
              dadd=c
              acex    wpt
              regn=c  9
              a=c     wpt
              gosub   INCAD2        ; Get keycode in
              gosub   NXBYTA        ; Alpha lbl
              acex    wpt
              n=c
              c=0     x
              dadd=c
              c=regn  13
              m=c
              a=0     xs
              ?a#0    x             ; Is there a keycode?
              gonc    7$            ; No
              b=a     x
              gosub   TBITMP        ; Test map
              ?c#0                  ; Set?
              gonc    8$            ; No, set it
              abex    x             ; Clear it!!
              c=regn  10
              rcr     10
              bcex
              s1=1
              gosub   GCPKC0
              goto    7$
8$:           gosub   SRBMAP        ; set bit
7$:           c=regn  9
              a=c
              goto    6$
