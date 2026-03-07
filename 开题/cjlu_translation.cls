\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cjlu_translation}[2026/03/07 CJLU translation document class]

\LoadClass[UTF8,a4paper,12pt]{ctexart}
\RequirePackage{cjlu_cover}
\RequirePackage{cjlu_body}

\newcommand{\translationpage}[2]{%
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=west,font=\cjlu@bodyHeadFont] at ([xshift=86.15pt,yshift=-83.48pt]current page.north west) {外文翻译#1\raisebox{-1.5pt}{#2}};
  \end{tikzpicture}
  \par\noindent
}

\endinput
