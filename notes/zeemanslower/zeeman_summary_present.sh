#!/usr/bin/env bash

NAME=zeeman_summary_present
wiki2beamer "$NAME.txt" > "$NAME.tex"
pdflatex "$NAME.tex"
