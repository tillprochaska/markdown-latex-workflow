content = src/*.md
resources = src/
bibliography = src/bibliography/bibliography.bib
lang = en
output = dist/output.pdf

pandoc_config = config/pandoc-config-$(lang).yml
pandoc_options = \
	--standalone \
	--number-sections \
	--toc \
	--metadata link-citations \
	--metadata linkReferences \
	--filter pandoc-crossref

build: pdf

pdf:
	pandoc \
		$(pandoc_options) \
		--bibliography $(bibliography) \
		--metadata-file=$(pandoc_config) \
		--resource-path=$(resources) \
		-o $(output) \
		$(content)

.PHONY: clean

clean:
	rm dist/*
