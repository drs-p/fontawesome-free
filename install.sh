#!/bin/bash
TEXMFLOCAL=$(kpsewhich -expand-var '$TEXMFHOME')

cp -r texmf/fonts texmf/tex $TEXMFLOCAL
texhash $TEXMFLOCAL
(
    cd texmf/doc/latex/fontawesome-free
    latexmk {iconlist,brandlist,fontawesome-free}.tex
    latexmk -c
    rm fontawesome-free.hd {brandlist,iconlist}.pdf
)
cp -r texmf/doc $TEXMFLOCAL
