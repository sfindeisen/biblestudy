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
build: malzenstwo.pdf proroctwa-mesjanskie.pdf

.PHONY : malzenstwo.pdf
malzenstwo.pdf:
	pdflatex $(TEXOPTS) malzenstwo.tex
	pdflatex $(TEXOPTS) malzenstwo.tex

.PHONY : proroctwa-mesjanskie.pdf
proroctwa-mesjanskie.pdf:
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex
	pdflatex $(TEXOPTS) proroctwa-mesjanskie.tex

.PHONY : garbage-clean
garbage-clean:
	rm -f out/malzenstwo.aux
	rm -f out/malzenstwo.lof
	rm -f out/malzenstwo.log
	rm -f out/malzenstwo.lot
	rm -f out/malzenstwo.out
	rm -f out/malzenstwo.toc
	rm -f out/proroctwa-mesjanskie.aux
	rm -f out/proroctwa-mesjanskie.lof
	rm -f out/proroctwa-mesjanskie.log
	rm -f out/proroctwa-mesjanskie.lot
	rm -f out/proroctwa-mesjanskie.out
	rm -f out/proroctwa-mesjanskie.toc

.PHONY : clean
clean : garbage-clean
	rm -f out/malzenstwo.pdf
	rm -f out/proroctwa-mesjanskie.pdf

