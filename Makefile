.PHONY: all install doc dist readme

TEXMFLOCAL = $(shell kpsewhich -expand-var '$$TEXMFHOME')
DOC_DIR = texmf/doc/latex/fontawesome-free

all: doc

install:
	cp -r texmf/fonts texmf/tex "$(TEXMFLOCAL)"
	texhash "$(TEXMFLOCAL)"

doc: install readme
	cd $(DOC_DIR); make all
	cp -r texmf/doc "$(TEXMFLOCAL)"

readme:
	sed 's:\\jobname:fontawesome-free:g' texmf/doc/latex/fontawesome-free/fontawesome-free.tex i\
		| pandoc --from latex --to gfm-footnotes --shift-heading-level-by=2 -\
		| sed -e "1i # The <span class="sans-serif">fontawesome-free</span> package\n\n## Up-to-date LuaLaTeX support for Font Awesome\n\n" - \
		| head -n-2 - >README.md

dist: doc
	rm -f dist/fontawesome-free.zip
	zip -r dist/fontawesome-free.zip texmf
