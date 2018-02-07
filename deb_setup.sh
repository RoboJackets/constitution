#!/bin/bash

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# The texlive install + docs is almost 4G, so lets only grab what we probably 
# need. This covers more than the base constitution requires, but is regarded
# to be the "core install" so it should serve most LaTeX dev.
sudo apt-get -y --no-install-recommends install make evince texlive-{base,bibtex-extra,extra-utils,generic-recommended,fonts-recommended,font-utils,latex-base,latex-recommended,latex-extra,math-extra,pictures,pstricks,science} perl-tk purifyeps chktex latexmk dvipng xindy dvidvi fragmaster lacheck latexdiff libfile-which-perl dot2tex tipa latex-xcolor latex-beamer prosper pgf

