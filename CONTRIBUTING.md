# Contributing to CoMM-BIP

Thank you for your interest! Contributions that extend CoMM-BIP to new pathosystems, improve the biological prior integration, or add new modalities are especially welcome.

## 🐛 Reporting Bugs

Open a [GitHub Issue](https://github.com/MorillaLab/CoMM-BIP/issues) with:
- The script or notebook where the error occurs
- Your environment (OS, Python version, PyTorch version)
- The full error traceback
- A minimal reproducible example if possible

## 💡 Suggesting Features

Open an issue tagged `enhancement`. Good examples:
- New data modality (proteomics, epigenomics)
- Alternative prior formulation (weighted network, pathway-level priors)
- New plant pathosystem or organism
- Additional interpretability methods

## 🔧 Submitting Code

1. Fork the repository and create a branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   pip install flake8 pytest
   ```
3. Make your changes. Keep model code in `src/` and analysis in `notebooks/`.
4. Lint:
   ```bash
   flake8 src/ --max-line-length=127
   ```
5. Clear notebook outputs before committing.
6. Open a pull request against `main` with a clear biological and technical motivation.

## 📋 Code Style

- Python: PEP 8, `black`-formatted, max line length 127
- Docstrings on all public functions and classes
- Type hints encouraged

## 📜 License

By contributing, you agree your work will be released under GPL-3.0.
