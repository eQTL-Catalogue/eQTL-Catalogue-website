---
layout: default
title: Release notes
group: "in_local_navigation"
order: 8
---

## Release notes

### eQTL Catalogue release 2 - May 2020

* In addition to 19 uniformly processed datasets, we have imported and harmonised eQTL summary statistics from [49 tissues](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/tabix_ftp_paths_imported.tsv) that were part of the GTEx V8 release. These summary statistics are included in our RESTful API and tabix-indexed TSV files can be downloaded directly from our [FTP server](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/GTEx_V8/). Efforts to re-analyise GTEx data with our [uniform pipeline](http://www.ebi.ac.uk/eqtl/Methods/) are ongoing.

* We have added a [new tutorial](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/tabix_use_case.html) on how to perfrom colocalisation analysis between GWAS and eQTL signals accross 110 different contexts (61 unformly processed and 49 GTEx_v8 cell types/tisses/conditions) without downloading large summary statistics files.

### eQTL Catalogue release 1 - January 2020

#### Data statistics

This release contains uniformly processessed eQTL summary statistics from 19 datasets:
* 5 microarray datasets containing 4,631 samples.
* 14 RNA-seq datasets containing 8,115 samples.
* 4685 unique donors.
