#include "mainframe.h"

              .pubweak `2D6`
              .extern RNDM0, RNDMA, StoreSeed

              .section code, noroot
              .name   "2D6"
`2D6`:        s9=0
              gsbp    RNDM0         ; get first number
              n=c                   ; N= first number
              gsbp    RNDMA         ; A= second number
              cnex                  ; N= seed to be stored in the end
                                    ; C= first number
              setdec
              gosub   AD2_10        ; add together
              a=c
              c=0
              pt=     12            ; 5.5 *
              lc      5
              lc      5
              gosub   MP2_10

;;; Result here is between 0 and 10.999989
              ?c#0    xs            ; below 1?
              gonc    2$            ; no
              a=0                   ; yes, truncate to 0
              goto    6$
2$:           ?c#0    x
              goc     5$            ; 10.xxx
              csr     m             ; right align mantissa
5$:           a=c
6$:           c=0
              pt=     11
              lc      2
              c=a+c   m             ; 2 +
              c=0     wpt           ; truncate to integer
              c=c+1   x             ; assume >9
              pt=     12
              ?c#0    pt            ; is it >9?
              goc     10$           ; yes
              rcr     -1            ; no, normalize
              c=0     x
10$:          bcex                  ; B= result
              sethex
              gsbp    StoreSeed     ; save seed to buffer

              golong  RCL
