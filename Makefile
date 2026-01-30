# LaTeX CV Multilingual Makefile
# Supports compilation of CVs in multiple languages and writing systems

# Configuration
LATEX_ENGINE = pdflatex
LATEX_FLAGS = -interaction=nonstopmode -file-line-error
XELATEX_ENGINE = xelatex
XELATEX_FLAGS = -interaction=nonstopmode -file-line-error
BUILD_DIR = build
OUTPUT_DIR = output

# Latin script languages (can use pdflatex or xelatex)
LATIN_CVS = english german french spanish portuguese dutch turkish
LATIN_DIR = src/latin

# CJK languages (require xelatex)
CJK_CVS = chinese japanese korean
CJK_DIR = src/cjk

# RTL languages (recommend xelatex)
RTL_CVS = arabic
RTL_DIR = src/rtl

# Cyrillic script languages
CYRILLIC_CVS = russian
CYRILLIC_DIR = src/cyrillic

# All CVs
ALL_CVS = $(LATIN_CVS) $(CJK_CVS) $(RTL_CVS) $(CYRILLIC_CVS)

# Default target
.PHONY: all clean clean-all latin cjk rtl cyrillic help
.DEFAULT_GOAL := help

# Help target
help:
	@echo "LaTeX CV Multilingual Build System"
	@echo "================================="
	@echo ""
	@echo "Available targets:"
	@echo "  all          - Build all CVs"
	@echo "  latin        - Build all Latin script CVs"
	@echo "  cjk          - Build all CJK CVs"
	@echo "  rtl          - Build all RTL CVs"
	@echo "  cyrillic     - Build all Cyrillic CVs"
	@echo "  clean        - Remove build artifacts"
	@echo "  clean-all    - Remove build artifacts and PDFs"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Individual CVs:"
	@$(foreach cv,$(ALL_CVS),echo "  cv-$(cv)     - Build $(cv) CV";)

# Create directories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Build all CVs
all: $(ALL_CVS)

# Build Latin script CVs
latin: $(LATIN_CVS)

# Build CJK CVs
cjk: $(CJK_CVS)

# Build RTL CVs
rtl: $(RTL_CVS)

# Build Cyrillic CVs
cyrillic: $(CYRILLIC_CVS)

# Individual CV targets
$(LATIN_CVS): %: $(OUTPUT_DIR)/cv-%.pdf

$(CJK_CVS): %: $(OUTPUT_DIR)/cv-%.pdf

$(RTL_CVS): %: $(OUTPUT_DIR)/cv-%.pdf

$(CYRILLIC_CVS): %: $(OUTPUT_DIR)/cv-%.pdf

# Pattern rules for building PDFs
$(OUTPUT_DIR)/cv-%.pdf: $(LATIN_DIR)/cv-%.tex | $(BUILD_DIR) $(OUTPUT_DIR)
	@echo "Building $* CV (Latin script)..."
	$(LATEX_ENGINE) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) $(LATIN_DIR)/cv-$*.tex
	mv $(BUILD_DIR)/cv-$*.pdf $(OUTPUT_DIR)/
	@echo "✓ $* CV built successfully"

$(OUTPUT_DIR)/cv-%.pdf: $(CJK_DIR)/cv-%.tex | $(BUILD_DIR) $(OUTPUT_DIR)
	@echo "Building $* CV (CJK)..."
	$(XELATEX_ENGINE) $(XELATEX_FLAGS) -output-directory=$(BUILD_DIR) $(CJK_DIR)/cv-$*.tex
	mv $(BUILD_DIR)/cv-$*.pdf $(OUTPUT_DIR)/
	@echo "✓ $* CV built successfully"

$(OUTPUT_DIR)/cv-%.pdf: $(RTL_DIR)/cv-%.tex | $(BUILD_DIR) $(OUTPUT_DIR)
	@echo "Building $* CV (RTL)..."
	$(XELATEX_ENGINE) $(XELATEX_FLAGS) -output-directory=$(BUILD_DIR) $(RTL_DIR)/cv-$*.tex
	mv $(BUILD_DIR)/cv-$*.pdf $(OUTPUT_DIR)/
	@echo "✓ $* CV built successfully"

$(OUTPUT_DIR)/cv-%.pdf: $(CYRILLIC_DIR)/cv-%.tex | $(BUILD_DIR) $(OUTPUT_DIR)
	@echo "Building $* CV (Cyrillic)..."
	$(XELATEX_ENGINE) $(XELATEX_FLAGS) -output-directory=$(BUILD_DIR) $(CYRILLIC_DIR)/cv-$*.tex
	mv $(BUILD_DIR)/cv-$*.pdf $(OUTPUT_DIR)/
	@echo "✓ $* CV built successfully"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)/*
	@echo "✓ Build artifacts cleaned"

# Clean everything including PDFs
clean-all:
	@echo "Cleaning all files..."
	rm -rf $(BUILD_DIR)/*
	rm -f $(OUTPUT_DIR)/*.pdf
	@echo "✓ All files cleaned"

# Convenience targets for popular languages
cv-english: english
cv-german: german
cv-french: french
cv-spanish: spanish
cv-chinese: chinese
cv-japanese: japanese
cv-korean: korean
cv-arabic: arabic
cv-turkish: turkish
cv-russian: russian
