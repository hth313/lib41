VPATH =
OBJS = $(SRCS:%.s=%.o) $(RPN_SRCS:%.rpn=%.o)
MOD = lib41test.mod

RPN_SRCS = alpha.rpn
SRCS = lib41test.s

all: $(MOD)

%.o: %.rpn
	rpncomp -l --no-fat --prefix-labels LBL_ $<

%.o: %.s
	asnut -g -l -I ../include $<

$(MOD): $(OBJS) linker.scm lib41test.moddesc ../src/lib41.a
	lnnut -g $(OBJS) -llinker.lst linker.scm lib41test.moddesc  ../src/lib41.a

clean:
	rm $(OBJS) $(MOD)
