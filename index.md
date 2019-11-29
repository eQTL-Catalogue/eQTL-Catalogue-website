---
layout: default
title: Project
group: "in_local_navigation"
order: 1
---

What do we do?
--------------

The eQTL Catalogue aims to provide uniformly processed gene expression and splicing QTLs from all available public studies on human.

Quantitative trait loci (QTL) are genomic variants that are significantly associated to a measurable phenotype. This resource focuses on expression cis-QTLs (cis-eQTL) where variants are associated to expression levels of nearby genes, and on splicing QTLs (sQTL) where variants are associated to specific splicing events on nearby splice junctions.

![eQTLS in Ensembl](static/Human_BRCA2.png)

They have proven particularly useful to (statistical) geneticists exploring GWAS results, who wish to associate non-coding GWAS SNP associations to a molecular mechanism, such as perturbed gene expression or splicing.

To compute them we process public datasets with our [uniform pipeline]({{ site.domain }}{{ site.baseurl }}/Methods/). We currently provide access to [15 published datasets]({{ site.domain }}{{ site.baseurl }}/Datasets/), with an aim to cover all accessible published datasets on human.

Access our results
------------------

You can [access our results]({{ site.domain }}{{ site.baseurl }}/Data_access/) via FTP in CSV and HDF5 formats, or query part of our data via our RESTful API. Our results are also displayed on the [Expression Atlas](https://www.ebi.ac.uk/gxa/home), and will soon be displayed in [Ensembl](www.ensembl.org). More information on our re-use policy is on [the License tab]({{site.domain}}{{site.baseurl}}/License).

Let us know what you think! 
---------------------------

Feel free to send us your feedback at [eqtlcatalogue@ebi.ac.uk](mailto:eqtlcatalogue@ebi.ac.uk)
