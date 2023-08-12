#!/usr/bin/env bash


cd ~/Documents/TFM/OC_TFM/results/variants_germline
mkdir annotation

snpEff -Xmx4g \
-v \
hg19 \
germline_OCcohort.filtered.vcf \
> annotation/germline_OCcohort.filtered.snpeff.vcf
