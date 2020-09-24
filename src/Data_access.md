---
layout: default
title: Data access
group: "in_local_navigation"
order: 4
---

## Data access

### FTP downloads

On our [FTP site](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL) you will find both tab-delimited flatfiles as well as HDF5 files. 

The URLs of all individual tab-delimited files together with metadata can be found [here](https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/tabix/).

### Tabix

Instead of downloading the full tab-delimited files from the FTP, you can also use [tabix](http://www.htslib.org/doc/tabix.1.html) to access specific regions from those files. For example, to fetch the association between [rs4239702](http://www.ensembl.org/Homo_sapiens/Variation/Explore?r=20:46120112-46121112;v=rs4239702;vdb=variation;vf=528871173) variant and all genes in the +/- 1Mb window in the monocyte samples from the BLUEPRINT study, you can use the following command:

```console
tabix ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/BLUEPRINT/ge/BLUEPRINT_ge_monocyte.all.tsv.gz 20:46120612-46120613
```

You can also use curl to access column names:
```console
curl -s ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/BLUEPRINT/ge/BLUEPRINT_ge_monocyte.all.tsv.gz | zcat | head -n 1
```

### RESTful API

You can query slices of eQTL summary statistics (by study and/or gene and/or SNP) using our [RESTful API]({{ site.domain }}{{ site.baseurl }}/api-docs).

## Tutorials

* [Accessing summary statistics from HDF5 files in Python](https://github.com/EBISPOT/SumStats/blob/eqtls/querying_hdf5_basics.ipynb)
* [Using tabix in R to fetch summary statistics and perform colocalisation](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/tabix_use_case.html)
* [Using the REST API in R to fetch summary statistics and perform colocalisation](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/eQTL_API_usecase.html)
* Using the [catalogueR](https://github.com/RajLabMSSM/catalogueR) R package developed by [Brian Schilder](https://github.com/bschilder) to access summary statistics.

## Frequently Asked Questions (FAQ)
#### Which allele is the effect allele? 
The ALT allele is always the effect allele. See [here](https://github.com/eQTL-Catalogue/eQTL-Catalogue-resources/blob/master/tabix/Columns.md) for the full description of the summary statistics data fields. 

#### How are multiple rsids handled?
We store one rsid per line in our summary staistics files. Thus, if a single variant maps to multiple rsids in dbSNP v151, then summary statistics from this variant will be duplicated over multiple rows. This simplifies querying by rsid, but we recommend removing duplicate entires before any downstream analysis (e.g. colocalisation) as is done in this [tutorial](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/tabix_use_case.html). 

#### How are multi-allelic variants handled?
Multi-allelic variants are included in the analysis, but they are split over multiple and have unique ALT alleles and variant IDs (but might have the same rsids).

## Expression Atlas

On the [dataset tab]({{ site.domain }}{{ site.baseurl }}/Datasets/), follow the links to Expression Atlas studies.
