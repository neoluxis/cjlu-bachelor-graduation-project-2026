TEX := latexmk
TEXFLAGS := -interaction=nonstopmode -halt-on-error -xelatex -quiet

# Compile only TeX files in the current directory.
TEXS := $(wildcard *.tex)
PDFS := $(TEXS:.tex=.pdf)

.PHONY: all clean distclean rebuild help

all: $(PDFS)

# Usage: make 文献综述.pdf
%.pdf: %.tex
	$(TEX) $(TEXFLAGS) "$<"

clean:
	@find . -type d \( -name "templates" -o -name "assets" -o -name ".git" -o -name "【模板】文献翻译-文献综述-开题报告" \) -prune \
	-o -type f -regex '.*\.\(aux\|log\|fls\|fdb_latexmk\|xdv\|toc\|nav\|snm\|out\|bbl\|blg\)' \
	-exec rm -fv {} + \
	| wc -l | awk '{print $$1 " intermediate files removed."}'

distclean: clean
	@find . -type d \( -name "templates" -o -name "assets" -o -name ".git" -o -name "【模板】文献翻译-文献综述-开题报告" \) -prune \
	-o -type f -name "*.pdf" -exec rm -fv {} + \
	| wc -l | awk '{print $$1 " PDF files removed."}'

rebuild: distclean all

help:
	@echo "make            # 编译当前目录全部 tex"
	@echo "make <name>.pdf # 编译指定 tex（如 make 文献综述.pdf）"
	@echo "make clean      # 清理中间文件"
	@echo "make distclean  # 清理中间文件和 pdf"
	@echo "make rebuild    # 彻底重编译"
