
OBJ=prog.tap
SYM=prog.sym
SRC=main.asm
TOP=main.asm

ASMCMD=pasmo
AFLAGS=-1 --tapbas -I $(DIR) -I ./include 

EMUCMD=fuse
EFLAGS=-g hq3x -m plus3

SRCDIR=$(DIR)
BINDIR=build/$(DIR)

all: $(BINDIR)/$(OBJ)

$(BINDIR)/$(OBJ): $(SRCDIR)/$(SRC)
	mkdir -p $(BINDIR)
	$(ASMCMD) $(AFLAGS) $(SRCDIR)/$(TOP) $@ $(BINDIR)/$(SYM)

emu: $(BINDIR)/$(OBJ)
	$(EMUCMD) $(EFLAGS) -tap $<

clean:
	rm -rf $(BINDIR)/$(OBJ) $(BINDIR)/$(SYM)
