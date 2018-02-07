PRE = mkdir -p build
TEX = latex -output-directory=build src/SGA_Constitution.tex
DVI2PDF = dvipdf build/SGA_Constitution.dvi build/SGA_Constitution.pdf
OPEN = evince build/SGA_Constitution.pdf
CLEAN = rm -rf build

.PHONY: all

all:  SGA_Constitution.pdf

view: all
	$(OPEN)
	
SGA_Constitution.pdf: SGA_Constitution.dvi
	$(DVI2PDF)

SGA_Constitution.dvi:
	$(PRE)
	$(TEX)

clean:
	$(CLEAN)
	
