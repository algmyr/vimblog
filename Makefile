CONTENT=$(shell find content -name '*.md')
OUTPUTS=$(patsubst content/%, output/%, $(patsubst %.md, %.html, $(CONTENT)))

all: $(OUTPUTS) output/index.html

output/index.html: $(OUTPUTS) make_index.sh make.sh
	bash make_index.sh $@

output/%.html: content/%.md make_index.sh make.sh
	bash make.sh $< $@

clean:
	rm output/*
