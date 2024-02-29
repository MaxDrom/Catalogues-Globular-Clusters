NAME=Catalog.pdf
TEXNAME=Catalog.tex
TMPNAME=$(patsubst %.tex, %1.pdf, $(TEXNAME))
all: $(NAME)

$(NAME): $(TEXNAME) bibliography.bib
	pdflatex -interaction=nonstopmode $(TEXNAME) > main.mk1.log
	bibtex $(patsubst %.tex, %.aux, $(TEXNAME))
	pdflatex -interaction=nonstopmode $(TEXNAME) > main.mk1.log
	pdflatex -interaction=nonstopmode $(TEXNAME) > main.mk2.log
	#mv $(NAME) $(TMPNAME)
	#gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.6 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH -sOutputFile=$(NAME) $(TMPNAME)
	#rm $(TMPNAME)