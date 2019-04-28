content = src/*.md
resources = src/resources
lang = en
output = dist/output.pdf

pandoc_config = config/pandoc-config-$(lang).yml
pandoc_options = --standalone --toc --biblatex --filter pandoc-crossref --number-sections

build: pdf

pdf: $(content) $(resources)
	pandoc \
		$(pandoc_options) \
		--metadata-file=$(pandoc_config) \
		--resource-path=$(resources) \
		-o $(output) \
		$(content)

.PHONY: clean

clean:
	rm dist/*
