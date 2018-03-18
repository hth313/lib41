VPATH = alpha:assignments:buffer:control:random:stack:util
OBJS = $(SRCS:%.s=%.o) $(RPN_SRCS:%.rpn=%.o)
LIB = lib41.a

RPN_SRCS =
SRCS = apx.s arclint.s ashfx.s error.s mapkeys.s mkxyz.s returnStack.s vmant.s \
       chkbuf.s killbuf.s rndm.s dice.s fixeng.s atoxr.s xtoal.s

all: $(LIB)

%.o: %.rpn
	rpncomp -l --no-fat --prefix-labels LBL_ $<

%.o: %.s
	asnut -g -l -I../include $<

$(LIB): $(OBJS)
	nlib $(LIB) $(OBJS)

clean:
	rm $(OBJS) $(LIB)
