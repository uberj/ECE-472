V_FILES=flipflop.v mux.v ripple_adder.v fulladder.v proj1_testbench.v
CC=vlog
all:
	$(CC) $(V_FILES)

TEXFILE="lab1"
report:
	pdflatex $(TEXFILE).tex
	rm $(TEXFILE).log
	rm $(TEXFILE).aux
	evince $(TEXFILE).pdf
