#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline

gatk MergeVcfs \
--INPUT germline_OCcohort.SNP.filtered.vcf \
--INPUT germline_OCcohort.INDEL.filtered.vcf \
--OUTPUT germline_OCcohort.filtered.vcf
