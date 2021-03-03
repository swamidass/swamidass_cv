.PHONY: swamidass_cv.pdf open all tarball

PDF=pdflatex --shell-escape --synctex=1

all: swamidass_cv.pdf

update:
	hg pull
	hg update

upload:
	scp -C swamidass_cv.pdf  jswami@swamicompute.wustl.edu:/var/www/

open:  all 
	open swamidass_cv.pdf

swamidass_cv.pdf: swamidass_cv.tex swamidass.bib
	${PDF} swamidass_cv > output
	bibtex journal > /dev/null
	bibtex conference > /dev/null
	bibtex media > /dev/null
	${PDF} swamidass_cv > /dev/null
	${PDF} swamidass_cv > /dev/null

tarball:
	cd .. && tar cjf CV.tz2 CV 
