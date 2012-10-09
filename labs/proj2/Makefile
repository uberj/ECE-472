V_FILES=ripple_adder.v fulladder.v proj2_testbench.v lookahead.v fulladder_LA.v add16_LA.v cla_4bit.v
CC=vlog
all: build simulate report

build:
	$(CC) $(V_FILES)

simulate: kill build
	vsim -novopt work.proj2_testbench -do file.do

kill:
	-pkill vsim

TEXFILE="lab2"
report:
	pdflatex $(TEXFILE).tex
	rm $(TEXFILE).log
	rm $(TEXFILE).aux
	evince $(TEXFILE).pdf
