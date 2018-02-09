PRE = mkdir -p build
TEX = latex -file-line-error -halt-on-error -output-directory=build
DVI2PDF = dvipdf
OPEN = evince
CLEAN = rm -rf build

GIT_COMMIT_REF="HEAD^"

.PHONY: all

all: diff

pdf: SGA_Constitution.pdf

view: pdf
	$(OPEN) build/SGA_Constitution.pdf

diff: SGA_Constitution.diff.pdf

view-diff: diff
	$(OPEN) build/SGA_Constitution.diff.pdf

pre:
	$(PRE)
	
SGA_Constitution.pdf: SGA_Constitution.dvi
	$(DVI2PDF) build/SGA_Constitution.dvi build/SGA_Constitution.pdf

SGA_Constitution.dvi: pre
	$(TEX) src/SGA_Constitution.tex

SGA_Constitution.diff: SGA_Constitution.pdf
	./latex_diff.sh ${GIT_COMMIT_REF}

SGA_Constitution.diff.pdf: SGA_Constitution.diff.dvi
	$(DVI2PDF) build/SGA_Constitution.diff.dvi build/SGA_Constitution.diff.pdf

SGA_Constitution.diff.dvi: SGA_Constitution.diff
	$(TEX) build/SGA_Constitution.diff.tex

pub: pdf
	./publish.sh

clean:
	$(CLEAN)
	
