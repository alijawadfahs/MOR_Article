#!/bin/bash

THESIS=MOR

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex
.PHONY: clean

run: $(THESIS).pdf

$(THESIS).pdf: $(THESIS).bbl $(THESIS).tex
	pdflatex $(THESIS).tex -draftmode
	texfot pdflatex $(THESIS).tex 

$(THESIS).bbl: $(THESIS).aux
	bibtex $(THESIS).aux

$(THESIS).aux: $(THESIS).bib
	texfot pdflatex $(THESIS).tex -draftmode
	texfot pdflatex $(THESIS).tex -draftmode

clean:
	rm -rf *.aux *.lof *.log *.lot *.toc *.bbl *.blg *pdf *.out
