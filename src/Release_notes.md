---
layout: default
title: Release notes
group: "in_local_navigation"
order: 8
---

## Release notes

### eQTL Catalogue release 6 - April 2023

Release 6 coincides with the publication of the new eQTL Catalogue [preprint](https://doi.org/10.1101/2023.04.06.535816) and brings a number of important updates.

#### Updated molecular trait qunatification workflow
All RNA-seq datasets have been reprocessed with v22.05.1 of the [eQTL-Catalogue/rnaseq](https://github.com/eQTL-Catalogue/rnaseq) workflow. The main changes are:

* We have now implemented [LeafCutter](https://davidaknowles.github.io/leafcutter/) as the fifth quantification method to directly quantify splice junction usage.
* Reference transcriptome annotations have been updated to Ensembl 105 and GENCODE v39. Updated metadata files are available form [here](https://doi.org/10.5281/zenodo.7808390).
* Txrevise promoter usage annotations have been augmented with experimentally-derived CAGE promoter annotations from the FANTOM5 project (see txrevise [preprint](https://doi.org/10.1101/2022.07.12.499800) for details).

#### Updated fine-mapping workflow
We have also made two major changes to our statistical fine-mapping workflow:

* In addition to fine-mapped credible sets, we have now also released log Bayes factors (LBFs) from the SuSiE analysis for all independent fine-mapped signals. This means that the eQTL Catalogue results can now directly be used with the new [coloc.susie](https://doi.org/10.1371/journal.pgen.1009440) colocalisation method that supports multiple independent causal variants in the region of interest.
* To reduce the size of the exon- and transcript-level summary statistics files, we now retain the most strongly associated molecular trait (exon, transcript, txrevise event or Leafcutter splice junction) for each independent fine-mapped signal. This filtering reduce the size of the summary statistics files by ~98% while retaining the summary statistcs from almost all significant loci for colocalisation purposes. For gene expression QTLs, we continue to provide access to the complete set of cis-eQTL summary statistics. The filtered summary statistics files have the .cc.tsv.gz suffix while the full summary statistics files have the .all.tsv.gz suffix.

#### Visualisation of transcript-level associations
We have now generated static QTL coverage plots for 1.7 million association signals and made them available via our [FTP server](http://ftp.ebi.ac.uk/pub/databases/spot/eQTL/coverage_plots/). These plots display normalised RNA-seq read coverage across all exons of the gene, exon-level QTL effect sizes and standard errors, as well as the alternative transcripts or splice junctions used in association testing. See the [preprint](https://doi.org/10.1101/2023.04.06.535816) for more details.

#### Unique study and dataset ids
We have assigned unique permanent ids for all studies and datasets present in the eQTL Catalogue. These ids together with additional metadata can be found on our [GitHub page](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/data_tables/dataset_metadata.tsv) and [REST API](https://www.ebi.ac.uk/eqtl/api/docs). We are also using the same ids consistenly across all the files available from our FTP server. See the [Data access]({{site.domain}}{{site.baseurl}}/Data_access) page for more details.

#### First protein QTL dataset

We have now re-processed individual-level data from the [Sun et al 2018](https://doi.org/10.1038/s41586-018-0175-2) plasma proteome QTL study (QTS000035). This study profiled 3215 proteins in 3301 individuals.




### eQTL Catalogue release 5 - April 2022

Release 5 brings multiple important updates, including re-imputed genotypes, X chromosome QTLs, changes to data normalisation and two new studies.

#### Updated genotype imputation workflow
All of the studies using genotyping microarrays have been re-imputed with the [eQTL-Catalogue/genimpute](https://github.com/eQTL-Catalogue/genimpute) v22.01.1 workflow. We have updated the imputation reference panel to [recently published](https://www.biorxiv.org/content/10.1101/2021.02.06.430068v2) high coverage [1000 Genomes 30x on GRCh38](https://www.internationalgenome.org/data-portal/data-collection/30x-grch38) based on the GRCh38 reference genome. As a result, CrossMap.py is no longer used to lift over imputed genotypes from GRCh37 to GRCh38. This should significantly increase the accuracy of imputed indels and structural variants.

#### X chromosome QTLs
The [eQTL-Catalogue/genimpute](https://github.com/eQTL-Catalogue/genimpute) v22.01.1 workflow now also supports the X chromsome. Briefly, we perform variant-level QC on the female smaples, retain the same variants in the male samples and jointly impute all samples using Minimac4. Finally we adjust male genotype dosage to match female dosage and perform joint eQTL analysis across all samples using sex as a covariate. Unfortunately, raw X chromosome genotypes were missing from 13 of the 31 studies which prevented us from mapping X chromosome QTLs in those studies. List of studies with X chromosome QTLs can be found [here](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/data_tables/chrX_genotypes.tsv).

#### Data normalisation
We are now performing inverse normal transformation (INT) on top of the existing RNA-seq and microarray normalisation methods to reduce rare false positives caused by outlier samples. See [Methods](http://www.ebi.ac.uk/eqtl/Methods/) for more details.

#### REST API
REST API is currently undergoing major revisions to support increasing data volumes. As a result, the data on the REST API **has not been updated** since release 3. We are planning to fix the issues and update the data for the next release. Currently, the only way to access release 5 data is via the FTP.

#### New studes
* Bossini-Castillo_2019 - Regulatory T cells from 119 individuals
* Gilchrist_2021 - NK cells from 247 individuals (microarray)

### eQTL Catalogue release 4 - June 2021

We have added eight new studies, increasing the total number of samples to 30,619 and the number of unique donors to 7,182. The number of distinct cell types and tissues has increased to 74. The novel cell types and tissues in this release are microglia, hepatocyte-like cells, placenta, synovium and cartiliage.

#### New studies

* Young_2019 - microglia from 104 individuals 
* CommonMind - one brain region (DLPFC) from 590 individuals
* Braineac2 - two brain regions (putamen and substantia nigra) from 106 individuals
* Steinberg_2020 - synovium and cartilage tissues from 70 individuals
* CAP - LCLs from 148 individuals
* Peng_2019 - Placenta from 149 individuals
* PhLiPS - induced pluripotent stem cells and hepatocyte-like cells from 87 individuals
* iPSCORE - induced pluripotent stem cells from 107 individuals

#### Updated studies

* GTEx - The study name GTEx now corresponds to uniformly re-processed summary statistics from GTEx v8. The imported GTEx v8 official eQTL summary statistics also remain available under the study name GTEx_v8. 

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

Information about all datasets can be found on the [Studies]({{site.domain}}{{site.baseurl}}/Studies) tab.


### eQTL Catalogue release 2 - May 2020

* In addition to 19 uniformly processed datasets, we have imported and harmonised eQTL summary statistics from [49 tissues](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/tabix_ftp_paths_imported.tsv) that were part of the GTEx V8 release. These summary statistics are included in our RESTful API and tabix-indexed TSV files can be downloaded directly from our [FTP server](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/GTEx_V8/). Efforts to re-analyise GTEx data with our [uniform pipeline](http://www.ebi.ac.uk/eqtl/Methods/) are ongoing.

* We have added a [new tutorial](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/tabix_use_case.html) on how to perfrom colocalisation analysis between GWAS and eQTL signals accross 110 different contexts (61 unformly processed and 49 GTEx_v8 cell types/tisses/conditions) without downloading large summary statistics files.

### eQTL Catalogue release 1 - January 2020

#### Data statistics

This release contains uniformly processessed eQTL summary statistics from 19 datasets:
* 5 microarray datasets containing 4,631 samples.
* 14 RNA-seq datasets containing 8,115 samples.
* 4685 unique donors.
