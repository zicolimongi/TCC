# Definição de variáveis
SOURCE      = main
LATEX       = pdflatex
BIBTEX      = bibtex
MAKEINDEX   = makeindex
GHOSTSCRIPT = gs

# Compila o código fonte
all:
	@echo "Compilando arquivos..."
	$(LATEX) $(SOURCE).tex
	$(MAKEINDEX) $(SOURCE).idx
	$(BIBTEX) $(SOURCE).aux
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	$(LATEX) $(SOURCE).tex
	@echo "Comprimindo o arquivo pdf..."
	@$(GHOSTSCRIPT) -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-sOutputFile=$(SOURCE)_compressed.pdf \
		$(SOURCE).pdf
	@echo "Terminado."
	@echo "Limpando arquivos temporarios, menos pdf..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex*


# Remove arquivos temporários
clean:
	@echo "Limpando arquivos temporarios..."
	@find . -type f -iname "*.aux" -delete
	@find . -type f -iname "*.log" -delete
	@find . -type f -iname "*.fdb_latexmk" -delete
	@find . -type f -iname "*.*~" -delete
	@rm -f *.pdf *.bak *.ps *.l* *.idx *.bbl *.brf *.glo *.dvi *.toc *.blg *.ilg *.ind *.out *.wsp *.fls *.synctex*
	@echo "Terminado."
