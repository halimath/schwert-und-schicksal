VERSION := 0.1.0

OUT := out

RM = rm
RM_OPTS = -rf

MKDIR = mkdir
MKDIR_OPTS = -p

SRC = $(wildcard doc/*.adoc)

PDF_STYLES = ./styles/pdf.yml # Must be relative to working dir
PDF_FONTS_DIR = /usr/share/fonts
HTML_STYLES = ../styles/html.css # Must be relative to doc/SchwertUndSchicksal.adoc

ASCIIDOCTOR = asciidoctor
ASCIIDOCTOR_PDF = asciidoctor-pdf

.PHONY: clean all

all: $(OUT)/SchwertUndSchicksal.pdf $(OUT)/SchwertUndSchicksal.html

$(OUT)/%.pdf: doc/%.adoc $(SRC) $(OUT)
	$(ASCIIDOCTOR_PDF) -a pdf-theme=$(PDF_STYLES) -a pdf-fontsdir=$(PDF_FONTS_DIR) -o $@ $<

$(OUT)/%.html: doc/%.adoc $(SRC) $(OUT)
	$(ASCIIDOCTOR) -a stylesheet=$(HTML_STYLES) -o $@ $<

$(OUT):
	$(MKDIR) $(MKDIR_OPTS) $(OUT)

clean:
	$(RM) $(RM_OPTS) $(OUT)
