.PHONY: all install doc dist readme

TEXMFLOCAL = $(shell kpsewhich -expand-var '$$TEXMFHOME')
DOC_DIR = texmf/doc/latex/fontawesome-free

all: doc

install:
	cp -r texmf/fonts texmf/tex "$(TEXMFLOCAL)"
	texhash "$(TEXMFLOCAL)"

doc: install
	cd $(DOC_DIR); make all
	cp -r texmf/doc "$(TEXMFLOCAL)"

dist: doc
	mkdir -p dist
	rm -f dist/fontawesome-free.zip
	zip -r dist/fontawesome-free.zip texmf
