# Contributing to LaTeX CV Multilingual

Thank you for considering contributing to this project! We welcome contributions from everyone.

## How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:
- A clear, descriptive title
- Steps to reproduce the issue
- Expected behavior vs actual behavior
- Your LaTeX distribution and version
- Operating system

### Suggesting Enhancements

Enhancement suggestions are welcome! Please create an issue with:
- A clear description of the enhancement
- Why this enhancement would be useful
- Any examples or mockups if applicable

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following the guidelines below
3. **Test your changes** by compiling the affected CV files
4. **Update documentation** if you've added new features
5. **Submit a pull request** with a clear description of changes

## Development Guidelines

### Adding a New Language

To add support for a new language:

1. **Determine the script type** (Latin, CJK, RTL, or Cyrillic)
2. **Create the CV file** in the appropriate directory:
   - `src/latin/` for Latin script languages
   - `src/cjk/` for Chinese, Japanese, Korean
   - `src/rtl/` for right-to-left languages (Arabic, Hebrew, etc.)
   - `src/cyrillic/` for Cyrillic script languages

3. **Update the Makefile**:
   - Add the language to the appropriate variable (e.g., `LATIN_CVS`, `CJK_CVS`)
   - Add a convenience target if desired

4. **Update build.sh**:
   - Add the language to the appropriate build category
   - Add individual language build support

5. **Update README.md**:
   - Add the language to the supported languages list
   - Include the flag emoji and language name

6. **Test compilation**:
   ```bash
   make cv-yourlanguage
   # or
   ./build.sh yourlanguage
   ```

### Code Style

- **LaTeX formatting**: Follow the existing structure and formatting
- **Comments**: Add comments for non-obvious LaTeX code
- **Consistency**: Match the existing code style
- **ATS-friendly**: Ensure changes maintain ATS compatibility

### Testing

Before submitting a PR:

1. Compile all affected CV files successfully
2. Verify PDF output looks correct
3. Check that PDF metadata is properly set
4. Test with both `make` and `build.sh` if applicable

### Commit Messages

- Use clear, descriptive commit messages
- Start with a verb in present tense (e.g., "Add", "Fix", "Update")
- Reference issues when applicable (e.g., "Fix #123")

Examples:
```
Add support for Italian language
Fix spacing issue in CJK templates
Update README with new language instructions
```

## Project Structure

```
LaTeX-CV-Multilingual/
├── src/                    # Source LaTeX files
│   ├── latin/             # Latin script languages
│   ├── cjk/               # CJK languages
│   ├── rtl/               # RTL languages
│   └── cyrillic/          # Cyrillic languages
├── output/                # Generated PDFs (gitignored)
├── build/                 # Build artifacts (gitignored)
├── docs/                  # Documentation and assets
├── .github/               # GitHub templates and workflows
├── Makefile              # Build automation
├── build.sh              # Alternative build script
└── README.md             # Main documentation
```

## Questions?

Feel free to:
- Open an issue for questions
- Contact the maintainer at [utkucikmaz@gmail.com](mailto:utkucikmaz@gmail.com)
- Visit [utkucikmaz.com](https://www.utkucikmaz.com)

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on what is best for the community
- Show empathy towards other community members

Thank you for contributing! 🎉
