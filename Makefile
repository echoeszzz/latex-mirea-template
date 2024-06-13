# Имя основного файла без расширения
MAIN_FILE = main

# Директория для выходных файлов
OUT_DIR = ./out

# Флаги для xelatex
XELATEX_FLAGS = -file-line-error -interaction=nonstopmode -synctex=1 -output-directory=$(OUT_DIR)

GREEN := $(shell tput setaf 10)
PINK := $(shell tput setaf 211)
RESET := $(shell tput sgr0)

.PHONY: all build clean open-pdf

all: build clean open-pdf

build: $(OUT_DIR)/$(MAIN_FILE).pdf

$(OUT_DIR)/$(MAIN_FILE).pdf: $(OUT_DIR) | $(MAIN_FILE).tex
	@echo "$(GREEN)Building PDF from $(MAIN_FILE).tex...$(RESET)"
	@xelatex $(XELATEX_FLAGS) $(MAIN_FILE).tex >/dev/null
	@xelatex $(XELATEX_FLAGS) $(MAIN_FILE).tex >/dev/null
	@echo "$(GREEN)PDF build complete: $(OUT_DIR)/$(MAIN_FILE).pdf$(RESET)"

clean:
	@echo "$(GREEN)Cleaning up auxiliary files...$(RESET)"
	@find $(OUT_DIR) -type f \( -name "*.aux" -o \
	-name "*.log" -o \
	-name "*.out" -o \
	-name "*.synctex.gz" -o \
	-name "*.toc" -o \
	-name "*.nav" -o \
	-name "*.snm" -o \
	-name "*.vrb" \) -delete
	@echo "$(GREEN)Clean up complete.$(RESET)"

open-pdf: $(OUT_DIR)/$(MAIN_FILE).pdf
	@echo "$(GREEN)Opening PDF file...$(RESET)"
	@case "$$(uname)" in \
		Darwin*) open $(OUT_DIR)/$(MAIN_FILE).pdf ;; \
		Linux*) xdg-open $(OUT_DIR)/$(MAIN_FILE).pdf ;; \
		*) start $(OUT_DIR)/$(MAIN_FILE).pdf ;; \
	esac
	@echo "$(GREEN)PDF file opened in $(PINK)`uname`$(RESET)"

$(OUT_DIR):
	@echo "Creating output directory $(OUT_DIR)..."
	@mkdir -p $(OUT_DIR)
	@echo "Output directory created."