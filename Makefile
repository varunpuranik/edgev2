.PHONY: default

default:
	rm -f *.svg
	plantuml -tsvg *.plantuml
