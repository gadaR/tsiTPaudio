all : tpTSI.pdf

tpTSI.pdf : tpTSI.tex titre.tex tp.tex tpAlexandre.tex
	pdflatex tpTSI.tex
	pdflatex tpTSI.tex

clean :
	rm -f *.aux *.lof *.log *.lot *.fls *.out *.toc tpTSI.pdf
