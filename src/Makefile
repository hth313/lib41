VPATH = alpha:assignments:util:control:stack
OBJS = $(SRCS:%.s=%.o) $(RPN_SRCS:%.rpn=%.o)
LIB = lib41.a

RPN_SRCS =
SRCS = arcli.s ashfx.s mkxyz.s error.s returnStack.s vmant.s

all: $(LIB)

%.o: %.rpn
	rpncomp -l --no-fat --prefix-labels LBL_ $<

%.o: %.s
	asnut -g -l $<

$(LIB): $(OBJS)
	nlib $(LIB) $(OBJS)

clean:
	rm $(OBJS) $(LIB)
