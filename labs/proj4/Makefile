V_FILES=*.v
CC=vlog
all: build simulate report

build:
	$(CC) $(V_FILES)

simulate: kill build
	vsim -debugDB -novopt work.proj4_testbench -do file.do

kill:
	-pkill vsim

TEXFILE="CS472_LAB4_kngo_juber"
report:
	pdflatex $(TEXFILE).tex
	rm $(TEXFILE).log
	rm $(TEXFILE).aux
	evince $(TEXFILE).pdf

clean:
	-rm -f $(TEXFILE).log
	-rm -f $(TEXFILE).aux
	-rm -f $(TEXFILE).pdf
