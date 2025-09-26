# A Notebook Series

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This repository contains a collection of open-access educational notebooks covering fundamental topics in mathematics, computer science, and engineering. Each notebook is written in LaTeX and provides comprehensive coverage of its respective subject matter.

## 📚 Available Notebooks

### Mathematics & Theory
- **[A Notebook on Algebra](./A%20Notebook%20on%20Algebra/)** - Covers linear algebra, abstract algebra, and number theory
- **[A Notebook on Calculus](./A%20Notebook%20on%20Calculus/)** - From basic limits and derivatives to differential equations and multivariable calculus
- **[A Notebook on Probability, Statistics and Data Science](./A%20Notebook%20on%20Probability,%20Statistics%20and%20Data%20Science/)** - Probability theory, statistical methods, and practical data science tools (R and Python)

### Computer Science & Engineering
- **[A Notebook on Artificial Intelligence](./A%20Notebook%20on%20Artificial%20Intelligence/)** - Neural networks, deep learning, CNNs, RNNs, transformers, and large language models
- **[A Notebook on Control System](./A%20Notebook%20on%20Control%20System/)** - Classical and modern control theory, system identification, and advanced control algorithms
- **[A Notebook on Linux Operating System](./A%20Notebook%20on%20Linux/)** - Linux fundamentals, administration, popular services, and security

## 🎯 Purpose & Philosophy

These notebooks are inspired by the open-source software philosophy - making knowledge freely accessible, editable, and improvable by the community. They serve as comprehensive study materials for students, researchers, and anyone interested in deepening their understanding of these fundamental subjects.

### Key Features:
- **Comprehensive Coverage**: Each notebook covers its subject from fundamentals to advanced topics
- **Structured Learning**: Organized in logical parts and chapters with clear progression
- **Practical Examples**: Includes motivating examples, exercises, and real-world applications
- **Mathematical Rigor**: Proper definitions, theorems, and proofs where appropriate
- **Cross-Referenced**: Extensive use of references and citations to original sources

## 🏗️ Structure

Each notebook follows a consistent structure:
- **Frontmatter**: Dedication, table of contents, foreword, and subject-specific preface
- **Main Content**: Organized in parts and chapters covering the subject systematically
- **References**: Comprehensive bibliography of source materials
- **Index**: Detailed index for easy navigation

All notebooks share common frontmatter elements while maintaining subject-specific prefaces that provide context and acknowledge key reference materials.

## 🔧 Building the Notebooks

Each notebook is a complete LaTeX document that can be compiled individually:

1. Navigate to the specific notebook directory
2. Ensure you have a LaTeX distribution installed (e.g., TeX Live, MiKTeX)
3. Compile using: `pdflatex main.tex`
4. For complete bibliography and index: `bibtex main`, `makeindex main`, then `pdflatex main.tex` (twice)

### Dependencies
- LaTeX distribution with standard packages
- Custom style files in the `style/` directory
- Shared frontmatter in the `frontmatter/` directory

## ⚠️ Important Notice

As stated in the foreword, these notebooks are provided without warranty of any kind and are not peer-reviewed. **Do NOT cite these notebooks in academic research papers or books!** If you find content helpful for your research, please trace back to the original sources and verify independently.

## 📄 License

This work is licensed under the [GNU General Public License v3.0](./LICENSE). You are free to:
- Use the materials for any purpose
- Modify and improve the content
- Redistribute under the same license terms

## 🤝 Contributing

Contributions are welcome! Whether you find errors, want to improve explanations, add new content, or enhance the structure, your input is valuable. Please ensure any contributions maintain the educational focus and mathematical rigor of the notebooks.

## 👤 Author

**Lu Sun** and many more contributors

*"If software and e-books can be made completely open-source, why not a notebook?"*

---

These notebooks represent an ongoing effort to democratize access to quality educational materials in mathematics, computer science, and engineering.
