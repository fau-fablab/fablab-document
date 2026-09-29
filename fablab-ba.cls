% =====================================================================
%  fablab-ba.cls – eigenständiges PDF einer Betriebsanweisung (A4, 10 mm Rand)
%  Verwendung:
%    \documentclass{fablab-document/fablab-ba}
%    \begin{document}\BAinhalt{betriebsanweisung/ba_xyz}\end{document}
%  Doku: README_betriebsanweisung.md
% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fablab-document/fablab-ba}[2026/09/29 Betriebsanweisung FAU FabLab]

\LoadClass[a4paper]{scrartcl}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[ngerman]{babel}
\RequirePackage[babel,german=quotes]{csquotes}
\RequirePackage{textcomp}
\RequirePackage{parskip}
\RequirePackage[a4paper,margin=10mm]{geometry}
\RequirePackage{microtype}
\RequirePackage{fablab-document/fablab-ba}
\renewcommand{\familydefault}{\sfdefault}
\pagestyle{empty}

% Versionsnummer wie in fablab-document.cls (version.tex erzeugt make)
\AtBeginDocument{%
  \@ifundefined{Version}{\InputIfFileExists{version}{}{}}{}%
}
