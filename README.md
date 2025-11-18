# The Maktabian Chronicles

A historical fiction novel about the Maktabi family across generations.

## Project Structure

```
book-test/
├── chapters/              # Individual chapter markdown files
├── docs/                  # Documentation and planning materials
│   ├── planning/         # Story planning documents (themes, plot, characters, outline)
│   └── reports/          # Project reports and reviews
├── build/                # Build-related files
│   ├── latex/           # LaTeX templates
│   ├── latex-sample/    # LaTeX examples and samples
│   └── temp/            # Temporary build files (gitignored)
├── final-manuscript/     # Final compiled manuscript and PDFs
├── public/              # Public-facing files (website, landing page)
├── scripts/             # Build and utility scripts
└── research/            # Research materials
```

## Key Files

- [final-manuscript/THE_MAKTABIAN_CHRONICLES_FINAL.pdf](final-manuscript/THE_MAKTABIAN_CHRONICLES_FINAL.pdf) - The complete novel
- [public/index.html](public/index.html) - Landing page for the book
- [scripts/compile_book.sh](scripts/compile_book.sh) - Script to compile LaTeX to PDF
- [docs/PROJECT_INSTRUCTIONS.md](docs/PROJECT_INSTRUCTIONS.md) - Project guidelines

## Building the Book

To compile the manuscript to PDF:

```bash
cd final-manuscript
./scripts/compile_book.sh
```

## Documentation

- [docs/planning/](docs/planning/) - Initial planning materials (themes, characters, plot, outline)
- [docs/reports/](docs/reports/) - Progress reports and editorial reviews
- [docs/LATEX_COMPILATION_GUIDE.md](docs/LATEX_COMPILATION_GUIDE.md) - Guide for compiling LaTeX files
