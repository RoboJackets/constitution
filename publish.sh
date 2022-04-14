#!/bin/bash

mkdir -p pub
cp -rp build/SGA_Constitution.pdf pub
pandoc --wrap=none --to=markdown_github -s src/SGA_Constitution.tex -o pub/SGA_Constitution.md
