TEX := latexmk
TEXFLAGS := -interaction=nonstopmode -halt-on-error -xelatex

# Compile only TeX files in the current directory.
TEXS := $(wildcard *.tex)
PDFS := $(TEXS:.tex=.pdf)

.PHONY: all clean distclean rebuild help

all: $(PDFS)

# Usage: make 文献综述.pdf
%.pdf: %.tex
	$(TEX) $(TEXFLAGS) "$<"
	BASE=$$(basename "$<" .tex); \
	if [ -f "$${BASE}.bcf" ]; then biber "$${BASE}"; fi
	$(TEX) $(TEXFLAGS) "$<"
	$(TEX) $(TEXFLAGS) "$<"

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.idx *.ilg *.ind *.lof *.log *.lot *.out *.run.xml *.synctex.gz *.toc *.xdv *.nav *.snm

distclean: clean
	rm -f $(PDFS)

rebuild: distclean all

help:
	@echo "make            # 编译当前目录全部 tex"
	@echo "make <name>.pdf # 编译指定 tex（如 make 文献综述.pdf）"
	@echo "make clean      # 清理中间文件"
	@echo "make distclean  # 清理中间文件和 pdf"
	@echo "make rebuild    # 彻底重编译"
