---
layout: default
title: Methods
group: "in_local_navigation"
order: 2
---

## Workflows

All data analysis for the eQTL Catalogue is performed using reproducible and containerised Nextflow workflows. 

The four primary workflows are:
- RNA-seq quantification: [eQTL-Catalogue/rnaseq](https://github.com/eQTL-Catalogue/rnaseq)
- Gene expression QC and normalisation: [eQTL-Catalogue/qcnorm](https://github.com/eQTL-Catalogue/qcnorm)
- Genotype QC and imputation: [eQTL-Catalogue/genimpute](https://github.com/eQTL-Catalogue/genimpute)
- Association testing and fine mapping: [eQTL-Catalogue/qtlmap](https://github.com/eQTL-Catalogue/qtlmap)

More details about running these workflows can be found in this [tutorial](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tutorials/workflow_execution.md). 

## Methods
Detailed description of the methods can be found in our [flagship paper](https://doi.org/10.1101/2020.01.29.924266). Below is a short overview of the main analysis steps.


### Gene expression and splicing quantification
The RNA sequencing quantification workflow is available from the [eQTL-Catalogue/rnaseq](https://github.com/eQTL-Catalogue/rnaseq) GitHub repository. The workflow implements the following five quantification methods:
- **gene expression**: RNA-seq reads were aligned to the GRCh38 reference genome using [HISAT2](https://ccb.jhu.edu/software/hisat2/) and reads overlapping [GENCODE](https://www.gencodegenes.org/) v39 transcript annoations were counted using [featureCounts](http://subread.sourceforge.net/).
- **exon expression**: [DEXSeq](https://bioconductor.org/packages/release/bioc/html/DEXSeq.html) was used to convert GENCODE v39 transcript annotations to non-overlapping exon annotations. Reads overlapping exons were counted using [featureCounts](http://subread.sourceforge.net/).
- **transcript usage**: [Salmon](https://combine-lab.github.io/salmon/) was used to estimate the expression levels of all annotated transcripts in [GENCODE](https://www.gencodegenes.org/) v39.
- **txrevise event usage**: [txrevise](https://github.com/kauralasoo/txrevise) was used to convert [Ensembl 105](http://apr2019.archive.ensembl.org/info/data/ftp/index.html) transcript annotations to independent promoter, splice junction and 3ʹ end usage events. [Salmon](https://combine-lab.github.io/salmon/) was used to estimate the expression levels of those events.
- **txrevise event usage**: [Leafcutter](https://davidaknowles.github.io/leafcutter/) was used to quantify splice junction usage.

#### Normalisation
Briefly, we use the following normalisation strategies:
- **gene counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using gene length and GC content as covariates followed by inverse normal transformation.
- **exon counts**: Conditional quantile normalisation with [cqn](http://bioconductor.org/packages/release/bioc/html/cqn.html) using exon length and GC content as covariates followed by inverse normal transformation.
- **transcript usage**: Transcript usage is calculated by dividing the transcript expression estimates (TPM units) the total expression of all transcripts of the same gene. Transcript usage values (0...1 scale) are further standardised using inverse normal transformation. 
- **txrevise event usage**: Promoter, splice junction and 3ʹ end event usage is calculated by dividing the event expression estimates (TPM units) by the total expression of all events of the same class (promoters, splicing events, 3ʹ end events) within the same gene. Txrevise event usage values (0...1 scale) are further standardised using inverse normal transformation. 
- **LeafCutter**: Normalisation for LeafCutter junction usage values are normalised the same way as txrevise and transcript usage estimates.

### Genotype imputation and quality control
For most datasets, we performed basic genotype QC and imputed the datasets to the [1000 Genomes 30x on GRCh38](https://www.internationalgenome.org/data-portal/data-collection/30x-grch38) reference panel with the [eQTL-Catalogue/genimpute](https://github.com/eQTL-Catalogue/genimpute) workflow.

### Association testing

The association testing pipeline is available from [eQTL-Catalogue/qtlmap](https://github.com/eQTL-Catalogue/qtlmap) GitHub repository. The main analysis steps are:
- Perform principal component analysis (PCA) of the genotype data with [PLINK 1.9](https://www.cog-genomics.org/plink/1.9/). 
- Perfrom PCA analysis of the molecular phenotype data (prcomp function in R).
- Perform assocation testing with [QTLtools](https://qtltools.github.io/qtltools/).
- Perform statistical fine mapping with [susieR](https://stephenslab.github.io/susieR/index.html).

In association testing, we use the following parameters:
- Use first six principal components from the genotype data and first six principal components from the molecular trait data as covariates.
- Test all variants that are +/- 1Mb from the start of the gene (as defined in Ensembl).

## Reference annotatons
- [Metadata for all molecular traits](https://doi.org/10.5281/zenodo.7808390)
- [Reference annotations used for analysis](http://ftp.ebi.ac.uk/pub/databases/spot/eQTL/references/)

