BUILDDIR=out
TEXOPTS=--output-directory=$(BUILDDIR)

.PHONY : default
default: help

.PHONY : help
help:
	@echo 'Available targets:'
	@echo '    build         - generate all documents'
	@echo '    all           - a synonim for build'
	@echo '    clean         - delete all generated files'
	@echo '    garbage-clean - delete auxiliary files'

.PHONY : all
all : build

.PHONY : build
build: przymierze.pdf proroctwa-mesjanskie.pdf

.PHONY : przymierze.pdf
przymierze.pdf:
	mkdir -p out
	pdflatex $(TEXOPTS) przymierze.tex
	pdflatex $(TEXOPTS) przymierze.tex

.PHONY : proroctwa-mesjanskie.pdf
proroctwa-mesjanskie.pdf:
	mkdir -p out
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex

.PHONY : garbage-clean
garbage-clean:
	rm -f out/przymierze.aux
	rm -f out/przymierze.lof
	rm -f out/przymierze.log
	rm -f out/przymierze.lot
	rm -f out/przymierze.out
	rm -f out/przymierze.toc
	rm -f out/proroctwa-mesjanskie.aux
	rm -f out/proroctwa-mesjanskie.lof
	rm -f out/proroctwa-mesjanskie.log
	rm -f out/proroctwa-mesjanskie.lot
	rm -f out/proroctwa-mesjanskie.out
	rm -f out/proroctwa-mesjanskie.toc

.PHONY : clean
clean : garbage-clean
	rm -f out/przymierze.pdf
	rm -f out/proroctwa-mesjanskie.pdf
