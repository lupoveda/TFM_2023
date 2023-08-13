#!/usr/bin/env bash


cd ~/Documents/TFM/OC_TFM/results/variants_germline
mkdir annotation_snpeff #created a new directory to store the annotation from snpeff

snpEff -Xmx4g \
-v \
hg19 \ #specified the reference version
germline_OCcohort.filtered.vcf \ #specified the input gvcf file
> annotation_snpeff/germline_OCcohort.filtered.snpeff.vcf #the annotated gvcf file with snpeff -  ANN corresponds to the annotation information
