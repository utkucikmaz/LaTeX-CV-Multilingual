# LaTeX CV Multilingual

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://github.com/utkucikmaz/LaTeX-CV-Multilingual/workflows/Build%20LaTeX%20CVs/badge.svg)](https://github.com/utkucikmaz/LaTeX-CV-Multilingual/actions)
[![LaTeX](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A professional, ATS-friendly LaTeX CV template supporting multiple languages and writing systems. This template is designed for modern developers and professionals who need their CV in different languages for international job applications.

> **⭐ If you find this template useful, please consider giving it a star!**

## 🌍 Supported Languages

### Latin Script Languages

- 🇬🇧 English
- 🇩🇪 German
- 🇫🇷 French
- 🇪🇸 Spanish
- 🇵🇹 Portuguese
- 🇳🇱 Dutch
- 🇹🇷 Turkish

### CJK (Chinese, Japanese, Korean) Languages

- 🇨🇳 Chinese (Simplified)
- 🇯🇵 Japanese
- 🇰🇷 Korean

### RTL (Right-to-Left) Languages

- 🇸🇦 Arabic

### Cyrillic Script Languages

- 🇷🇺 Russian (Cyrillic)

## ✨ Features

- **ATS-Friendly**: Optimized for Applicant Tracking Systems with clean formatting
- **Professional Design**: Modern, clean layout with subtle gradients and professional typography
- **Responsive Layout**: Optimized for A4 paper with proper margins and spacing
- **Multi-language Support**: Full support for different writing systems and character sets
- **PDF Metadata**: Includes proper PDF metadata for better searchability
- **Semantic Structure**: Well-organized LaTeX code following best practices

## 📁 Project Structure

```
LaTeX-CV-Multilingual/
├── src/                    # Source LaTeX files
│   ├── latin/             # Latin script languages
│   │   ├── cv-english.tex
│   │   ├── cv-german.tex
│   │   ├── cv-french.tex
│   │   ├── cv-spanish.tex
│   │   ├── cv-portuguese.tex
│   │   ├── cv-dutch.tex
│   │   └── cv-turkish.tex
│   ├── cjk/               # Chinese, Japanese, Korean
│   │   ├── cv-chinese.tex
│   │   ├── cv-japanese.tex
│   │   └── cv-korean.tex
│   ├── rtl/               # Right-to-left languages
│   │   └── cv-arabic.tex
│   └── cyrillic/          # Cyrillic script languages
│       └── cv-russian.tex
├── output/                # Generated PDF files
├── build/                 # LaTeX build artifacts
├── assets/                # Additional resources
├── docs/                  # Documentation
├── Makefile              # Build automation
├── build.sh              # Alternative build script
├── README.md             # This file
└── .gitignore            # Git ignore rules
```

## 🚀 Quick Start

### Prerequisites

- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- XeLaTeX or LuaLaTeX compiler (recommended for CJK languages)
- Make (optional, for build automation)

### Building a CV

#### Method 1: Using Make (Recommended)

```bash
# Build English CV
make cv-english

# Build all CVs
make all

# Build specific language groups
make latin      # Latin script languages
make cjk        # CJK languages
make rtl        # RTL languages
make cyrillic   # Cyrillic languages

# Clean build artifacts
make clean

# Clean everything including PDFs
make clean-all
```

#### Method 2: Manual Compilation

```bash
# For Latin script languages (including Turkish)
pdflatex src/latin/cv-english.tex

# For CJK languages (requires XeLaTeX)
xelatex src/cjk/cv-chinese.tex

# For RTL languages
xelatex src/rtl/cv-arabic.tex

# For Cyrillic languages
xelatex src/cyrillic/cv-russian.tex
```

### Customization

Each CV file can be customized by editing the corresponding `.tex` file:

1. **Personal Information**: Update name, contact details, and links
2. **Professional Summary**: Modify the summary section
3. **Experience**: Add or update work experience entries
4. **Education**: Update educational background
5. **Skills**: Modify technical skills and competencies
6. **Projects**: Update featured projects section

## 🎨 Design Features

- **Typography**: Uses Latin Modern font for better readability
- **Color Scheme**: Professional grayscale palette for ATS compatibility
- **Layout**: Two-column optimized layout for efficient space usage
- **Headers**: Gradient name effect with clean section separators
- **Spacing**: Optimized line spacing and margins for readability

## 📋 Template Sections

- **Header**: Name, title, contact information
- **Professional Summary**: Brief overview of qualifications
- **Professional Experience**: Work history with achievements
- **Featured Projects**: Key personal and professional projects
- **Technical Skills**: Categorized skill breakdown
- **Core Competencies**: Soft skills and methodologies
- **Education**: Academic background
- **Languages**: Human language proficiency

## 🔧 Technical Details

### LaTeX Packages Used

- `geometry`: Page layout and margins
- `hyperref`: PDF metadata and hyperlinks
- `xcolor`: Color definitions
- `tikz`: Graphics and gradient effects
- `enumitem`: List styling
- `titlesec`: Section formatting
- `needspace`: Prevent page breaks in sections

### Compiler Recommendations

- **Latin Languages**: `pdflatex` or `xelatex` (including Turkish)
- **CJK Languages**: `xelatex` (required)
- **RTL Languages**: `xelatex` (recommended)
- **Cyrillic Languages**: `xelatex` (recommended)

### PDF Optimization

All generated PDFs include:

- Document metadata (title, author, keywords)
- ATS-friendly formatting
- Optimized file size
- Searchable text content

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Adding New Languages

To add a new language:

1. Create a new `.tex` file in the appropriate directory:
    - `src/latin/` for Latin script languages
    - `src/cjk/` for CJK languages
    - `src/rtl/` for RTL languages
    - `src/cyrillic/` for Cyrillic script languages
2. Update the `Makefile` to include the new language in the appropriate variable
3. Test compilation with the appropriate LaTeX engine
4. Update this README with the new language

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- LaTeX community for excellent packages and documentation
- Modern CV design principles for ATS optimization
- Contributors who help maintain and improve this template

## 📞 Contact

For questions, suggestions, or issues:

- Create an issue on GitHub
- Contact: [utkucikmaz@gmail.com](mailto:utkucikmaz@gmail.com)
- Website: [utkucikmaz.com](https://www.utkucikmaz.com)

---

**Note**: This template is designed to be ATS-friendly while maintaining a professional, modern appearance. Always test your final PDF with ATS systems before submitting to employers.
