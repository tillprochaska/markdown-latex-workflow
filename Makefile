src = src
contents = $(src)/*.md
bibliography = $(src)/bibliography/bibliography.bib
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

$(output): $(shell find $(src) -type f)
	pandoc \
		$(pandoc_options) \
		--bibliography $(bibliography) \
		--metadata-file=$(pandoc_config) \
		--resource-path=$(src) \
		-o $@ \
		$(contents)

.PHONY: clean

clean:
	rm dist/*
