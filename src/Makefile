OS4_INCLUDE=../../os4/src
VPATH = alpha:assignments:bitwise:buffer:checksum:control:conversion:input:random:stack:util
OBJS = $(SRCS:%.s=%.o) $(RPN_SRCS:%.rpn=%.o)
LIB = lib41.a
LIB_OS4 = lib41-os4.a

RPN_SRCS =

SRCS_IN_OS4 = error.s
SRCS = apx.s arclint.s ashfx.s chkbuf.s mapkeys.s mkxyz.s returnStack.s vmant.s \
       killbuf.s rndm.s dice.s fixeng.s atoxr.s xtoal.s binbcds.s \
       bcdand.s code.s decode.s bufsize.s keyfcn.s yntest.s luhn.s

SRCS_NO_OS4 = $(SRCS) $(SRCS_IN_OS4)
SRCS_OS4 = $(SRCS)

OBJS_NO_OS4 = $(SRCS_NO_OS4:%.s=%-no-os4.o)
OBJS_OS4 = $(SRCS_OS4:%.s=%-os4.o)

all: $(LIB) $(LIB_OS4)

%.o: %.rpn
	rpncomp -l --no-fat --prefix-labels LBL_ $<

%-os4.o: %.s
	asnut -D OS4 -g -l -I../include -I$(OS4_INCLUDE)  $< -o$@

%-no-os4.o: %.s
	asnut -g -l -I../include -I$(OS4_INCLUDE) $< -o$@

$(LIB): $(OBJS_NO_OS4)
	nlib $(LIB) $(OBJS_NO_OS4)

$(LIB_OS4): $(OBJS_OS4)
	nlib $(LIB_OS4) $(OBJS_OS4)

clean:
	rm $(OBJS_OS4) $(OBJS_NO_OS4) $(LIB) $(LIB_OS4)
