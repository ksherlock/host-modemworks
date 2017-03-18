# disable built-in rules.
.SUFFIXES:
# do not auto-delete intermediate objects.
.SECONDARY:

MAKEBIN = mpw MakeBinIIgs
ASM = mpw AsmIIgs
LINK = mpw LinkIIgs

TARGETS = ModemKEGS SerialKEGS

all: $(TARGETS)

.PHONY: clean
clean:
	$(RM) -- $(TARGETS) *.omf *.o *.lst

% : %.omf
	$(MAKEBIN) -org \$$0ff0 -t \$$2b -at \$$8006 -p -s  -o $@ $^


%.omf : %.o
	$(LINK) -p -l -x -o $@ $^

%.o : %.aii
	$(ASM) -p -l -i ModemWorks/ -o $@ $^
