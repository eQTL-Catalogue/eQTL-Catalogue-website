---
layout: default
title: Methods
group: "in_local_navigation"
order: 2
---

## Methods

### Gene expression and splicing quantification

Our quantification pipeline is based on the [nf-core/rnaseq](https://github.com/nf-core/rnaseq) pipeline that we have modified to include the following quantification methods:
- Total gene expression: HISAT2 + featureCounts
- Splice junction usage: Leafcutter
- Exon expression: DEXSeq
- Transcript usage: Salmon
- Trancriptional event usage: txrevise + Salmon

The pipeline is available from [Github](https://github.com/kerimoff/rnaseq). 

### Phenotype normalisation and quality control
Sample content

### Genotype imputation and quality control
Sample content

### Association testing

The association testing pipeline is available from [Github](https://github.com/kerimoff/qtlmap). 

