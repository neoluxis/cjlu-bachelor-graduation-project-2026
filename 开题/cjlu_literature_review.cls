\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cjlu_literature_review}[2026/03/07 CJLU literature review class]

\LoadClass[UTF8,a4paper,12pt]{ctexart}
\RequirePackage{cjlu_cover}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{tabularx}

% Fixed main title for literature review cover.
\AtBeginDocument{%
  \covermaintitle{文献综述}%
  \renewcommand{\arraystretch}{1.25}%
  \setlength{\tabcolsep}{6pt}%
}

\newcommand{\literaturereviewrefheading}{%
  \par\noindent{\heiti\zihao{-4}参考文献}\par
}

\newenvironment{literaturereviewrefs}
  {%
    \begin{longtable}{|>{\centering\arraybackslash}m{0.18\textwidth}|m{0.74\textwidth}|}
      \hline
      {\heiti 文献类型} & {\heiti 格式与示例} \\
      \hline
  }
  {%
    \end{longtable}
  }

\endinput
