CONTENT=$(shell find content -name '*.md')
OUTPUTS=$(patsubst content/%, output/%, $(patsubst %.md, %.html, $(CONTENT)))

all: $(OUTPUTS) output/index.html

output/index.html:
	bash make_index.sh $@

output/%.html: content/%.md
	bash make.sh $< $@

clean:
	rm output/*
