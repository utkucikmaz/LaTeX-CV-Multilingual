# Push to GitHub Instructions

This file contains the commands to push your LaTeX CV Multilingual project to GitHub.

## Prerequisites

Make sure you have:
1. Git installed on your system
2. GitHub account set up
3. Repository created at: https://github.com/utkucikmaz/LaTeX-CV-Multilingual

## Step-by-Step Instructions

### 1. Initialize Git Repository (if not already done)

```bash
cd "/Users/utkucikmaz/Projects/CV Latex"
git init
```

### 2. Add All Files

```bash
git add .
```

### 3. Create Initial Commit

```bash
git commit -m "Initial commit: LaTeX CV Multilingual template

- Add support for 12 languages across 4 writing systems
- Add MIT License
- Add comprehensive documentation (README, CONTRIBUTING, CHANGELOG)
- Add GitHub templates (issues, PRs)
- Add GitHub Actions CI/CD workflow
- Add Makefile and build.sh for automation
- Add .gitignore and .gitattributes"
```

### 4. Add Remote Repository

```bash
git remote add origin https://github.com/utkucikmaz/LaTeX-CV-Multilingual.git
```

### 5. Push to GitHub

```bash
git branch -M main
git push -u origin main
```

## Alternative: Using SSH (Recommended)

If you prefer SSH authentication:

```bash
git remote add origin git@github.com:utkucikmaz/LaTeX-CV-Multilingual.git
git branch -M main
git push -u origin main
```

## Verify Your Push

After pushing, visit:
https://github.com/utkucikmaz/LaTeX-CV-Multilingual

You should see:
- All your files uploaded
- README.md displayed with badges
- GitHub Actions workflow running
- Issue templates available
- License displayed

## Future Updates

For future updates, use:

```bash
git add .
git commit -m "Your commit message"
git push
```

## Troubleshooting

### If remote already exists:
```bash
git remote remove origin
git remote add origin https://github.com/utkucikmaz/LaTeX-CV-Multilingual.git
```

### If you need to force push (use with caution):
```bash
git push -f origin main
```

### If you have authentication issues:
1. Use GitHub Personal Access Token instead of password
2. Or set up SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh

---

**Note**: You can delete this file after successfully pushing to GitHub.
