TEXFILES=$(wildcard *.tex)
#TEXFILES=gergely_imreh_research_proposal.tex
TARGETS=$(patsubst %.tex,%.pdf,$(TEXFILES))

RERUN = "(There were undefined references|\
	Rerun to get (cross-references|the bars) right|\
	Table widths have changed. Rerun LaTeX.|\
	Linenumber reference failed)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"

all: all-recursive $(TARGETS)

clean: clean-recursive
	rm -f *.aux *.log *.bbl *.blg *.brf *.cb *.ind *.idx *.ilg  \
          *.inx *.ps *.dvi *.toc *.out *.lot *~ *.lof *.ttt *.fff

scrub: clean
	rm -f $(TARGETS)

all-recursive:
	for dir in $(wildcard *); do if [ -d $$dir ] && [ -f $$dir/Makefile ]; then cd $$dir; $(MAKE) all; cd ..; fi; done

clean-recursive:
	for dir in $(wildcard *); do if [ -d $$dir ] && [ -f $$dir/Makefile ]; then cd $$dir; $(MAKE) clean; cd ..; fi; done

%.pdf: %.tex
	pdflatex $<
	egrep -c $(RERUNBIB) $*.log && (bibtex $*;pdflatex $<); true
	egrep $(RERUN) $*.log && (pdflatex $<) ; true
	egrep $(RERUN) $*.log && (pdflatex $<) ; true

