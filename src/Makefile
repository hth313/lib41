VPATH = alpha:assignments:buffer:control:misc:stack:util
OBJS = $(SRCS:%.s=%.o) $(RPN_SRCS:%.rpn=%.o)
LIB = lib41.a

RPN_SRCS =
SRCS = apx.s arcli.s ashfx.s error.s mkxyz.s returnStack.s vmant.s \
       chkbuf.s rndm.s

all: $(LIB)

%.o: %.rpn
	rpncomp -l --no-fat --prefix-labels LBL_ $<

%.o: %.s
	asnut -g -l $<

$(LIB): $(OBJS)
	nlib $(LIB) $(OBJS)

clean:
	rm $(OBJS) $(LIB)
