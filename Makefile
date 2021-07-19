src = src
dist = dist
config = config
lang = en

contents = $(src)/*.md
bibliography = bibliography/bibliography.bib
output = $(dist)/output.pdf

pandoc-config = $(config)/pandoc-config.yml $(config)/pandoc-config-$(lang).yml
pandoc_options = --standalone --filter pandoc-crossref

$(output): $(dist)/pandoc-config.yml $(shell find $(src) -type f)
	pandoc \
		$(pandoc_options) \
		--citeproc \
		--bibliography $(bibliography) \
		--metadata-file="$(dist)/pandoc-config.yml" \
		--resource-path=$(src) \
		-o $@ \
		$(contents)

# pandoc doesn't support multiple config files, so they
# need to be merged first.
$(dist)/pandoc-config.yml: $(pandoc-config)
	echo "" > $@ && cat $^ >> $@

.PHONY: clean count

clean:
	rm dist/*

count: $(dist)/pandoc-config.yml $(shell find $(src) -type f)
	pandoc \
		--metadata-file="$(dist)/pandoc-config.yml" \
		--resource-path="$(src)" \
		--lua-filter scripts/count.lua \
		$(contents)
