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

### Molecular trait normalisation and quality control
The molecular trait normalisation and quality control pipeline is available from [Github](https://github.com/kerimoff/qtl_norm_qc). Briefly, we use the following normalisation strategies:
- **gene counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using gene length and GC content as covariates.
- **exon counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using exon length and GC content as covariates.
- **transcript usage**: Transcript usage is calculated by dividing the transcript expression estimates (TPM units) the total expression of all transcripts of the same gene. Transcript usage values (0...1 scale) are further standardised using inverse normal transformation. 
- **transcript event usage**: Transcript event usage is calculated by dividing the transcript event expression estimates (TPM units) by the total expression of all events of the same class (promoters, splicing events, 3'end events) within the same gene. Transcript event usage values (0...1 scale) are further standardised using inverse normal transformation. 

### Genotype imputation and quality control
Sample content

### Association testing

The association testing pipeline is available from [Github](https://github.com/kerimoff/qtlmap). 

