all:
	git log -1 --date=short --format=format:'\newcommand{\RevisionInfo}{%h}' > gitrevisioninfo.sty
	latexmk -xelatex -interaction=nonstopmode LIVRO.tex
erros:
	-grep --color=auto "LaTeX Error" LIVRO.log
	-grep --color=auto -A 3 "Undefined" LIVRO.log
lua:
	lualatex  LIVRO.tex
	lualatex  LIVRO.tex
test:
	xelatex LIVRO.tex
	xelatex LIVRO.tex
	evince LIVRO.pdf
pdftex:
	pdflatex --halt-on-error LIVRO.tex
	pdflatex --halt-on-error LIVRO.tex
mobi:	
	tex4ebook -i -f mobi -c tex4ht EBOOK.tex 	
epub3:
	tex4ebook -i -f epub3 -c tex4ht EBOOK.tex 	
epub:	
	tex4ebook -i -c tex4ht EBOOK.tex 	
EBOOK-pdf:
	pdflatex -halt-on-error EBOOK.tex
	pdflatex -halt-on-error EBOOK.tex
EBOOK-check:
	epubcheck EBOOK.epub
rubber:
	rubber --module xelatex LIVRO.tex
rubber-test:
	rubber --clean LIVRO.tex
	rubber --module xelatex LIVRO.tex
	rubber --clean LIVRO.tex
rubber-clean:
	rubber --clean LIVRO.tex
clean:
	-rm *aux *log *tui *toc *.4ct *.4tc *.html *.css *.dvi *.epub *.lg *.ncx *.xref *.tmp *.idv *.opf *.fls *_latexmk LIVRO.pdf
	-rm -rf EBOOK-epub
	-rm -rf EBOOK-epub3
	-rm -rf EBOOK-mobi
git:
		git add .
		git commit -m "direto na linha de comando"
		git push
