.PHONY: all

all: fontawesome-free.pdf
	latexmk -c
	rm fontawesome-free.hd fontawesome-free-iconlist.pdf fontawesome-free-iconlist.pageno

fontawesome-free.pdf: fontawesome-free.tex fontawesome-free-iconlist.pdf fontawesome-free-iconlist.pageno

%.pdf: %.tex
	latexmk -norc -lualatex $<

fontawesome-free-iconlist.pdf fontawesome-free-iconlist.pageno: fontawesome-free-iconlist.tex
