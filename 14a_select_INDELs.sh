#!/usr/bin/env bash

cd ~/Documents/TFM

gatk SelectVariants \
--variant results/variants_germline/germline_OCcohort.vcf \
--select-type-to-include INDEL \
--output results/variants_germline/germline_OCcohort.INDEL.vcf
