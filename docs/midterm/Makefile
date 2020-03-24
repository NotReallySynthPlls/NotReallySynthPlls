

md_to_pdf: 
	pandoc \
	--from=markdown \
	--to=latex \
	--template=template.latex \
	--filter=pandoc-crossref \
	--filter=pandoc-citeproc \
	--bibliography=references.bib \
	--csl=bibliography.csl \
	--output=report.pdf \
	report.md

latex_to_md:
	pandoc -s report.tex -o report.conv.md && \
	sed '1,8d' report.conv.md > report2.conv.md
	cat front.md report2.conv.md > report.conv.md
	rm report2.conv.md

# This generally doesn't work, when you don't share template files!
latex_to_pdf: 
	pandoc \
	--from=latex \
	--to=latex \
	--template=template.latex \
	--filter=pandoc-crossref \
	--filter=pandoc-citeproc \
	--bibliography=references.bib \
	--csl=bibliography.csl \
	--output=report.pdf \
	report.tex


