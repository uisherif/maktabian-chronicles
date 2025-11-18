# LaTeX Compilation Guide for The Maktabian Chronicles

## Overview

This guide explains how to compile **The Maktabian Chronicles** into a professional book format using LaTeX. The project uses the `memoir` document class, which is designed specifically for long-form fiction and provides excellent typographic control.

## File Structure

```
book-test/
├── sample_latex_book.tex          # Main LaTeX template file
├── chapters/                       # Individual chapter markdown files
│   ├── chapter_01_*.md
│   ├── chapter_02_*.md
│   └── ... (22 chapters total)
├── FINAL_MANUSCRIPT.md            # Complete manuscript in markdown
└── LATEX_COMPILATION_GUIDE.md     # This file
```

## Prerequisites

### Required Software

1. **LaTeX Distribution**
   - **macOS**: MacTeX (https://www.tug.org/mactex/)
   - **Windows**: MiKTeX (https://miktex.org/) or TeX Live
   - **Linux**: TeX Live via package manager

2. **Text Editor** (choose one)
   - TeXShop (included with MacTeX)
   - TeXstudio (cross-platform, recommended for beginners)
   - VS Code with LaTeX Workshop extension
   - Overleaf (online, no installation needed)

### Required LaTeX Packages

The template uses these packages (most included in standard distributions):
- `memoir` - document class for books
- `fontspec` - font selection (requires XeLaTeX or LuaLaTeX)
- `xcolor` - color support
- `graphicx` - graphics inclusion
- `microtype` - typography refinements
- `hyperref` - PDF hyperlinks and metadata

## Compilation Methods

### Method 1: Direct LaTeX Compilation (Recommended)

The `sample_latex_book.tex` file is already set up with Chapter 1 converted. To compile:

```bash
# Using XeLaTeX (recommended for Unicode and font support)
xelatex sample_latex_book.tex
xelatex sample_latex_book.tex  # Run twice for table of contents

# Using PDFLaTeX (if fonts are an issue)
pdflatex sample_latex_book.tex
pdflatex sample_latex_book.tex

# Using LuaLaTeX (alternative with Unicode support)
lualatex sample_latex_book.tex
lualatex sample_latex_book.tex
```

**Note**: Always run LaTeX twice to ensure table of contents, cross-references, and page numbers are correct.

### Method 2: Using latexmk (Automated)

`latexmk` automatically runs LaTeX the correct number of times:

```bash
# Install latexmk (if not already installed)
# macOS: included with MacTeX
# Linux: sudo apt-get install latexmk
# Windows: included with MiKTeX

# Compile with automatic re-runs
latexmk -xelatex sample_latex_book.tex

# Clean auxiliary files after compilation
latexmk -c
```

### Method 3: Using an IDE

**TeXstudio:**
1. Open `sample_latex_book.tex`
2. Select Tools → Build & View (F5)
3. The PDF will open automatically

**VS Code with LaTeX Workshop:**
1. Open the project folder
2. Open `sample_latex_book.tex`
3. Click "Build LaTeX project" in the sidebar
4. View PDF with "View LaTeX PDF"

**Overleaf:**
1. Upload all `.tex` files
2. Set compiler to XeLaTeX (Menu → Compiler)
3. Click Recompile

## Converting Remaining Chapters

Currently, only Chapter 1 has been converted to LaTeX format in `sample_latex_book.tex`. To add the remaining 21 chapters:

### Manual Conversion Process

1. **Open a chapter markdown file** (e.g., `chapters/chapter_02_the_conversion.md`)

2. **Convert markdown syntax to LaTeX:**

   **Markdown → LaTeX Conversions:**
   - `# Heading` → `\chapter{Heading}` or `\section{Heading}`
   - `## Subheading` → `\subsection{Subheading}` (rarely needed in fiction)
   - `---` (horizontal rule) → `\scenebreak` (custom command defined in template)
   - `*italic*` → `\emph{italic}`
   - `**bold**` → `\textbf{bold}` (rarely used in fiction)
   - Regular paragraphs → Just plain text with blank lines between paragraphs

3. **Add to LaTeX file:**

   In `sample_latex_book.tex`, find the section marked:
   ```latex
   % ADD CHAPTER 2 HERE
   ```

   Insert your converted chapter there.

4. **Example conversion:**

   **Markdown:**
   ```markdown
   ## The Marriage

   Sahar married Elias Khoury in the spring of 1924, and the wedding was a study in contradictions.

   ---

   ## Teaching
   ```

   **LaTeX:**
   ```latex
   \section*{The Marriage}

   Sahar married Elias Khoury in the spring of 1924, and the wedding was a study in contradictions.

   \scenebreak

   \section*{Teaching}
   ```

### Automated Conversion (Pandoc)

For faster conversion, use Pandoc:

```bash
# Install Pandoc: https://pandoc.org/installing.html
# macOS: brew install pandoc
# Linux: sudo apt-get install pandoc
# Windows: download installer from pandoc.org

# Convert a single chapter
pandoc chapters/chapter_02_the_conversion.md -f markdown -t latex -o chapter_02.tex

# Then manually integrate into sample_latex_book.tex
```

**Note**: Pandoc output requires cleanup. You'll need to:
- Remove document preamble/headers
- Adjust `\chapter` vs `\section` commands
- Replace `---` with `\scenebreak`
- Fix any formatting issues

## Template Customization

### Fonts

The template uses Palatino. To change fonts:

```latex
\setmainfont{Garamond}  % Or: Baskerville, Caslon, Times New Roman, etc.
```

### Chapter Style

The custom chapter style is defined in the preamble:

```latex
\makechapterstyle{maktabian}{%
  % Customize here
}
```

Modify colors, spacing, or typography as needed.

### Page Size and Margins

Current setup: 6" × 9" (standard trade paperback)

To change:
```latex
\setstocksize{9in}{6in}  % Height × Width
\settrimmedsize{9in}{6in}{*}
\settrims{0pt}{0pt}
```

For different trim sizes:
- Mass market: 4.25" × 6.875"
- Trade paperback: 6" × 9" (current)
- Hardcover: 6" × 9" or 6.14" × 9.21"
- A5: 5.83" × 8.27"

### Scene Breaks

The template defines `\scenebreak` as:

```latex
\newcommand{\scenebreak}{%
  \vspace{\baselineskip}%
  \centerline{* * *}%
  \vspace{\baselineskip}%
}
```

Customize the symbol or spacing as desired.

## Complete Compilation Workflow

### Step-by-Step Process

1. **Convert chapters 2-22** from markdown to LaTeX format
2. **Insert each chapter** into `sample_latex_book.tex` in the appropriate place
3. **Update front matter** (title page, copyright, dedication already set up)
4. **Compile the document:**
   ```bash
   xelatex sample_latex_book.tex
   xelatex sample_latex_book.tex
   ```
5. **Review the PDF** for:
   - Page breaks (adjust with `\newpage` or `\clearpage` if needed)
   - Orphaned lines (single lines at top/bottom of pages)
   - Chapter formatting consistency
   - Table of contents accuracy

6. **Make adjustments** and recompile until satisfied

### Final Production Steps

For print-ready PDF:

1. **Ensure fonts are embedded:**
   ```bash
   pdffonts sample_latex_book.pdf
   # All fonts should show "yes" in "emb" column
   ```

2. **Check PDF/X compliance** (if required by printer):
   - Many print-on-demand services (IngramSpark, KDP) require PDF/X-1a or PDF/X-3
   - May need additional LaTeX packages: `pdfx`

3. **Create separate covers** (not included in interior PDF)

4. **Generate final files:**
   - Interior PDF (from LaTeX)
   - Cover PDF (design in separate tool: Canva, Photoshop, InDesign)

## Troubleshooting

### Common Errors

**Error: "Font not found"**
- Solution: Use XeLaTeX or LuaLaTeX instead of PDFLaTeX
- Or: Choose a different font that's installed on your system

**Error: "Undefined control sequence"**
- Solution: Check for special characters (%, $, &, #, _) and escape them: `\%`, `\$`, `\&`, `\#`, `\_`
- Or: Ensure all custom commands are defined

**Error: "Missing \$ inserted"**
- Solution: You have math mode characters outside math mode
- Check for: underscores, carets, or other special characters

**Overfull/Underfull hbox warnings**
- These are common and usually minor
- If severe (>10pt), manually insert `\linebreak` or rephrase sentences

### Performance Issues

If compilation is slow:
- Comment out `\usepackage{microtype}` temporarily
- Use `\includeonly{}` to compile only specific chapters during editing
- Use `latexmk` with `-pvc` flag for continuous preview

## Export Formats

### E-book Conversion

LaTeX is optimized for print. For e-books:

```bash
# Convert markdown to EPUB
pandoc FINAL_MANUSCRIPT.md -o maktabian_chronicles.epub --toc

# Convert markdown to MOBI (Kindle)
# First install Calibre for ebook-convert
pandoc FINAL_MANUSCRIPT.md -o temp.epub --toc
ebook-convert temp.epub maktabian_chronicles.mobi
```

### Alternative: Direct from LaTeX

```bash
# Convert LaTeX to HTML (intermediate step)
htlatex sample_latex_book.tex

# Then use Calibre or Pandoc to convert HTML → EPUB/MOBI
```

**Note**: E-book formatting from LaTeX often requires significant manual cleanup.

## Resources

### Documentation
- Memoir class manual: `texdoc memoir` (comprehensive, 600+ pages)
- LaTeX for book publishers: https://www.latex-project.org/
- Font catalog: https://tug.org/FontCatalogue/

### Templates and Inspiration
- LaTeX book templates: https://www.latextemplates.com/cat/books
- Self-publishing with LaTeX: https://tex.stackexchange.com/

### Community Support
- TeX Stack Exchange: https://tex.stackexchange.com/
- /r/LaTeX on Reddit
- LaTeX Discord servers

## Estimated Timeline

For converting and compiling all 22 chapters:

- **Manual conversion**: 10-15 hours (30-40 min per chapter)
- **Automated with cleanup**: 5-8 hours
- **Formatting and proofing**: 4-6 hours
- **Total**: 15-25 hours for complete book

## Next Steps

1. ✅ Review this guide
2. ⬜ Convert chapters 2-22 from markdown to LaTeX
3. ⬜ Insert converted chapters into `sample_latex_book.tex`
4. ⬜ Compile and review the complete book
5. ⬜ Make final adjustments for print/digital publication
6. ⬜ Generate final PDF for distribution

---

**Need help?** Refer to the memoir class documentation (`texdoc memoir`) or consult LaTeX Stack Exchange for specific questions.
