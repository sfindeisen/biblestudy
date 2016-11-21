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
build: proroctwa-mesjanskie.pdf

.PHONY : proroctwa-mesjanskie.pdf
proroctwa-mesjanskie.pdf:
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex

.PHONY : garbage-clean
garbage-clean:
	rm -f out/proroctwa-mesjanskie.aux
	rm -f out/proroctwa-mesjanskie.lof
	rm -f out/proroctwa-mesjanskie.log
	rm -f out/proroctwa-mesjanskie.lot
	rm -f out/proroctwa-mesjanskie.out
	rm -f out/proroctwa-mesjanskie.toc

.PHONY : clean
clean : garbage-clean
	rm -f out/proroctwa-mesjanskie.pdf

