#!/bin/sh
mkdir -p /work/output
latexmk -lualatex -pvc -output-directory=output main.tex
