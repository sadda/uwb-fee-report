\listfiles
\ProvidesClass{rice_report}[2025/09/23 v1.0 RICE report (RICE-S-01-2017-P02-v2)]

% Declare the Czech or Language options
\newif\if@czlang
\newif\if@enlang
\DeclareOption{lang=cz}{\@czlangtrue}
\DeclareOption{lang=en}{\@enlangtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[titlepage=true,12pt]{scrartcl}

% Load babel first
\def\@babelopts{main=czech,english,shorthands=off}
\if@enlang
  \def\@babelopts{main=english,czech,shorthands=off}
\fi
\RequirePackage[\@babelopts]{babel}
\RequirePackage{cleveref}

% Fix the Czech/English names due to too many packages
\if@czlang
  \addto\captionsczech{
    \renewcommand{\figurename}{Obr.}
    \renewcommand{\tablename}{Tab.}
    \renewcommand{\listfigurename}{Seznam obrázků}
    \renewcommand{\listtablename}{Seznam tabulek}
    \renewcommand{\refname}{Literatura}
    \renewcommand{\bibname}{Literatura}
  }
  \@ifpackageloaded{biblatex}{
    \DefineBibliographyStrings{czech}{
      bibliography = {Literatura},
      references  = {Literatura},
    }
  }{}
  \crefname{equation}{rovnice}{rovnice}
  \Crefname{equation}{Rovnice}{Rovnice}
  \crefname{figure}{obr.}{obr.}
  \Crefname{figure}{Obr.}{Obr.}
  \crefname{table}{tab.}{tab.}
  \Crefname{table}{Tab.}{Tab.}
  \crefname{section}{odd.}{odd.}
  \Crefname{section}{Odd.}{Odd.}  
\else\if@enlang
  \addto\captionsenglish{
    \renewcommand{\figurename}{Fig.}
    \renewcommand{\tablename}{Tab.}
    \renewcommand{\listfigurename}{List of Figures}
    \renewcommand{\listtablename}{List of Tables}
    \renewcommand{\refname}{References}
    \renewcommand{\bibname}{References}
  }
  \@ifpackageloaded{biblatex}{
    \DefineBibliographyStrings{english}{
      bibliography = {References},
      references  = {References},
    }
  }{}
  \crefname{equation}{equation}{equations}
  \Crefname{equation}{Equation}{Equations}
  \crefname{figure}{fig.}{figs.}
  \Crefname{figure}{Fig.}{Figs.}
  \crefname{table}{tab.}{tabs.}
  \Crefname{table}{Tab.}{Tabs.}
  \crefname{section}{sec.}{secs.}
  \Crefname{section}{Sec.}{Secs.}
\fi\fi

\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[hmargin=0.98in, tmargin=-.1in, bmargin=0.5in, includehead, includefoot, headsep=2cm]{geometry}
\RequirePackage{url}
\RequirePackage{setspace}
\RequirePackage[singlespacing=true,automark]{scrlayer-scrpage}
\RequirePackage{lastpage}
\RequirePackage[small,bf]{caption}
\RequirePackage{sansmath}
\sansmath
\RequirePackage{iftex}
\ifPDFTeX
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern}
\fi

\makeatletter

% Define default values for macros which can be deleted
\def\@rrnumber{}
\def\@classification{}
\def\@confidential{}

% Define variables from the main manuscript
\newcommand{\releasedate}[1]{\def\@releasedate{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\rrnumber}[1]{\def\@rrnumber{#1}}
\newcommand{\rtype}[1]{\def\@rtype{#1}}
\newcommand{\leader}[1]{\def\@leader{#1}}
\newcommand{\revision}[1]{\def\@revision{#1}}
\newcommand{\support}[1]{\def\@support{#1}}
\newcommand{\customer}[1]{\def\@customer{#1}}
\newcommand{\classification}[1]{\def\@classification{#1}}
\newcommand{\reportdedication}[1]{\def\@reportdedication{#1}}
\newcommand{\confidential}[1]{\def\@confidential{#1}}

% Define colors
\definecolor{fel_modra}{rgb}{0.2667,0.4627,0.6039} %68,118,154

% Define variables for Czech
\newcommand{\setczlang}{
	\pgfdeclareimage[width=\paperwidth]{title_header}{media/header_cz.png}
	\pgfdeclareimage[width=\paperwidth]{footer}{media/footer.png}
	\def\DepartTrans{\textbf{Pracoviště:}}	
	\def\ReportTrans{\textbf{Číslo dokumentu:}}	
	\def\ReportTypeTrans{\textbf{Typ zprávy:}}	
	\def\GroupTrans{\textbf{Řešitelé:}}	
	\def\LeaderTrans{\textbf{Hlavní řešitel:}}	
	\def\PagesTrans{\textbf{Počet stran:}}
	\def\DateTrans{\textbf{Datum vydání:}}	
	\def\ClassTrans{\textbf{Oborové zařazení:}}	
	\def\CustomerTrans{\textbf{Zadavatel / zákazník:}}	
	\def\SupplierTrans{\textbf{Zpracovatel / dodavatel:}}	
	\def\ContactTrans{\textbf{Kontaktní osoba:}}	
	\def\FooterTextLeft{\textcolor{white}{RICE - Regionální inovační centrum elektrotechniky FEL ZČU}}
    \def\FooterTextRight{\textcolor{white}{www.rice.zcu.cz}}
	\def\SuppTextRans{
		Západočeská univerzita v Plzni \\
		Regionální inovační centrum elektrotechniky \\
		Univerzitní 8	\\
		306 14 Plzeň
	}
    \def \filename{{\small{soubor:\ \jobname .tex}}}
	}

% Define variables for English
\newcommand{\setenlang}{
	\pgfdeclareimage[width=\paperwidth]{title_header}{media/header_en.png}
	\pgfdeclareimage[width=\paperwidth]{footer}{media/footer.png}
	\def\DepartTrans{\textbf{Department:}}	
	\def\ReportTrans{\textbf{Research report no.:}}	
	\def\ReportTypeTrans{\textbf{Report type:}}	
	\def\GroupTrans{\textbf{Authors:}}	
	\def\LeaderTrans{\textbf{Project leader:}}	
	\def\PagesTrans{\textbf{Pages:}}
	\def\DateTrans{\textbf{Release date:}}	
	\def\ClassTrans{\textbf{CEP Classification:}}	
	\def\CustomerTrans{\textbf{Customer:}}	
	\def\SupplierTrans{\textbf{Supplier:}}	
	\def\ContactTrans{\textbf{Contact person:}}	
	\def\FooterTextLeft{\textcolor{white}{RICE - Regional Innovation Centre for Electrical Engineering FEE UWB}}
    \def\FooterTextRight{\textcolor{white}{www.rice.zcu.cz}}
	\def\SuppTextRans{
		University of West Bohemia in Pilsen \\
        Regional Innovation Centre for Electrical Engineering \\
        Univerzitní 8	\\
        306 14 Plzeň
	}
    \def \filename{{\small{file:\ \jobname .tex}}}
	}	
\def \templatename{{\small{RICE-S-01-2017-P02}}}

% Always needed (abstract, keywords)
\def\abstractvalue{Abstract is always needed, please use command \textbackslash abstract\{\} to define it.}
\renewcommand{\abstract}[1]{\def\abstractvalue{#1}}
\def\keywordsvalue{Keywords are always needed, please use command \textbackslash keywords\{\} to define them.}
\newcommand{\keywords}[1]{\def\keywordsvalue{#1}}

% Needed in Czech version (title EN, abstract EN, keywords EN)
\def\titleentext{Title in English is needed, pleasu use command \textbackslash titleen\{\} to define it.}
\def\titleen#1{\gdef\titleentext{#1}}
\def\abstractvalueen{Abstract in English is needed, please use command \textbackslash abstracten\{\} to define it.}
\newcommand{\abstracten}[1]{\def\abstractvalueen{#1}}
\def\keywordsvalueen{Keywords in English are needed, please use command \textbackslash keywordsen\{\} to define them.}
\newcommand{\keywordsen}[1]{\def\keywordsvalueen{#1}}


% Make the first page
\renewcommand\maketitle{
	\begin{titlepage}
		\setlength\tabcolsep{0mm}
		\begin{singlespace}
			\begin{tikzpicture}[remember picture,overlay]
			    \node[yshift=0](titul) at (current page.north west)
			      {\begin{tikzpicture}[remember picture, overlay]
					\pgftext[at=\pgfpoint{0cm}{-5.5cm},left,base]{\pgfuseimage{title_header}} ;
					\pgftext[at=\pgfpoint{0cm}{-\paperheight},left,base]{\pgfuseimage{footer}} ;
                \node[anchor=west, xshift=2.5cm, yshift=-0.915\paperheight] {\mbox{\filename}};
				\node[anchor=east, xshift=-2.5cm, yshift=-0.915\paperheight] at (current page.north east) {\mbox{\templatename}};
				\node[anchor=west, xshift=2.5cm, yshift=-0.960\paperheight] {\mbox{\FooterTextLeft}};
				\node[anchor=east, xshift=-2.5cm, yshift=-0.960\paperheight] at (current page.north east) {\mbox{\FooterTextRight}};
	       \end{tikzpicture}
      };
   \end{tikzpicture}
\end{singlespace}
\begin{center}
	\vspace{9em}
    {\raggedright \titlefont{\color{fel_modra} \Huge \@title}\par}
	\vspace{2em}
	\begin{tabular}{p{0.3\linewidth}p{0.7\linewidth}}
		\DepartTrans & \@department \tabularnewline
        \ifx\@rrnumber\@empty\else
            \ReportTrans & \@rrnumber \tabularnewline
        \fi
		\ReportTypeTrans&  \@rtype \tabularnewline
		\GroupTrans & \@author \tabularnewline
		\LeaderTrans &\@leader \tabularnewline
		\PagesTrans & \pageref*{LastPage}\tabularnewline
		\DateTrans & \@releasedate \tabularnewline
        \ifx\@classification\@empty\else
		      \ClassTrans & \@classification \tabularnewline
        \fi
		&   \tabularnewline
	\end{tabular}
    \begin{minipage}[t]{0.49\linewidth}
        \CustomerTrans \\
        \@customer
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.49\linewidth}
        \SupplierTrans \\
        \SuppTextRans \\
        \ContactTrans \\
        \@support
    \end{minipage}    
	\vspace{1em}
    
    \ifx\@reportdedication\@empty\else
      \vspace{1em}
      \begin{center}
        \textbf{\@reportdedication} \\ \vspace{3mm}
        \ifx\@confidential\@empty\else
		    \textbf{\@confidential}
        \fi
      \end{center}
      \vspace{1em}
    \fi
\end{center}
\end{titlepage}
\pagenumbering{arabic} %% just to start from 1 next time
}

% Make the second page
\newcommand{\makesecpage}{
	\if@czlang
		\section*{Anotace} \abstractvalue
		\section*{Klíčová slova} \keywordsvalue
		\section*{Název zprávy v anglické jazyce / Report title} \titleentext
		\section*{Anotace v anglickém jazyce / Abstract} \abstractvalueen
		\section*{Klíčová slova v anglickém jazyce / Keywords} \keywordsvalueen
	\else\if@enlang
		\section*{Abstract} \abstractvalue
		\section*{Keywords} \keywordsvalue
	\fi\fi
	\pagebreak
}

% Change section title fonts
\addtokomafont{section}{\color{fel_modra}}
\addtokomafont{subsection}{\itshape}
\addtokomafont{subsubsection}{\itshape}
\addtokomafont{pagehead}{\upshape}
\addtokomafont{pagefoot}{\upshape}
\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}

\renewcommand{\arraystretch}{1.1}
\renewcommand{\familydefault}{\sfdefault}
\spacing{1.4}

% Handle header and move page number to right
\clearmainofpairofpagestyles
\pagestyle{scrheadings}
\cfoot{}
\ofoot*{\pagemark}

% Activate the correct language
\if@czlang
  \setczlang
\else\if@enlang
  \setenlang
\else
  \ClassError{rice_report}{Unknown language option}{You must select lang=cz or lang=en at the first line of the document.}%
\fi\fi

\makeatother