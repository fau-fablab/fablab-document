Betriebsanweisungen
===================

Betriebsanweisungen (BA) im DGUV-Stil mit einheitlichem Layout für alle FabLab-Projekte.
Jede BA ist eine `.tex`-Datei im Projekt und wird

* als **eigenes PDF** zum Aushang am Gerät gebaut und
* als **Seite in der Einweisung** eingebunden.

Layout, Symbole und Vorlagen liegen zentral in `fablab-document`:

| Datei | Inhalt |
|---|---|
| [`fablab-ba.sty`](fablab-ba.sty) | Layout und Befehle |
| [`fablab-ba.cls`](fablab-ba.cls) | Rahmen für das eigene BA-PDF (A4, 10 mm Rand) |
| [`ba-symbole/`](ba-symbole/QUELLEN.md) | Sicherheitszeichen nach ISO 7010 und GHS-Piktogramme (Wikimedia Commons) |
| [`ba-vorlage-maschine.tex`](ba-vorlage-maschine.tex) | Vorlage Arbeitsmittel (blauer Rahmen) |
| [`ba-vorlage-gefahrstoff.tex`](ba-vorlage-gefahrstoff.tex) | Vorlage Gefahrstoff (oranger Rahmen) |

Neue BA anlegen
---------------

```bash
mkdir -p betriebsanweisung
cp fablab-document/ba-vorlage-maschine.tex betriebsanweisung/ba_geraet.tex
```

Eigenes PDF, z.B. `Betriebsanweisung_Geraet.tex`:

```latex
\documentclass{fablab-document/fablab-ba}
\begin{document}\BAinhalt{betriebsanweisung/ba_geraet}\end{document}
```

Im `Makefile` bekommt jede BA eine eigene Zeile, standardmäßig auskommentiert:

```make
TARGET  = Einweisung_Geraet Einweisungsliste_Geraet
# Betriebsanweisung, standardmäßig aus. Einkommentieren: BA wird als eigenes PDF
# und als Seite in der Einweisung gebaut.
#TARGET += Betriebsanweisung_Geraet
include fablab-document/Makefile.include
```

In der Einweisung (Seite mit eigenem Rand, Eintrag im Inhaltsverzeichnis):

```latex
\usepackage{fablab-document/fablab-ba}          % in der Präambel
...
\BAseite[sec:betriebsanweisung]{betriebsanweisung/ba_geraet}
```

Das optionale Argument ist ein Label für `\ref`. Mehrere BAs pro Projekt sind möglich,
z.B. eine für das Gerät und eine für einen Gefahrstoff.

BA ein- und ausschalten
-----------------------

Betriebsanweisungen sind standardmäßig **aus**. Eine BA wird nur gebaut, wenn ihr
eigenes PDF in `TARGET` steht. Die Zeile `TARGET += Betriebsanweisung_Geraet` im
`Makefile` schaltet sie an beiden Stellen ein: `make` baut das eigene PDF, und
`\BAseite` bindet die Seite in die Einweisung ein. Auskommentiert ist sie an beiden
Stellen aus (mit Warnung im Log). Bei mehreren BAs gilt das für jede einzeln.

Dafür schreibt `make` die aktiven BAs nach `ba-aktiv.tex` (in `.gitignore` eintragen).
Ohne diese Datei, also beim Bauen ohne `make`, ist keine BA aktiv.

Verweise auf die BA im Text, die sonst ins Leere zeigen würden:

```latex
\BAfalls{betriebsanweisung/ba_geraet}{Zusätzlich gilt die Betriebsanweisung
  (Abschnitt~\ref{sec:betriebsanweisung}).}
\BAfalls[Text ohne BA]{betriebsanweisung/ba_geraet}{Text mit BA}
```

Einstellungen
-------------

Jede BA beginnt mit `\BAsetup{...}`:

| Schlüssel | Bedeutung |
|---|---|
| `typ` | `maschine` (blau, § 12 BetrSichV), `gefahrstoff` (orange, § 14 GefStoffV), `biostoff` (grün, § 14 BioStoffV) |
| `titel` | Zeile „Arbeitsmittel:“ bzw. „Gefahrstoff:“ im Kopf |
| `kurztitel` | Zusatz im Inhaltsverzeichnis der Einweisung („Betriebsanweisung *kurztitel*“) |
| `taetigkeit` | Zeile „Tätigkeit:“ |
| `nummer` | siehe Nummerierung |
| `stand` | Datum der Freigabe; ändert sich nicht mit jedem Commit |
| `verantwortlich` | Name unter der Unterschriftenlinie |
| `bild` | Gerätefoto(s) im Kopf, mehrere mit Komma |
| `signalwort` | statt Bild, z.B. `GEFAHR` bei Gefahrstoffen |
| `bildcode` | beliebiger LaTeX-Code statt Bild (z.B. TikZ) |
| `entwurf` | Wasserzeichen „ENTWURF“, solange die BA nicht freigegeben ist |
| `hinweis` | kleiner Text unter der Fußzeile, z.B. Lizenzhinweis |
| `schrift` | Schriftgröße, Standard `\small`; bei langen BAs `\footnotesize` |
| `betreiber`, `bereich`, `logo`, `grundlage`, `label` | Standardwerte überschreiben |

Standardwerte für alle BAs eines Dokuments ändern: `\BAstandard{bereich=..., schrift=...}`.

Inhalt: `\BAkopf`, danach `\BAblock{TITEL}{Symbole}{Text}` für jeden Abschnitt und
`\BAletzterblock{TITEL}{Symbole}{Text}` als letzten Abschnitt (füllt die Seite, mit
Stand und Unterschrift). Symbole als Kennung mit Komma, z.B. `W017,W019`; leer = kein Symbol.
Eigene Bilder im Projekt gehen auch (Dateiname ohne Endung).

**Eine BA muss auf eine Seite passen.** Ist sie länger, bricht der Build mit einer
Fehlermeldung ab.

Nummerierung
------------

| Art | Schema | Beispiel |
|---|---|---|
| Arbeitsmittel | `BA-<Kürzel>-<Nr.>`, zweistellig je Gerät | `BA-3D-01` |
| Gefahrstoff | `BA-GS-<Nr.>`, fortlaufend für das ganze FabLab | `BA-GS-01` |
| Biostoff | `BA-BS-<Nr.>`, fortlaufend für das ganze FabLab | `BA-BS-01` |

Gefahrstoffe haben eine FabLab-weite Nummer, weil ein Stoff (z.B. Isopropanol) an
mehreren Geräten vorkommen kann.

| Kürzel | Gerät / Bereich | Repository |
|---|---|---|
| `3D` | FDM-3D-Drucker (Bambu Lab) | 3d-drucker-einweisung |
| `SLA` | Resin-3D-Drucker | sla-drucker-einweisung |
| `LC` | Lasercutter | lasercutter-einweisung |
| `CNC` | CNC-Fräse | fraese-einweisung |
| `IM` | Mini-Fräse iModela | fraese-imodela-einweisung |
| `DB` | Drehbank | drehbank-einweisung |
| `TK` | Tischkreissäge | tischkreissaege-einweisung |
| `HK` | Handkreissäge (Festool) | festool-kreissaege-einweisung |
| `OF` | Oberfräse (Festool) | festool-oberfraese-einweisung |
| `DF` | Dübelfräse (Festool DOMINO) | festool-duebelfraese-einweisung |
| `SO` | Shaper Origin | shaper-origin-einweisung |
| `SP` | Schneideplotter | schneideplotter-einweisung |
| `ST` | Stickmaschine | stickmaschine-einweisung |
| `NM` | Nähmaschine | naehmaschine-einweisung |
| `PA` | Platinenätzer | platinenaetzer-einweisung |
| `RO` | Reflow-Ofen | reflow-ofen-einweisung |
| `DL` | Dampfphasenlötanlage | dampfphasenloetanlage-einweisung |
| `UB` | Ultraschallbad | ultraschallbad-einweisung |
| `BP` | Buttonpresse | buttonpresse-einweisung |
| `WS` | Werkstatt allgemein | werkstatt-einweisung |

Vergebene Gefahrstoff-Nummern:

| Nummer | Gefahrstoff | Repository |
|---|---|---|
| `BA-GS-01` | Phrozen Water-Washable Rapid Black (Resin) | sla-drucker-einweisung |

Neue Kürzel und Gefahrstoff-Nummern bitte hier eintragen.
