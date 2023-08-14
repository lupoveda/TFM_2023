#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

gatk SelectVariants \ #Allows to select a subset of variants from a gVCF file
--variant results/variants_germline/germline_OCcohort.vcf \ #gvcf file from Ovarian Cancer cohort
--select-type-to-include INDEL \ #Parameter for selection. Valid types are INDEL, SNP, MIXED, MNP, SYMBOLIC, NO_VARIATION. 
--output results/variants_germline/germline_OCcohort.INDEL.vcf #Output gvcf containing only the SNPs

#More info:https://gatk.broadinstitute.org/hc/en-us/articles/360037055952-SelectVariants

