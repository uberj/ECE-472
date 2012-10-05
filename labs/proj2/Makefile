V_FILES=ripple_adder.v fulladder.v proj2_testbench.v lookahead.v fulladder_LA.v
CC=vlog
all:
	$(CC) $(V_FILES)

TEXFILE="lab2"
report:
	pdflatex $(TEXFILE).tex
	rm $(TEXFILE).log
	rm $(TEXFILE).aux
	evince $(TEXFILE).pdf
