%
% ociamthesis v2.2
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{support/thcolognethesis}[2010/11/22 v2.2 OCIAM thesis class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo

% Custom Packages
\usepackage[ngerman]{babel}
\usepackage[babel,german=quotes]{csquotes}
\usepackage[utf8]{inputenc}
\usepackage{datetime}
\usepackage{amsmath}
\usepackage[authoryear,round]{natbib}
\usepackage{microtype}
\usepackage{url}
\usepackage{svg}
\usepackage{listings}
\usepackage{amssymb}
\lstset{literate=%
  {Ö}{{\"O}}1
  {Ä}{{\"A}}1
  {Ü}{{\"U}}1
  {ß}{{\ss}}2
  {ü}{{\"u}}1
  {ä}{{\"a}}1
  {ö}{{\"o}}1
}
\usepackage{courier}

\lstset{basicstyle=\footnotesize\ttfamily,breaklines=false,captionpos=b}
\lstset{framextopmargin=50pt,frame=bottomline}

\newdateformat{monthyeardate}{%
  \monthname[\THEMONTH] \THEYEAR}

\urlstyle{same}

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{{A thesis submitted for the degree of}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}

\def\company#1{\gdef\@company{#1}}
\def\firstExaminer#1{\gdef\@firstExaminer{#1}}
\def\firstExaminerLocation#1{\gdef\@firstExaminerLocation{#1}}
\def\secondExaminer#1{\gdef\@secondExaminer{#1}}
\def\secondExaminerLocation#1{\gdef\@secondExaminerLocation{#1}}
\def\course#1{\gdef\@course{#1}}

\def\thkoelnlogo{{\includegraphics[width=33mm]{support/thkoeln}}}
\def\inovexlogo{{\includegraphics[height=19mm]{support/inovex}}}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{titlepage}

  \thispagestyle{empty}
 
  
   
  \begin{center}
    \vspace*{-10ex} 
    \thkoelnlogo
    \hfill
    \inovexlogo
  \end{center}  

  \begin{center}
    \vspace{18 mm}
    \Large
    \textbf
    \@title
    \vspace{8 mm}
  \end{center}
  
  \begin{center}
    \scshape
    \Large
    \@degree
  \end{center}
  
  \begin{center}
    \vspace{5 mm}
    \large
    ausgearbeitet von\\
    \large
    \textbf{\@author}
  \end{center}

  \begin{center}
    \vspace{5 mm}
    \large
    vorgelegt and der\\
    \scshape
    \@college
  \end{center}

  \begin{center}
    \large
    im Studiengang\\
    \scshape
    \@course
  \end{center}

  \begin{center}
    \large
    in Kooperation mit der\\
    \textbf{\@company}
  \end{center}

  \begin{center}
    \begin{tabular}{rl}
      Erster Prüfer:  &  \@firstExaminer \\
                      &  \small \@firstExaminerLocation \\[1.0em]
      Zweiter Prüfer:  &  \@secondExaminer\\
                      &  \small \@secondExaminerLocation\\
    \end{tabular}
  \end{center}

\begin{center}
    \large
    \@degreedate
    
    \begin{center}
    \vspace*{1ex} 
    \includegraphics[scale=0.88]{support/Linie}\\
  \end{center}
    
  \end{center}


  \vfill

  \newpage
  \thispagestyle{empty}
  
  %Kontaktmöglichkeiten des Autors und der Prüfer
  \begin{center}
  \begin{tabular}{rl}
  &  \\[20.0em]
  
  \large \textbf{Adressen:}
  & \quad Steffen Tröster\\
  & \quad Ennest 30\\
  & \quad 57392 Schmallenberg\\
  & \quad steffen.troester@googlemail.com\\[2.0em]

  & \quad Prof. Dr. Hubert Randerath\\
  & \quad Technische Hochschule Köln\\
  & \quad Institut für Nachrichtentechnik\\
  & \quad Betzdorfer Straße 2\\
  & \quad 50679 Köln\\
  & \quad hubert.randerath@th-koeln.de\\[2.0em]

  & \quad Prof. Dr. Martin Eisemann\\
  & \quad Technische Hochschule Köln\\
  & \quad Institut für Informatik\\
  & \quad Steinmüllerallee 1\\
  & \quad 51643 Gummersbach\\
  & \quad martin.eisemann@th-koeln.de\\[2.0em]

  & \quad Christian Meder\\
  & \quad inovex GmbH\\
  & \quad Ludwig-Erhard-Allee 6\\
  & \quad 76131 Karlsruhe\\
  & \quad christian.meder@inovex.de\\[2.0em]
  
  \end{tabular}
  \end{center}

\end{titlepage}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {University of Oxford \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

