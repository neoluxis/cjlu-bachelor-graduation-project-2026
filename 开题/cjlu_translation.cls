\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cjlu_translation}[2026/03/07 CJLU foreign literature translation template]

\LoadClass[UTF8,a4paper,12pt]{ctexart}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{tikz}
\RequirePackage{expl3}

\geometry{left=3cm,right=2.5cm,top=2.8cm,bottom=2.8cm}
\setstretch{1.25}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\pagestyle{empty}
\zihao{-4}

\setmainfont{Times New Roman}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{NSimSun}

\newcommand{\cjlu@studentname}{}
\newcommand{\cjlu@studentid}{}
\newcommand{\cjlu@major}{自动化}
\newcommand{\cjlu@class}{22 自动化\hspace{0.5em}班}
\newcommand{\cjlu@thesistitle}{}
\newcommand{\cjlu@advisor}{}
\newcommand{\cjlu@school}{机电工程学院}
\newcommand{\cjlu@date}{2025 年 12 月 30 日}

\newcommand{\studentname}[1]{\gdef\cjlu@studentname{#1}}
\newcommand{\studentid}[1]{\gdef\cjlu@studentid{#1}}
\newcommand{\major}[1]{\gdef\cjlu@major{#1}}
\newcommand{\classinfo}[1]{\gdef\cjlu@class{#1}}
\newcommand{\thesistitle}[1]{\gdef\cjlu@thesistitle{#1}}
\newcommand{\advisor}[1]{\gdef\cjlu@advisor{#1}}
\newcommand{\school}[1]{\gdef\cjlu@school{#1}}
\newcommand{\coverdate}[1]{\gdef\cjlu@date{#1}}

\newcommand{\cjlu@ifemptyTF}[3]{%
  \if\relax\detokenize{#1}\relax
    #2%
  \else
    #3%
  \fi
}

\newcommand{\cjlu@fieldtext}[4]{%
  \node[
    anchor=center,
    inner sep=0pt,
    font=\cjlu@coverFillFont
  ] at ([xshift=#1,yshift=-#2]current page.north west) {\makebox[#3][c]{#4}};
}
\newcommand{\cjlu@fieldtextleft}[3]{%
  \node[
    anchor=center,
    inner sep=0pt,
    font=\cjlu@coverFillFont
  ] at ([xshift=#1,yshift=-#2]current page.north west) {#3};
}
\newcommand{\cjlu@fieldparleft}[4]{%
  \node[
    anchor=north,
    inner sep=0pt,
    font=\cjlu@coverFillFont,
    align=center,
    text width=#3
  ] at ([xshift=#1,yshift=-#2]current page.north west) {#4};
}

\newcommand{\cjlu@coverTitleFont}{\heiti\fontsize{28bp}{28bp}\selectfont}
\newcommand{\cjlu@coverSubTitleFont}{\heiti\fontsize{26bp}{26bp}\selectfont}
\newcommand{\cjlu@coverLabelFont}{\fontsize{16bp}{16bp}\selectfont}
\newcommand{\cjlu@coverFillFont}{\fontsize{16bp}{16bp}\selectfont}
\newcommand{\cjlu@bodyHeadFont}{\heiti\fontsize{16bp}{16bp}\selectfont}

\newcount\cjlu@titlelinecount
\newcount\cjlu@lineidx
\newcount\cjlu@titleshiftpt
\newcount\cjlu@titlelinestep
\newcommand{\cjlu@yadvisorlabelpt}{489}
\newcommand{\cjlu@yschoollabelpt}{525}
\newcommand{\cjlu@yadvisorlinept}{495}
\newcommand{\cjlu@yschoollinept}{531}
\newcommand{\cjlu@yadvisortextpt}{488}
\newcommand{\cjlu@yschooltextpt}{524}
\newcommand{\cjlu@lineypt}{459}
\newcommand{\cjlu@titlemaxindex}{0}

\ExplSyntaxOn
\cs_new:Npn \cjlu_title_linecount:n #1
  {
    \int_compare:nNnTF { \str_count:e {#1} } = {0}
      { 1 }
      { \int_eval:n { (\str_count:e {#1} + 27) / 28 } }
  }

\tl_new:N \l__cjlu_title_wrapped_tl
\int_new:N \l__cjlu_title_len_int
\int_new:N \l__cjlu_title_idx_int

\cs_new_protected:Npn \cjlu_title_wrap:n #1
  {
    \int_set:Nn \l__cjlu_title_len_int { \str_count:e {#1} }
    \tl_clear:N \l__cjlu_title_wrapped_tl
    \int_zero:N \l__cjlu_title_idx_int
    \int_while_do:nn { \l__cjlu_title_idx_int < \l__cjlu_title_len_int }
      {
        \int_incr:N \l__cjlu_title_idx_int
        \tl_put_right:Nx \l__cjlu_title_wrapped_tl
          {
            \exp_args:Ne \str_item:nn {#1}
              { \int_use:N \l__cjlu_title_idx_int }
          }
        \int_compare:nNnT { \int_mod:nn { \l__cjlu_title_idx_int } { 28 } } = { 0 }
          {
            \int_compare:nNnT { \l__cjlu_title_idx_int } < { \l__cjlu_title_len_int }
              { \tl_put_right:Nn \l__cjlu_title_wrapped_tl { \\[4pt] } }
          }
      }
    \tl_use:N \l__cjlu_title_wrapped_tl
  }
\cs_new:Npn \cjluTitleLineCount #1 { \cjlu_title_linecount:n {#1} }
\cs_new_protected:Npn \cjluTitleWrap #1 { \cjlu_title_wrap:n {#1} }
\ExplSyntaxOff

\newcommand{\cjlu@preparetitlelayout}{%
  \global\cjlu@titlelinestep=24\relax
  \global\cjlu@titlelinecount=\numexpr\cjluTitleLineCount{\cjlu@thesistitle}\relax
  \xdef\cjlu@titlemaxindex{\number\numexpr\cjlu@titlelinecount-1\relax}%
  \global\cjlu@titleshiftpt=\numexpr(\cjlu@titlelinecount-1)*\cjlu@titlelinestep\relax
  \xdef\cjlu@yadvisorlabelpt{\number\numexpr489+\cjlu@titleshiftpt\relax}%
  \xdef\cjlu@yschoollabelpt{\number\numexpr525+\cjlu@titleshiftpt\relax}%
  \xdef\cjlu@yadvisorlinept{\number\numexpr495+\cjlu@titleshiftpt\relax}%
  \xdef\cjlu@yschoollinept{\number\numexpr531+\cjlu@titleshiftpt\relax}%
  \xdef\cjlu@yadvisortextpt{\number\numexpr488+\cjlu@titleshiftpt\relax}%
  \xdef\cjlu@yschooltextpt{\number\numexpr524+\cjlu@titleshiftpt\relax}%
}

\newcommand{\maketranslationcover}{%
  \cjlu@preparetitlelayout
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=center,font=\cjlu@coverTitleFont] at ([xshift=312.803pt,yshift=-129.067pt]current page.north west) {中国计量大学};
    \node[anchor=center,font=\cjlu@coverSubTitleFont] at ([xshift=314.614pt,yshift=-185.294pt]current page.north west) {毕业设计（论文）外文翻译};

    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=141.76pt,yshift=-345pt]current page.north west) {学生姓名：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=325.72pt,yshift=-345pt]current page.north west) {学\ \ 号：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=141.76pt,yshift=-381pt]current page.north west) {专\ \ \ \ 业：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=141.76pt,yshift=-417pt]current page.north west) {班\ \ \ \ 级：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=143.20pt,yshift=-453pt]current page.north west) {设计（论文）题目：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=141.76pt,yshift=-\cjlu@yadvisorlabelpt pt]current page.north west) {指导教师：};
    \node[anchor=west,font=\cjlu@coverLabelFont] at ([xshift=141.76pt,yshift=-\cjlu@yschoollabelpt pt]current page.north west) {二级学院：};

    \draw[line width=0.4pt] ([xshift=225pt,yshift=-351pt]current page.north west) -- ([xshift=314pt,yshift=-351pt]current page.north west);
    \draw[line width=0.4pt] ([xshift=401pt,yshift=-351pt]current page.north west) -- ([xshift=540pt,yshift=-351pt]current page.north west);
    \draw[line width=0.4pt] ([xshift=226pt,yshift=-387pt]current page.north west) -- ([xshift=540pt,yshift=-387pt]current page.north west);
    \draw[line width=0.4pt] ([xshift=226pt,yshift=-423pt]current page.north west) -- ([xshift=540pt,yshift=-423pt]current page.north west);
    % Thesis title lines are generated based on actual content line count.
    \cjlu@lineidx=0
    \loop\ifnum\cjlu@lineidx<\cjlu@titlelinecount
      \xdef\cjlu@lineypt{\number\numexpr462+\the\cjlu@titlelinestep*\cjlu@lineidx\relax}%
      \draw[line width=0.4pt] ([xshift=300pt,yshift=-\cjlu@lineypt pt]current page.north west) -- ([xshift=540pt,yshift=-\cjlu@lineypt pt]current page.north west);
      \advance\cjlu@lineidx by 1
    \repeat
    \draw[line width=0.4pt] ([xshift=226pt,yshift=-\cjlu@yadvisorlinept pt]current page.north west) -- ([xshift=540pt,yshift=-\cjlu@yadvisorlinept pt]current page.north west);
    \draw[line width=0.4pt] ([xshift=226pt,yshift=-\cjlu@yschoollinept pt]current page.north west) -- ([xshift=540pt,yshift=-\cjlu@yschoollinept pt]current page.north west);

    \cjlu@ifemptyTF{\cjlu@studentname}{}{\cjlu@fieldtext{269.5pt}{344pt}{89pt}{\cjlu@studentname}}
    \cjlu@ifemptyTF{\cjlu@studentid}{}{\cjlu@fieldtext{470.5pt}{344pt}{139pt}{\cjlu@studentid}}
    \cjlu@ifemptyTF{\cjlu@major}{}{\cjlu@fieldtext{383pt}{380pt}{314pt}{\cjlu@major}}
    \cjlu@ifemptyTF{\cjlu@class}{}{\cjlu@fieldtext{383pt}{416pt}{314pt}{\cjlu@class}}
    \cjlu@ifemptyTF{\cjlu@thesistitle}{}{%
      \node[
        anchor=north,
        inner sep=0pt,
        font=\cjlu@coverFillFont,
        align=center,
        text width=236pt
      ] at ([xshift=420pt,yshift=-447pt]current page.north west) {%
        \setlength{\baselineskip}{\the\cjlu@titlelinestep pt}%
        \cjluTitleWrap{\cjlu@thesistitle}%
      };
    }
    \cjlu@ifemptyTF{\cjlu@advisor}{}{\cjlu@fieldtext{383pt}{\cjlu@yadvisortextpt pt}{314pt}{\cjlu@advisor}}
    \cjlu@ifemptyTF{\cjlu@school}{}{\cjlu@fieldtext{383pt}{\cjlu@yschooltextpt pt}{314pt}{\cjlu@school}}

    \node[anchor=center,font=\zihao{-3}] at ([xshift=307.975pt,yshift=-727.404pt]current page.north west) {\cjlu@date};
  \end{tikzpicture}
  \clearpage
}

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
