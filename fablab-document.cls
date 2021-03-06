\ProvidesClass{fablab-document/fablab-document}

\PassOptionsToClass{\CurrentOption}{scrartcl} % Optionen wie landscape an scrartcl weitergeben
\LoadClass[a4paper]{scrartcl}

\usepackage[T1]{fontenc} % interne Schriftkodierung von Tex
\usepackage[utf8]{inputenc}     %UTF-8 Zeichen möglich
\usepackage{lmodern}		% hübscherer Font

\usepackage[ngerman]{babel}     %Deutsche Zahlen-, Datumsformate
\usepackage[babel,german=quotes]{csquotes} %\enquote{...} für deutsche Anführungszeichen um ein Wort
\usepackage{blindtext}
\usepackage{parskip}            %In Deutschland übliche Absätze
\usepackage{tikz}               %Für Header benötigt
\usetikzlibrary{positioning}	% node-Platzierung, braucht man für fast alle Diagramme mit mehreren Objekten unter-/nebeneinander
\usepackage{graphicx}           %Für Header benötigt
\usepackage{fancyhdr}           %Erzeugt neuen Pagestyle mit eigenen Headern
\usepackage{color}              %Für farbigen Text
\usepackage{eso-pic}            %Für Falzmarken
\usepackage{lastpage}           %Seitennummer der letzten Seite per \pageref*{LastPage}
\usepackage{wrapfig} % Textumlauf um Bilder, z.B. \begin{wrapfigure}{r}{10cm} Bild rechts vom Text \end{wrapfigure}
\usepackage{caption} % Bildunterschriften
\usepackage[hyphens]{url} % URLs, diese automatisch umbrechen
\usepackage{hyperref} % Hyperlinks im PDF
\hypersetup{colorlinks=false,urlbordercolor=blue,linkbordercolor=red} % Link-Umrandung im PDF-Viewer (nicht beim Ausdrucken)

\usepackage{microtype}	% Mikro-Typographie: Schritbreite minimal variieren, um bessere Silbentrennung zu erreichen

%include revision.tex (generated by makefile)
\IfFileExists{revision}{
	\input{revision} 
}{
	\ClassWarningNoLine{fablab-document}{revision.tex not found, ignoring it. Please run 'make' if you can, otherwise the revision output will be skipped.}
	\newcommand{\Revision}{--- revision.tex not found ---}
}                

%%%%%%%%%%% config and macros for todonotes %%%%%%%%%%%
\usepackage[colorinlistoftodos,prependcaption]{todonotes}       %package todonotes for todo notes
\presetkeys{todonotes}{inline,backgroundcolor=red}{}            %configure todonotes
\newcommand{\todoUnwichtig}[1]{\textbf{\color{red}{TODO: #1}}}  %command for lower prio todos
\newcounter{mycomment}
\newcommand{\mycomment}[2][]{%
% initials of the author (optional) + note in the margin
\refstepcounter{mycomment}%
{%
\setstretch{0.7}% spacing
\todo[color={red!100!green!33},size=\small]{%
\textbf{Comment [\uppercase{#1}\themycomment]:}~#2}%
}}
%Use comment like \mycomment[PK]{Testing first time.}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[section]{placeins} % float barrier to prevent floats to move further than sections

% \usepackage{ifthen}
% \ifthenelse{\isundefined{\basedir}}{
% }
% {}

\usepackage[right=1.5cm,left=2.5cm,top=2cm,bottom=3.5cm]{geometry} %Seitenränder

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
                \node at (14.75cm,0.5cm) {\includegraphics[height=1cm]{\basedir/logo.pdf}};%
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

% TODO wozu folgendes: ????

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

% z.B. \ccLicense{drehbankblafu}{Bla Fusel Drehbank}: Link zu github.com/fau-fablab/drehbankblafu, Dokumenttitel "Bla Fusel Drehbank"
\newcommand{\ccLicense}[2]{
\section{Copyright}

\textbf{Verbreiten und Bearbeiten dieser Inhalte ist ausdrücklich erwünscht}, du musst (in der Regel) nur
\begin{itemize}
 \item Quelle und Lizenz korrekt angeben, wie etwa:\\
FAU FabLab et al.: #2, \url{https://github.com/fau-fablab/#1},\\Lizenz CC-BY-SA 3.0, \url{https://creativecommons.org/licenses/by-sa/3.0/}.
 \item das neue (gesamte) Dokument auch unter dieser Lizenz veröffentlichen.
\end{itemize}

\footnotesize
\begin{wrapfigure}{r}{4cm}
\vspace{-1.5em}
\includegraphics[width=4cm]{fablab-document/cc-by-sa.pdf}  
\vspace{-2.6em}
\end{wrapfigure}
Dieses Dokument \enquote{#2} des FAU FabLab und weiterer Autoren ist, bis auf besonders gekennzeichnete Stellen, lizenziert unter einer \emph{Creative Commons Namensnennung -- Weitergabe unter gleichen Bedingungen 3.0 Unported} Lizenz. Um eine Kopie dieser Lizenz zu sehen, besuchen Sie \url{http://creativecommons.org/licenses/by-sa/3.0/}.

Quelltext und Liste der Autoren auf GitHub: \url{https://github.com/fau-fablab/#1}.\\
Verbesserungsvorschläge gerne auch an \href{mailto:kontakt@fablab.fau.de}{kontakt@fablab.fau.de}.

Hinweis zu Sicherheitseinweisungen: Bitte beachte, dass Arbeitsschutz nicht per Copy-Paste erledigt werden kann, sondern jede Einweisung kritisch überprüft und auf den jeweiligen Einsatzzweck angepasst werden muss.

Dieses Dokument stammt aus fau-fablab/#1@\Revision{}.
\normalsize
}