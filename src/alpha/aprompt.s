;;; **********************************************************************
;;;
;;; APROMPT - prompt for alpha string
;;;
;;; Show alpha contents with an underscore waiting for alpha entry
        ;APROMPT        -       PROM PT  FOR     ALPHA   STRING
;SHOWS  ALPHA   WITH    A       UNDERSCORE
;WAITING        FOR     ALPHA   ENTRY
;ALL    ENTERED CHARACTERS      ARE
;STORED IN      ALPHA
;PRINTER        IS      NOT     CALLED
        .NAM    /APROMPT/
APRMPT  SETF    8       ;NO     SCROLL,PROMPT
        ?NCXQ   ARGOUT
        ?NCXQ   CLA
        M=C     ;#      ENTERED=0
        ?NCXQ   LDSST0
        ?NCXQ   AON     ;ALPHA
AP00    ?NCXQ   ENLCD
        ?NCXQ   LEFTJ
        ?NCXQ   RSTKB
;WAIT   FOR     KEY
AP10    ?KEY
        JNC     AP10
        ?NCXQ   ENCP00
        LDI
        .WORD   7
        A=C     S&X
        RXQ     KEYFCN
        .WORD   $18,$C6,$C5,$C4,$12,$87,$C3
        NOP
        JNC     APOFF   ;ON
        JNC     AP00    ;USER
        JNC     AP00    ;PRGM
AP000   JNC     AP00    ;ALPHA
        JNC     APSH    ;SHIFT
        JNC     APRS    ;R/S
        JNC     APDEL   ;<-
        READ    D       ;SF     23
        RCR     8
        C<>ST
        SETF    0
        C<>ST
        RCR     6
        WRIT    D
        RCR     1       ;BRING  UP      SHIFT   FLAG
        ST=C
        SETF    5
        ?NCXQ   ENCP00
        ?NCXQ   3*1024+9        ;GET    KEYCODE
        NOP     ;AND    GET     RID     OF      PROMPT
        ?NCXQ   GTACOD  ;READ   TABLE
        R=      0
        G=C
        ?NCXQ   ASCLCD
        LDI     ;APPEND UNDERSCORE
        .WORD   31
        WRIT    15
        ?NCXQ   LDSST0
        RCR     1
        ST=C
        C=M
        C=C+1   ALL
        M=C
        ?NCXQ   APPEND  ;TO     ALPHA
        ?FSET   4       ;SHIFT?
        JNC     AP000   ;NO
APSH    ?NCXQ   TOGSHF  ;TOGGLE SHIFT
        ?NCXQ   ANNOUT
        JNC     AP000
APRS    ?NCXQ   RSTKB   ;END
        ?NCXQ   LDSST0  ;AOFF
        ?NCXQ   AOFF
        ?NCGO   CLDSP   ;PUT    UP      GOOSE
APOFF   ?NCGO   OFF
;APDEL  -       DELETE  LAST    CHAR
APDEL   C=M
        C=C-1   ALL
        JNC     APD00
        ?NCXQ   BLINK   ;NO     CHARS
AP00X   JNC     AP000
APD00   M=C
        READ    M       ;DELETE FROM    ALPHA
        R=      1
        R=      1
        A=C     ALL
        READ    N
        A<>C    R<-
        A<>C    ALL
        RCR     2
        WRIT    M
        READ    O
        A<>C    R<-
        A<>C    ALL
        RCR     2
        WRIT    N
        READ    P
        A<>C    R<-
        A<>C    ALL
        RCR     2
        WRIT    O
        READ    P
        RCR     6
        C=0     R<-
        RCR     10
        WRIT    P
        ?NCXQ   ENLCD   ;AND    FROM    LCD
        RXQ     RGHTJ
        A<>C    S&X
        WRIT    14
        WRIT    14
        LDI
        .WORD   31
        WRIT    15
        JNC     AP00X
