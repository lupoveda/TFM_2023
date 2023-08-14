#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

gatk SelectVariants \ #Allows to select a subset of variants from a VCF file
--variant results/variants_germline/germline_OCcohort.vcf \ #gvcf file from Ovarian Cancer cohort
--select-type-to-include SNP \ #Parameter for selection. Valid types are INDEL, SNP, MIXED, MNP, SYMBOLIC, NO_VARIATION. 
--output results/variants_germline/germline_OCcohort.SNP.vcf #Output gvcf containing only the SNPs

#More info:https://gatk.broadinstitute.org/hc/en-us/articles/360037055952-SelectVariants
