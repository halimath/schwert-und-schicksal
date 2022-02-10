VERSION = 0.1.0-rc1

NPM = npm
NPM_FLAGS = 

CP = cp
CP_FLAGS =

MKDIR = mkdir
MKDIR_OPTS = -p

RM = rm
RM_OPTS = -rf

FIND = find

OUT := out

.PHONY: clean all mrproper

all: $(OUT)/SchwertUndSchicksal-Regeln-$(VERSION).pdf $(OUT)/SchwertUndSchicksal-Regeln-$(VERSION).html $(OUT)/SchwertUndSchicksal-Charakterbogen-$(VERSION).pdf

$(OUT)/SchwertUndSchicksal-Regeln-$(VERSION).pdf: $(OUT)
	$(MAKE) -C regeln VERSION=$(VERSION) out/SchwertUndSchicksal.pdf
	$(CP) $(CP_FLAGS) regeln/out/SchwertUndSchicksal.pdf $@

$(OUT)/SchwertUndSchicksal-Regeln-$(VERSION).html: $(OUT)
	$(MAKE) -C regeln VERSION=$(VERSION) out/SchwertUndSchicksal.html
	$(CP) $(CP_FLAGS) regeln/out/SchwertUndSchicksal.html $@

$(OUT)/SchwertUndSchicksal-Charakterbogen-$(VERSION).pdf: $(OUT)
	$(NPM) $(NPM_FLAGS) --prefix charakterbogen i
	$(NPM) $(NPM_FLAGS) --prefix charakterbogen run build
	cp charakterbogen/out/charakterbogen.pdf $@

$(OUT):
	$(MKDIR) $(MKDIR_OPTS) $(OUT)

clean:
	$(RM) $(RM_OPTS) $(OUT)

mrproper:
	$(FIND) . -name "$(OUT)" -type d | xargs rm -rf