input = src/*.md
output = dist/output.pdf
lang = en

pandoc_config = config/pandoc-config-$(lang).yml
pandoc_options = --filter pandoc-crossref --number-sections

build: pdf

pdf: $(input) src/resources/*
	pandoc \
		$(pandoc_options) \
		--metadata-file=$(pandoc_config) \
		$(input) \
		-o $(output)

.PHONY: clean

clean:
	rm dist/*
