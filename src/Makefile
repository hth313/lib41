VPATH = alpha:assignments:util:control:stack
OBJS = $(SRCS:%.s=%.o)
LIB = lib41.a

SRCS = ashfx.s mkxyz.s error.s returnStack.s vmant.s

all: $(LIB)

%.o: %.s
	asnut -g -l $<

$(LIB): $(OBJS)
	nlib $(LIB) $(OBJS)

clean:
	rm $(OBJS) $(LIB)
