How to deploy other documents
=============================

examples for device instructions
--------------------------------

* in your project, include [fablab-document](https://github.com/fau-fablab/fablab-document) as git submodule.

```bash
git submodule add git@github.com:fau-fablab/fablab-document.git fablab-document -b master
```

* copy [`Makefile.example`](Makefile.example) to the main directory and adjust `TARGET`

```bash
DEVICE="Dev"
device="dev"
cp fablab-document/Makefile.example Makefile && sed -i 's/my_tex_main_filename__TODO__changeme/Einweisung_'${DEVICE}'/g' Makefile
```

* copy [`README.md.example`](README.md.example) to the main directory and adjust it

```bash
cp fablab-document/README.md.example README.md
sed -i 's/\$Geraet/'${DEVICE}'/g' README.md
sed -i 's/\$geraet/'${device}'/g' README.md
```

* copy [`gitignore.example`](gitignore.example) to the main direcory (`.gitignore`)

```bash
cp fablab-document/gitignore.example .gitignore
```

* check that make produces the required files in `output/`

```bash
make
```

* add the repository to the buildserver, see `macgyver.fablab.fau.de:/home/buildserver/README`

* optional: GitHub Action einrichten, die die PDFs bei jedem Push baut

```bash
mkdir -p .github/workflows
cp fablab-document/workflow.example.yml .github/workflows/pdf.yml
```

GitHub Action und Versionsnummer
--------------------------------

Der gemeinsame Workflow [`.github/workflows/pdf.yml`](.github/workflows/pdf.yml) baut die PDFs mit `make`
und stellt sie als Artefakt bereit. Bei Pushes auf den Hauptbranch legt er ein Release
`vJJJJ.MM.TT` mit den PDFs an; mehrere Pushes am selben Tag ersetzen das Release des Tages.

Die Version steht rechts in der Fußzeile (`Version 2026.09.29`). `make` nimmt dafür
das Datum des letzten Commits, bei nicht committeten Änderungen mit `-entwurf`.
Derselbe Commit ergibt also immer dieselbe Version, egal wann und wo gebaut wird.
In der Action heißen Builds außerhalb des Hauptbranches `JJJJ.MM.TT-entwurf-<commit>`.

```bash
make -s version          # Version anzeigen
make VERSION=2026.09.29  # Version selbst festlegen
```

Ohne git (und ohne `VERSION`) steht wie bisher das Datum in der Fußzeile.
