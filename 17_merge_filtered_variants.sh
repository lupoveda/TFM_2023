#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline

gatk MergeVcfs \ #Combines multiple variant files into a single variant file.
--INPUT germline_OCcohort.SNP.filtered.vcf \
--INPUT germline_OCcohort.INDEL.filtered.vcf \
--OUTPUT germline_OCcohort.filtered.vcf #The output VCF is already sorted according to the dictionary and by coordinate.
