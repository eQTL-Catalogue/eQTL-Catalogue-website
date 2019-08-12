---
layout: default
title: Methods
group: "in_local_navigation"
order: 2
---

## Pipelines
Quick links to data analysis pipelines:
- RNA-seq quantification: [kerimoff/rnaseq](https://github.com/kerimoff/rnaseq)
- Normalisation and QC: [kerimoff/qtl_norm_qc](https://github.com/kerimoff/qtl_norm_qc)
- Genotype QC: [kauralasoo/popAssign](https://github.com/kauralasoo/popAssign)
- Association testing: [kerimoff/qtlmap](https://github.com/kerimoff/qtlmap)

## Methods

### Gene expression and splicing quantification
The gene expresson and splicing quantification pipelines is available from the [kerimoff/rnaseq](https://github.com/kerimoff/rnaseq) GitHub repository. The pipeline is based on the [nf-core/rnaseq](https://github.com/nf-core/rnaseq) pipeline that we have modified to include the following quantification methods:
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
For most datasets, we performed basic QC on the raw genotypes calls from genotyping arrays after which we imputed the remaining genotypes using [Michigan Imputation Server](https://imputationserver.sph.umich.edu/index.html#!) and [1000 Genomes Phase 3](https://imputationserver.readthedocs.io/en/latest/reference-panels/) reference panel. 

#### Before imputation
- Exclude all variants with minor allele frequence (MAF) < 0.01, Hardy-Weinberg equilibrium p-value < 1e-6 and that were missing in more than 5% of the samples.

#### After imputation
- Convert all genetic variants to GRCh38 coordinates with [CrossMap](http://crossmap.sourceforge.net/).
- Exclude variants with minor allele frequence (MAF) < 0.01 and imputation quality score (R2) < 0.4.
- Check that the genotypes in the VCF file are concordant with those detected from the RNA-seq data using [qtltools mbv](https://doi.org/10.1093/bioinformatics/btx074) command. Correct sample swaps and discard any samples with missing genotypes or high levels of cross-contamination.

### Association testing

The association testing pipeline is available from [kerimoff/qtlmap](https://github.com/kerimoff/qtlmap) GitHub repository. The main analysis steps are:
- Perform principal component analysis (PCA) of the genotype data with [PLINK 1.9](https://www.cog-genomics.org/plink/1.9/). 
- Perfrom PCA analysis of the molecular trait data (prcomp function in R).
- Perform assocation testing with [QTLtools](https://qtltools.github.io/qtltools/).

In association testing, we use the following parameters:
- Use first six principal components from the genotype data and first six principal components from the molecular trait data as covariates.
- Test all variants that are +/- 1Mb from the start of the gene (as defined in Ensembl).




