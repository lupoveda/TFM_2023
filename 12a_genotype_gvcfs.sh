#!/usr/bin/env bash

cd ~/Documents/TFM

gatk GenotypeGVCFs \
--reference data/reference/hg19.fasta \
--variant gendb://results/genomicsdb_germline \
--intervals data/target_regions/intervals.list \
--output results/variants_germline/germline_OCcohort.vcf
