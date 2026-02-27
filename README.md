<div align="center">

# 🌱 CoMM-BIP

### Contrastive Multimodal Model with Biological Informed Priors

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://choosealicense.com/licenses/gpl-3.0/)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16281076.svg)](https://doi.org/10.5281/zenodo.16281076)
[![Python 3.8+](https://img.shields.io/badge/python-3.8%2B-blue.svg)](https://www.python.org/)
[![F1 Score](https://img.shields.io/badge/F1%20Score-0.98-brightgreen)](https://github.com/MorillaLab/CoMM-BIP)
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MorillaLab/CoMM-BIP/blob/main/plant_coMM_model.ipynb)

**CoMM-BIP** reveals plants' hidden sensory integration logic by fusing transcriptomic, metabolomic, and phenomic data through biologically informed multimodal attention — achieving a **0.98 F1 score** on plant-microbe effector prediction and uncovering novel gene–metabolite connections invisible to single-modality approaches.

[📄 Citation](#-citation) · [🚀 Quick Start](#-quick-start) · [📊 Key Results](#-key-results) · [🏗️ Architecture](#️-architecture) · [🗂️ Data Modalities](#️-data-modalities)

</div>

---

## 🔍 Overview

Plants integrate information across multiple biological scales simultaneously — transcription, metabolism, phenotype — to sense and respond to pathogens. Yet most machine learning approaches treat these modalities in isolation, missing the cross-modal interactions that define the actual sensory logic.

**CoMM-BIP** addresses this through a contrastive multimodal framework with three key innovations:

- 🧬 **Biologically guided attention** — the attention mechanism is seeded with known gene–metabolite interactions, so the model learns *within* a biologically meaningful prior rather than from scratch
- 🔍 **Attention-Priors delta analysis** — by comparing learned attention weights against the biological priors, the model both validates known interactions and discovers novel high-impact connections
- 💡 **Full interpretability** — SHAP analysis and attention visualisation make every prediction explainable

<p align="center">
  <img src="docs/overview.png" alt="CoMM-BIP model architecture" width="820"/>
  <br/>
  <em>CoMM-BIP architecture: multimodal integration of transcriptomic, metabolomic, and phenomic data with biological prior-guided attention.</em>
</p>

---

## 📊 Key Results

| Metric | Score |
|---|---|
| **F1 Score** | **0.98** |
| Task | Plant-microbe effector prediction |
| Modalities | Transcriptomics + Metabolomics + Phenomics |
| Interpretability | SHAP + Attention visualisation |
| Novel connections discovered | ✅ (via Attention-Priors delta) |

CoMM-BIP **validates existing biological knowledge** while simultaneously **discovering novel, high-impact gene–metabolite connections** that would be invisible to any single-modality approach.

---

## 🏗️ Architecture

CoMM-BIP integrates three data streams through a shared representation space guided by biological priors:

```
Transcriptomic Data ──┐
                      ├──▶ Modality Encoders
Metabolomic Data ─────┤         │
                      │         ▼
Phenomic Data ────────┘   Cross-Modal Attention
                               │
                    ┌──────────▼──────────┐
                    │  Biological Prior    │
                    │  (gene–metabolite   │
                    │   interaction graph) │
                    └──────────┬──────────┘
                               │
                    Biologically-Weighted
                    Attention Output
                               │
                    ┌──────────▼──────────┐
                    │  Contrastive Loss +  │
                    │  Classification Head │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │  SHAP Explainability │
                    │  + Attention Δ Map   │
                    └─────────────────────┘
```

### Attention-Priors Delta Analysis

The Δ between *learned* attention weights and *prior* biological weights reveals:
- **Δ ≈ 0** → model confirms known interaction
- **Δ > 0** → model discovers stronger-than-expected interaction (**novel candidate**)
- **Δ < 0** → interaction less relevant than literature suggests in this context

---

## 🗂️ Data Modalities

| Modality | Description | Source |
|---|---|---|
| **Transcriptomics** | Gene expression profiles (RNA-seq) | Plant stress experiments |
| **Metabolomics** | Small molecule abundance | LC-MS / GC-MS profiles |
| **Phenomics** | Macro-scale phenotypic observations | Image / sensor data |
| **Biological priors** | Known gene–metabolite interaction network | KEGG, AraCyc, literature |

---

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/MorillaLab/CoMM-BIP.git
cd CoMM-BIP
pip install -r requirements.txt
```

### Train the model

```bash
python src/train.py --data_dir ./data
```

### Run the full analysis notebook

```bash
jupyter notebook plant_coMM_model.ipynb
```

Or launch directly in Colab:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MorillaLab/CoMM-BIP/blob/main/plant_coMM_model.ipynb)

### Python API

```python
from src.model import CoMMBIP
from src.data import MultimodalPlantDataset

# Load your multimodal data
dataset = MultimodalPlantDataset(
    transcriptomics="data/transcriptomics.csv",
    metabolomics="data/metabolomics.csv",
    phenomics="data/phenomics.csv",
    priors="data/gene_metabolite_priors.csv"
)

# Initialise and train
model = CoMMBIP(prior_weight=0.3, latent_dim=128)
model.fit(dataset)

# Predict effector status
predictions = model.predict(dataset.X_test)

# Explain predictions
shap_values = model.explain(dataset.X_test)
attention_delta = model.attention_delta(dataset.X_test)
```

---

## 📁 Repository Structure

```
CoMM-BIP/
├── src/                        # Model source code
│   └── train.py                # Training script
├── notebooks/                  # Exploratory and analysis notebooks
├── data/                       # Data directory (see data availability)
├── docs/
│   └── overview.png            # Architecture figure
├── plant_coMM_model.ipynb      # Main analysis notebook
├── requirements.txt            # Python dependencies
├── CITATION.cff                # Citation metadata
├── zenodo.json                 # Zenodo deposit metadata
├── .gitignore
└── LICENSE                     # GPL-3.0
```

---

## 🗂️ Data Availability

Data used in this study are available via the Zenodo deposit linked above. For access to raw experimental data, contact the corresponding author.

**Contact:** Ian Morilla — [GitHub](https://github.com/MorillaLab) · [Zenodo record](https://doi.org/10.5281/zenodo.16281076)

---

## 🎈 Citation

If you use CoMM-BIP in your research, please cite:

```bibtex
@article{
  author    = {Vomo Donfack, Kelly Larissa and
               León Morcillo, Rafael Jorge and
               Gintor, Grégory and
               González Doblas, Verónica and
               Morilla, Ian},
  title     = {Multimodal Learning Reveals Plants' Hidden
               Sensory Integration Logic},
  month     = feb,
  year      = 2026,
  publisher = {BMC Genomics},
  doi       = {10.1186/s12864-026-12624-y},
  url       = {https://doi.org/10.1186/s12864-026-12624-y}


@misc{vomo_donfack_2025_16281076,
  author    = {Vomo Donfack, Kelly Larissa and
               González Doblas, Verónica and
               Morilla, Ian},
  title     = {Multimodal Learning Reveals Plants' Hidden
               Sensory Integration Logic},
  month     = jul,
  year      = 2025,
  publisher = {Zenodo},
  version   = {1.0},
  doi       = {10.5281/zenodo.16281076},
  url       = {https://doi.org/10.5281/zenodo.16281076}
}
```


---

## 🤝 Contributing

We welcome contributions — new modalities, alternative attention prior formulations, additional plant species or pathosystems. Please open an issue before submitting a pull request. See [`CONTRIBUTING.md`](CONTRIBUTING.md) for guidelines.

---

## 📜 License

This project is licensed under the GNU General Public License v3.0 — see [`LICENSE`](LICENSE) for details.

---

<div align="center">
  Made with ❤️ by <a href="https://github.com/MorillaLab">MorillaLab</a>
  <br/>
  <sub>Vomo Donfack · González Doblas · Morilla · Zenodo, 2025</sub>
</div>

