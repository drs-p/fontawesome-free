.PHONY: all

all: fontawesome-free.pdf
	latexmk -c
	rm fontawesome-free.hd brandlist.pdf iconlist.pdf

fontawesome-free.pdf: fontawesome-free.tex iconlist.pdf brandlist.pdf

%.pdf: %.tex
	latexmk -norc -lualatex $<
