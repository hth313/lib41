VPATH = alpha:assignments:util:control:stack
OBJS = $(SRCS:%.s=%.o)
LIB = lib41.a

SRCS = ashfx.s mkxyz.s error.s returnStack.s vmant.s

all: $(LIB)

%.o: %.s
	asnut -g -l -I /usr/local/lib/nutstudio-nut-3.0.1/include $<

$(LIB): $(OBJS)
	nlib $(LIB) $(OBJS)

clean:
	rm $(OBJS) $(LIB)
