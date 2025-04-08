.PHONY: all

all: fontawesome-free.pdf
	latexmk -c
	-rm fontawesome-free.hd

%.pdf: %.tex
	latexmk -norc -lualatex $<
