% !TeX program  = xelatex
% !TeX encoding = UTF-8
% !TeX root     = main.tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mirea-prog-lang}[2024]
\RequirePackage{setspace}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass[14pt, a4paper, titlepage]{extarticle}


\RequirePackage{hyperref}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} % Отключение подсветки ссылок


\RequirePackage[english,main=russian]{babel}
\RequirePackage{fontspec}
\setmainfont{Times New Roman} % Если возникают проблемы при компиляции с данной строкой, необходимо на компьютер установить  Times New Roman
\setmonofont{Courier New}
\RequirePackage{newtxmath} % Поменять гарнитуру в формулах на Times New Roman

\RequirePackage[left=30mm, right=15mm, top=20mm, bottom=20mm]{geometry}

\RequirePackage{indentfirst} % Красная строка у первого абзаца раздела

\RequirePackage{graphicx}
\RequirePackage{fancyhdr} % Добавить этот пакет для работы с колонтитулами
\RequirePackage{amsmath} % Добавить этот пакет для использования \textnumero

\parindent=1.25cm % Размер красной строки
\sloppy
\parskip=0pt % Отступ между абзацами

\righthyphenmin=2 % Разрешить переносить слоги в 2 буквы (стандартное значение 3)

\linespread{1.5} % полуторный межстрочный интервал

%\RequirePackage{tocbibind} % Добавить раздел оглавление в оглавление

% Настройка заголовка оглавления
\addto\captionsrussian{\renewcommand{\contentsname}{\textbf{\leftline{СОДЕРЖАНИЕ}}}}

\RequirePackage[normalem]{ulem} % underline some lines


\RequirePackage{tocloft}
% Формат оглавления
\renewcommand\cfttoctitlefont{\hfill\fontsize{18pt}{22pt}\selectfont\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\hfill}


\clubpenalty=10000
\widowpenalty=10000
%\setlength{\cftbeforesecskip}{0pt} % Addtional space between sections in toc

%% Уровень section
%\setlength{\cftbeforesecskip}{0pt} % Отступ перед section
%\setlength{\cftsecindent}{0em} % Отступ от левого края для section
%\setlength{\cftsecnumwidth}{2.3em} % Ширина номера section
%
%% Уровень subsection
%\setlength{\cftbeforesubsecskip}{0pt} % Отступ перед subsection
%\setlength{\cftsubsecindent}{1.5em} % Отступ от левого края для subsection
%\setlength{\cftsubsecnumwidth}{3.2em} % Ширина номера subsection
%
%% Уровень subsubsection
%\setlength{\cftbeforesubsubsecskip}{0pt} % Отступ перед subsubsection
%\setlength{\cftsubsubsecindent}{3em} % Отступ от левого края для subsubsection
%\setlength{\cftsubsubsecnumwidth}{4.1em} % Ширина номера subsubsection
%
%% Уровень paragraph
%\setlength{\cftbeforeparaskip}{0pt} % Отступ перед paragraph
%\setlength{\cftparaindent}{4.5em} % Отступ от левого края для paragraph
%\setlength{\cftparanumwidth}{5em} % Ширина номера paragraph
%
%% Уровень subparagraph
%\setlength{\cftbeforesubparaskip}{0pt} % Отступ перед subparagraph
%\setlength{\cftsubparaindent}{6em} % Отступ от левого края для subparagraph
%\setlength{\cftsubparanumwidth}{6.5em} % Ширина номера subparagraph

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftdotsep}{1} % Устанавливает расстояние между точками в оглавлении

\RequirePackage{placeins} % Команда \FloatBarrier для размещения плавающего окружения в пределах раздела, подраздела, пункта

% Настройка раздела, подраздела, подподраздела
% Чтобы было по центру добавить \filcenter
\RequirePackage{titlesec}
\titleformat{\section}{\FloatBarrier\parskip=6pt\fontsize{18pt}{22pt}\selectfont\bfseries\uppercase}{\thesection}{.5em}{}
\titleformat{\subsection}{\FloatBarrier\fontsize{16pt}{20pt}\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\FloatBarrier\fontsize{14pt}{18pt}\bfseries}{\thesubsubsection}{1em}{}

% Title spacing
%\titlespacing{\chapter}{0cm}{0pt}{0pt}
\titlespacing{\section}{0cm}{0pt}{10pt}
\titlespacing{\subsection}{0cm}{15pt}{10pt}
\titlespacing{\subsubsection}{0cm}{15pt}{10pt}
\titlespacing{\paragraph}{1.25cm}{0pt}{0pt}


\AddToHook{cmd/section/before}{\clearpage} % Начинать раздел с новой страницы

\renewenvironment{abstract}{\clearpage\section*{\MakeUppercase{\abstractname}}}{\clearpage}

\labelwidth=1.25cm % Горизонтальный отступ у элемента списка

% Листинги
\RequirePackage{xcolor}
\RequirePackage{listings}
\lstset{
    basicstyle=\ttfamily\footnotesize\linespread{1.5},
    backgroundcolor=\color{white},
    frame=single,
    framerule=0.5pt,
    rulecolor=\color{black},
    captionpos=t,
    tabsize=2,
    breaklines=true,
    columns=fullflexible,
    flexiblecolumns,
    keepspaces=true,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    extendedchars=true,
    breakautoindent=true,
}

\lstnewenvironment{mylstlisting}[1][]{
    \lstset{
        basicstyle=\ttfamily\footnotesize,
        backgroundcolor=\color{white},
        frame=single,
        framerule=0.5pt,
        rulecolor=\color{black},
        captionpos=t,
        tabsize=2,
        breaklines=true,
        columns=fullflexible,
        flexiblecolumns,
        keepspaces=true,
        showspaces=false,
        showstringspaces=false,
        showtabs=false,
        extendedchars=true,
        breakautoindent=true,
        #1
    }
    \linespread{1}\selectfont
}{}

\newcommand{\listingfromfile}[2][]{%
    \lstinputlisting[basicstyle=\ttfamily\footnotesize\linespread{1}\selectfont, #1]{#2}
}

% Списки %

\RequirePackage{enumitem}
\setlist{nosep}


\setlist[description]{style=nextline}


% Ненумерованные списки разной вложенности
\renewcommand\labelitemi{---}
\renewcommand\labelitemii{---}
\renewcommand\labelitemiii{---}
\renewcommand\labelitemiv{---}
\setlist[itemize]{
    leftmargin=0cm,
    itemindent=1.25cm,
    labelwidth=-0.6cm,
}

% Нумерованные списки разной вложенности
\renewcommand\labelenumi{\arabic{enumi}.}
\renewcommand\labelenumii{\asbuk{enumii}.}
\renewcommand\labelenumiii{\arabic{enumiii}.}
\renewcommand\labelenumiv{\asbuk{enumiv}.}
\setlist[enumerate]{
    leftmargin=0cm,
    itemindent=1.25cm,
    labelwidth=-0.65cm
}

% Форматирование списков
\setlist{itemsep=0pt, parsep=0pt, topsep=0mm} % Возможна опция wide
\makeatletter
\AddEnumerateCounter*{\asbuk}{\c@asbuk}
\makeatother

\makeatletter
% Буквы для нумерации списка (исключены ё, з, щ, ч, ъ, ы, ь)
% Подробнее https://ctan.math.illinois.edu/macros/latex/required/babel/contrib/russian/russianb.pdf
\def\russian@alph#1{\ifcase#1\or
а\or б\or в\or г\or д\or е\or ж\or
и\or к\or л\or м\or н\or о\or п\or
р\or с\or т\or у\or ф\or х\or ц\or
ш\or э\or ю\or я\else\@ctrerr\fi}
\def\russian@Alph#1{\ifcase#1\or
А\or Б\or В\or Г\or Д\or Е\or Ж\or
И\or К\or Л\or М\or Н\or О\or П\or
Р\or С\or Т\or У\or Ф\or Х\or Ц\or
Ш\or Э\or Ю\or Я\else\@ctrerr\fi}

\patchcmd{\l@section}{#1}{\textnormal{\uppercase{#1}}}{}{} % Разделы в оглавлении без выделения жирным, в верхнем регистре
\patchcmd{\l@section}{#2}{\textnormal{#2}}{}{} % Страницы без выделения жирным

\apptocmd{\appendix}{
    \renewcommand{\thesection}{\Asbuk{section}}
    \titleformat{\section}{\filcenter\fontsize{18pt}{22pt}\selectfont\bfseries}{}{0pt}{\MakeUppercase{\appendixname}~\thesection \\}{}{} % Изменение формата раздела приложения
    \renewcommand\thefigure{\Asbuk{section}.\arabic{figure}} % Изменении формата нумерации иллюстрации
    \renewcommand\thetable{\Asbuk{section}.\arabic{table}} % Изменении формата нумерации таблицы
    \renewcommand\theequation{\Asbuk{section}.\arabic{equation}} % Изменении формата нумерации формулы

    \let\oldsec\section
    \renewcommand{\section}{
        \clearpage
        \phantomsection
        \refstepcounter{section}
        \setcounter{figure}{0} % Счёт иллюстраций в пределах одного приложения
        \setcounter{table}{0} % Счёт таблиц в пределах одного приложения
        \setcounter{equation}{0} % Счёт иллюстраций в пределах одного приложения
        \addcontentsline{toc}{section}{\appendixname~\thesection}
        \oldsec*} % Нумерация раздела после названия
}

\makeatother


\RequirePackage[labelsep=endash]{caption} % Настройка пунктуации
\captionsetup[table]{justification=raggedright, singlelinecheck=false} % Выравнивание по левому краю надписи таблицы

\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}} % Переопределение caption из babel


% Настройка заголовка списка использованных источников
\addto\captionsrussian{\renewcommand{\refname}{СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ}}

\BeforeBeginEnvironment{thebibliography}{
    \phantomsection % для корректной ссылки в оглавлении
    \makeatletter
    \renewcommand*{\@biblabel}[1]{#1.\hfill} % формат нумерации списка
    \makeatother}

\setlength{\bibindent}{1.25cm} % Убрать отступы у элементов списка использованных источников + \{thebibliography}{99\kern\bibindent}
