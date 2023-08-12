#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

gatk GenotypeGVCFs \
--reference ~/Documents/TFM/data/reference/hg19.fasta \
--variant gendb://results/genomicsdb_germline \
--intervals data/target_regions/intervals.list \
--output results/variants_germline/germline_OCcohort.vcf
