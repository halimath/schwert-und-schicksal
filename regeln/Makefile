OUT := out

VERSION = 0.0.0

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

$(OUT)/%.pdf: doc/%.adoc $(SRC) styles/pdf.yml $(OUT)
	$(ASCIIDOCTOR_PDF) -a revnumber=$(VERSION) -a pdf-theme=$(PDF_STYLES) -a pdf-fontsdir=$(PDF_FONTS_DIR) -o $@ $<

$(OUT)/%.html: doc/%.adoc $(SRC) styles/html.css $(OUT)
	$(ASCIIDOCTOR) -a revnumber=$(VERSION) -a stylesheet=$(HTML_STYLES) -o $@ $<

$(OUT):
	$(MKDIR) $(MKDIR_OPTS) $(OUT)

clean:
	$(RM) $(RM_OPTS) $(OUT)
