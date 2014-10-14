\ProvidesClass{fablab-aushang}

\PassOptionsToClass{\CurrentOption}{scrartcl} % Optionen wie landscape an scrartcl weitergeben
\LoadClass[a4paper]{scrartcl}

\usepackage[utf8x]{inputenc}     %UTF-8 Zeichen möglich
\usepackage[ngerman]{babel}     %Deutsche Zahlen-, Datumsformate
\usepackage[babel,german=quotes]{csquotes} %\enquote{...} für deutsche Anführungszeichen um ein Wort
\usepackage{blindtext}
\usepackage{parskip}            %In Deutschland übliche Absätze
\usepackage{tikz}               %Für Header benötigt
\usepackage{graphicx}           %Für Header benötigt
\usepackage{fancyhdr}           %Erzeugt neuen Pagestyle mit eigenen Headern
\usepackage{color}              %Für farbigen Text
\usepackage{eso-pic}            %Für Falzmarken
\usepackage{lastpage}           %Seitennummer der letzten Seite per \pageref*{LastPage}

\usepackage[hyphens]{url} % URLs, diese automatisch umbrechen
\usepackage{hyperref}
\hypersetup{colorlinks=false,urlbordercolor=blue,linkbordercolor=red}

\usepackage{ifthen}
\ifthenelse{\isundefined{\basedir}}{
	
}
{}
% \setlength{\oddsidemargin}{0cm} %kein zusätzlicher rand zu 2.5 nötig
% \setlength{\textwidth}{17cm}    %rechter rand: 1.5cm
\usepackage[right=1.5cm,left=2.5cm,top=2cm,bottom=3.5cm]{geometry} %so geht das schön einfach

\definecolor{fablab}{RGB}{20,51,105}
                                %Fablab-Blau

\setlength{\headheight}{56pt} % Wenn dies nicht groß genug gesetzt ist, ist die Fußzeile der ersten Seite verschoben und es erscheint die Warnung "headheight too small"
\pagestyle{fancy}               %Fancy Seitenstil verwenden
\fancyhf{}                      %alle Kopf- und Fußzeilenfelder bereinigen

%
%Kopfzeile Rechts 
%
\fancyhead[R]{
        \begin{tikzpicture}
                \node at (14.75cm,0.5cm) {\includegraphics[height=1cm]{\basedir/logo.pdf}};                      %TODO
                                %Logo einfügen
                \path[color=fablab] (0, 0) edge (17, 0);
                                %Trennlinie einfügen
                \node at (0cm, 0.5cm)[anchor=west] {\LARGE \@title};
        \end{tikzpicture}
}
\fancyfoot[L]{
        \@author
}
\fancyfoot[C]{
        Seite \thepage~von~\pageref*{LastPage}
}
\fancyfoot[R]{
        \today
}               
\renewcommand{\headrulewidth}{0pt}
                                %Standardlinie entfernen
% \renewcommand{\headsep}{0pt}
\setlength{\voffset}{-0.3cm}    %Kopf ein wenig nach oben verschieben
\setlength{\hoffset}{-0.5cm}    %Linken Rand ein wenig verkleinern
% \renewcommand{\textheight}{23cm}%Textbereich vergrößern
\renewcommand{\familydefault}{\sfdefault}
                                %Serifenlose Schrift

% Neuer Befehl \subscript (Text tiefgestellt) von http://anthony.liekens.net/index.php/LaTeX/SubscriptAndSuperscriptInTextMode
\newcommand{\subscript}[1]{\ensuremath{_{\textnormal{\small{#1}}}}}
\newcommand{\zitat}[1]{\begin{quote}\textit{#1}\end{quote}}

% \let\@maketitleReal\maketitle
% \renewcommand{\maketitle}{
% % @title usw. sichern, da diese von maketitle gelöscht werden (wieso auch immer)
% \let\doctitle\@title
% \let\docauthor\@author
% \let\docdate\@date
% 
% \@maketitleReal
% 
% \let\@title\doctitle
% \let\@author\docauthor
% \let\@date\docdate
% }
\newcommand{\titletext}[1]{
  \begin{center}
   \vspace*{1cm} 
   \fontsize{36pt}{36pt} \selectfont \textbf{#1} \\
   \vspace{0.5cm}
  \end{center}
}
\renewcommand{\maketitle}{
  \titletext{\@title}
}


% \begin{document}
% \vspace*{0.5cm} %Extraplatz auf Seite 1
% \mytext
% \end{document}