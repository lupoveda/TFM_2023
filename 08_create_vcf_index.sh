#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/data/variants/test 

gatk IndexFeatureFile -F renamed_Axiom_Exome_plus_hg19.vcf.gz 

gatk IndexFeatureFile -F renamed.hg19-v0-Mills_and_1000G_gold_standard.indels.b37.sites.vcf

gatk IndexFeatureFile -F renamed_hg19-v0-Homo_sapiens_assembly19.dbsnp138.vcf
