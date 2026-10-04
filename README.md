fablab-document
===============

LaTeX-Klasse für FabLab-Dokumente

Für Informationen, wie man diese Klasse für FabLab Projekte verwenden kann, schau in [`README_deployment.md`](README_deployment.md).

Betriebsanweisungen im einheitlichen Layout: [`README_betriebsanweisung.md`](README_betriebsanweisung.md).

Logo
----

Das Logo des FAU FabLab mit FAU-Schriftzug kommt aus dem Untermodul `logo`
([fau-fablab/logo](https://github.com/fau-fablab/logo), `Logo/Logo-FAU-bunt.pdf`) und steht wie die
Dokumente unter [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
Klonen daher mit `--recursive`, siehe [`README_deployment.md`](README_deployment.md).

Layout
------

- Schrift: Libertinus (Serif, SIL OFL) für Fließtext und Überschriften. Betriebsanweisungen werden immer in Latin Modern Sans gesetzt, damit sie auf eine Seite passen.
- Duplexdruck: Buchlayout (`twoside`), der breitere Rand (2,5 cm) liegt innen, außen sind es 1,5 cm.
- Fußzeile mit blauer Linie; keine Hurenkinder und Schusterjungen.
- Unter der Fußzeile steht auf jeder Seite klein die Lizenzzeile (CC BY-SA 3.0, Repository, Revision), auch wenn ein Dokument `\fancyfoot[L]`, `[C]` oder `[R]` überschreibt. Das Repository trägt `make` aus `git remote` in `revision.tex` ein, abweichend mit `\repo{name}`; abschalten mit `\FLLizenzzeilefalse`.
- Englische Übersetzungen in hellem Grau (`FLgrau`), z. B. „Seite 1 von 4 · Page 1 of 4“.
- Abschnitte, deren Titel „Betreuer“ enthält, beginnen auf einer neuen Seite. Mit `\renewcommand{\FLBetreuerUmbruch}{\cleardoublepage}` beginnen sie stattdessen auf einer rechten Seite.
