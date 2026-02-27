---
name: Bug report
about: Report a bug in CoMM-BIP
title: '[BUG] '
labels: bug
assignees: ''
---

## Describe the bug
A clear description of what the bug is.

## Which component fails?
- [ ] Data loading / preprocessing
- [ ] Model training (`src/train.py`)
- [ ] Attention-Priors delta analysis
- [ ] SHAP interpretability
- [ ] Notebook (`plant_coMM_model.ipynb`)
- [ ] Other: ___

## Minimal reproducible example
```python
from src.model import CoMMBIP
# ...
```

## Error traceback
```
Paste full traceback here
```

## Data modalities involved
- [ ] Transcriptomics
- [ ] Metabolomics
- [ ] Phenomics
- [ ] Biological priors

## Environment
- OS: [e.g. Ubuntu 22.04]
- Python version: [e.g. 3.9.12]
- PyTorch version:
- SHAP version:

## Additional context
Any other context about the problem.
