V_FILES=fulladder.v proj3_testbench.v mux.v ALU16.v alu_slice_1bit.v alu_slice_msb.v
CC=vlog
all: build simulate report

build:
	$(CC) $(V_FILES)

simulate: kill build
	vsim -debugDB -novopt proj3_work.proj3_testbench -do file.do

kill:
	-pkill vsim

TEXFILE="CS472_LAB3_kngo_juber"
report:
	pdflatex $(TEXFILE).tex
	rm $(TEXFILE).log
	rm $(TEXFILE).aux
	evince $(TEXFILE).pdf

clean:
	-rm -f $(TEXFILE).log
	-rm -f $(TEXFILE).aux
	-rm -f $(TEXFILE).pdf
