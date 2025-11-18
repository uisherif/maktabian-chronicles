#!/bin/bash
# Script to compile The Maktabian Chronicles to PDF

# Add LaTeX to PATH
export PATH="/Library/TeX/texbin:$PATH"

# Compile the LaTeX document
echo "Compiling The Maktabian Chronicles..."
xelatex -interaction=nonstopmode sample_latex_simple.tex

# Check if compilation was successful
if [ -f "sample_latex_simple.pdf" ]; then
    echo "✓ PDF generated successfully: sample_latex_simple.pdf"
    echo "✓ Opening PDF..."
    open sample_latex_simple.pdf
else
    echo "✗ Compilation failed. Check the log file for errors."
    cat sample_latex_simple.log
fi