---
layout: default
title: Release notes
group: "in_local_navigation"
order: 8
---

## Release notes

### eQTL Catalogue release 3.1 - December 2020

* In release 3 (October 2020) of the eQTL Catalogue, the allele count (AC) and allele number (AN) fields of the tabix-indexed summary statistics files were accidentally swapped. This error has now been corrected and the tabix-indexed files on the FTP server have been replaced with the correct ones. The data on the REST API was not affected. If you used the AN field in your colocalisation analysis to infer sample size then this error could have led to decreased power to detect colocalisations and we would recommend you to re-run your analysis. 

### eQTL Catalogue release 3 - October 2020

* All summary statistics files on the FTP have been re-generated using v20.07.2 of the [eQTL-Catalogue/qtlmap](https://github.com/eQTL-Catalogue/qtlmap) workflow. The files now also contain standard errors of the QTL effect size estimates. 
* The FTP server now also contains new files with gene-level permuation p-values calculated separately in each cell type and tissue. The column names of the new files are explained [here](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/Columns.md).
* We have used the [Sum of Single Effects (SuSiE)](https://doi.org/10.1111/rssb.12388) model to perform statistical fine mapping using individual-level gene expression and genotype data. The fine mapping results (credible sets) are available on our [FTP server](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/credible_sets/) and the column names are explained [here](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/Columns.md). The code is implemented in [eQTL-Catalogue/susie-workflow](https://github.com/eQTL-Catalogue/susie-workflow) v20.08.3.

#### New and updated studies

* FUSION - new muscle and adipose tissue datasets from up to 302 donors.
* TwinsUK - Re-imputed genotype data to 1000 Genomes Phase 3.
* BLUEPRINT - Replaced genotype data with a more recent imputation from [Kundu et al, 2020](https://doi.org/10.1101/2020.01.15.907436).

Information about all datasets can be found on the [Datasets]({{site.domain}}{{site.baseurl}}/Datasets) tab.


### eQTL Catalogue release 2 - May 2020

* In addition to 19 uniformly processed datasets, we have imported and harmonised eQTL summary statistics from [49 tissues](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/tabix_ftp_paths_imported.tsv) that were part of the GTEx V8 release. These summary statistics are included in our RESTful API and tabix-indexed TSV files can be downloaded directly from our [FTP server](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/GTEx_V8/). Efforts to re-analyise GTEx data with our [uniform pipeline](http://www.ebi.ac.uk/eqtl/Methods/) are ongoing.

* We have added a [new tutorial](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/tabix_use_case.html) on how to perfrom colocalisation analysis between GWAS and eQTL signals accross 110 different contexts (61 unformly processed and 49 GTEx_v8 cell types/tisses/conditions) without downloading large summary statistics files.

### eQTL Catalogue release 1 - January 2020

#### Data statistics

This release contains uniformly processessed eQTL summary statistics from 19 datasets:
* 5 microarray datasets containing 4,631 samples.
* 14 RNA-seq datasets containing 8,115 samples.
* 4685 unique donors.
