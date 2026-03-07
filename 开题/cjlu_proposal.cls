\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cjlu_proposal}[2026/03/07 CJLU proposal document class]

\LoadClass[UTF8,a4paper,12pt]{ctexart}
\RequirePackage{cjlu_cover}
\RequirePackage{cjlu_body}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\RequirePackage{booktabs}

\AtBeginDocument{\covermaintitle{毕业设计（论文）开题报告}}


\newcommand{\proposalsection}[2]{%
  \refstepcounter{section}%
  \vspace{1.2em}%
  \noindent\fontsize{16pt}{1.5em}\selectfont\textbf{\CJKdigits{\arabic{section}}、#1}\label{sec:#2}\par
  \normalfont\normalsize
}

\newenvironment{proposaltable}{
  \vspace{1em}
  \begin{tabularx}{\textwidth}{p{0.2\textwidth}X}
    \toprule
    项目 & 内容 \\
    \midrule
}{
    \bottomrule
  \end{tabularx}
}

\endinput
