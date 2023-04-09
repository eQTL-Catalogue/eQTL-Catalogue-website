---
layout: default
title: Federated analysis
group: "in_local_navigation"
order: 9
---

## Federated analysis

### Uniform processing

We believe that the main value of the eQTL Catalogue lies in the uniformly processed QTL summary statistics and statistical fine mapping results. Thus far, we have downloaded individual-level gene expression and genotype data from all studies and processed them locally. While this has worked well for the [studies]({{ site.domain }}{{ site.baseurl }}/Studies/) already included in the eQTL Catalouge, there are many additional datasets where access to individual-level data is not possible due to the consent obtained from reasarch participants or other restrictions on data sharing. Even though many of these studies have published their own summary statistics, importing those directly to the eQTL Catalogue would significantly reduce the comparability between studies, even if the techincal challenges of various data formats, allele codings and missing data could be overcome. 

### eQTL Catalogue Consortium 
To facilitiate the inclusion of studies with restrictions on data sharing while maintaining the benefits of uniform data processing, we are now setting up the **eQTL Catalogue Consortium** to perform federated analysis on diverse datasets located in various juristictions. Participating cohorts will be able to process their datasets using our [uniform workflows]({{ site.domain }}{{ site.baseurl }}/Methods/) and only submit summary statistics and fine mapping results to the eQTL Catlaogue. Similar to the [eQTLGen Consortium](https://www.eqtlgen.org/), the private individual-level data is never shared. The results of the federated analysis will be published in an upcoming peer-reviewed article. 

### Technical requirements
The eQTL Catalogue [workflows]({{ site.domain }}{{ site.baseurl }}/Methods/) are written in the [Nextflow](https://www.nextflow.io/) language and use [Docker](https://www.docker.com/) and/or [Singularity](https://sylabs.io/singularity/) containers to manage software dependencies. Nextflow workflows can be executed in various [cluster or cloud environments](https://www.nextflow.io/docs/latest/executor.html). Detailed instructions and techical support will be available for participanting cohorts. 

### Want to participate?
Would you like to include your cohort or dataset in the eQTL Catalogue? Contact us at [eqtlcatalogue@ebi.ac.uk](mailto:eqtlcatalogue@ebi.ac.uk).