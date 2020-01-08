---
layout: default
title: Data access
group: "in_local_navigation"
order: 4
---

FTP Downloads
-------------

On our [FTP site](ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL) you will find both tab-delimited flatfiles as well as HDF5 files. 

See our [tutorial](https://github.com/EBISPOT/SumStats/blob/eqtls/querying_hdf5_basics.ipynb) on reading the HDF5 files.

Tabix
=====
Instead of downloading the full tab-delimited files from the FTP, you can also use tabix to access specific regions from those files. For example, to fetch the association between rs4239702 SNP and all genes in the +/- 1Mb window in the monocyte samples from the BLUEPRINT study, you can use the following command:

```console
tabix ftp://ftp.ebi.ac.uk/pub/databases/spot/eQTL/csv/BLUEPRINT/ge/BLUEPRINT_ge_monocyte.all.tsv.gz 20:46120612-46120613
```

The URLs of all individual TSV files together with metadata can be found [here](https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/tabix/tabix_all_ftp_pathes.tsv).


API
---

You can also query slices of eQTL summary statistics (by study and/or gene and/or SNP) using our [RESTful API]({{ site.domain }}{{ site.baseurl }}/api-docs).

See our [tutorial](http://htmlpreview.github.io/?https://github.com/kauralasoo/eQTL-Catalogue-resources/blob/master/scripts/eQTL_API_usecase.html) on performing colocalisation analysis with GWAS Catalog and eQTL Catalogue APIs in R. 

Expression Atlas
----------------

On the [dataset tab]({{ site.domain }}{{ site.baseurl }}/Datasets/), follow the links to Expression Atlas studies.
