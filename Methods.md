---
layout: default
title: Methods
group: "in_local_navigation"
order: 2
---

## Methods

### Gene expression and splicing quantification
The gene expresson and splicing quantification pipelines is available from the [kerimoff/rnaseq](https://github.com/kerimoff/rnaseq) GitHub repository.The pipeline is based on the [nf-core/rnaseq](https://github.com/nf-core/rnaseq) pipeline that we have modified to include the following quantification methods:
- **gene counts**: RNA-seq reads were aligned to the GRCh38 reference genome using [HISAT2](https://ccb.jhu.edu/software/hisat2/) and reads overlapping [GENCODE](https://www.gencodegenes.org/) v30 transcript annoations were counted using [featureCounts](http://subread.sourceforge.net/).
- **exon counts**: [DEXSeq](https://bioconductor.org/packages/release/bioc/html/DEXSeq.html) was used to convert GENCODE v30 transcript annotations to non-overlapping exon annotations. Reads overlapping exons were counted  using [featureCounts](http://subread.sourceforge.net/).
- **transcript usage**: [Salmon](https://combine-lab.github.io/salmon/) was used to estimate the expression levels of all annotated transcripts in [GENCODE](https://www.gencodegenes.org/) v30.
- **transcription event usage**: [txrevise](https://github.com/kauralasoo/txrevise) was used to convert [Ensembl 96](http://apr2019.archive.ensembl.org/info/data/ftp/index.html) transcript annotations to independent transcriptional events.[Salmon](https://combine-lab.github.io/salmon/) was used to estimate the expression levels of all transcriptional events.  

### Molecular trait normalisation and quality control
The molecular trait normalisation and quality control workflow is available from the [kerimoff/qtl_norm_qc](https://github.com/kerimoff/qtl_norm_qc) GitHub repository. 

#### Normalisation
Briefly, we use the following normalisation strategies:
- **gene counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using gene length and GC content as covariates.
- **exon counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using exon length and GC content as covariates.
- **transcript usage**: Transcript usage is calculated by dividing the transcript expression estimates (TPM units) the total expression of all transcripts of the same gene. Transcript usage values (0...1 scale) are further standardised using inverse normal transformation. 
- **transcript event usage**: Transcript event usage is calculated by dividing the transcript event expression estimates (TPM units) by the total expression of all events of the same class (promoters, splicing events, 3'end events) within the same gene. Transcript event usage values (0...1 scale) are further standardised using inverse normal transformation. 

### Genotype imputation and quality control
Sample content

### Association testing

The association testing pipeline is available from [kerimoff/qtlmap](https://github.com/kerimoff/qtlmap) GitHub repository. 

