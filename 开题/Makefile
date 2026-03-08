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
	@find . -type f \
		-name "*.aux" -o \
		-name "*.bbl" -o \
		-name "*.bcf" -o \
		-name "*.blg" -o \
		-name "*.fdb_latexmk" -o \
		-name "*.fls" -o \
		-name "*.idx" -o \
		-name "*.ilg" -o \
		-name "*.ind" -o \
		-name "*.lof" -o \
		-name "*.log" -o \
		-name "*.lot" -o \
		-name "*.out" -o \
		-name "*.run.xml" -o \
		-name "*.synctex.gz" -o \
		-name "*.toc" -o \
		-name "*.xdv" -o \
		-name "*.nav" -o \
		-name "*.snm" | xargs rm -fv \
	| wc -l | awk '{print $$1 " intermediate files removed."}'

distclean: clean
	@find . -type f -name "*.pdf" | xargs rm -fv \
		| wc -l | awk '{print $$1 " PDF files removed."}'

rebuild: distclean all

help:
	@echo "make            # 编译当前目录全部 tex"
	@echo "make <name>.pdf # 编译指定 tex（如 make 文献综述.pdf）"
	@echo "make clean      # 清理中间文件"
	@echo "make distclean  # 清理中间文件和 pdf"
	@echo "make rebuild    # 彻底重编译"
