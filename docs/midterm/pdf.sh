
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
