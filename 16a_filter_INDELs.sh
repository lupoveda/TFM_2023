#!/usr/bin/env bash

cd ~/Documents/TFM/results/variants_germline

gatk VariantFiltration \
--variant germline_OCcohort.INDEL.vcf \
--filter-expression "QD < 2.0"                  --filter-name "QD2" \
--filter-expression "QUAL < 30.0"               --filter-name "QUAL30" \
--filter-expression "FS > 200.0"                --filter-name "FS200" \
--filter-expression "ReadPosRankSum < -20.0"    --filter-name "ReadPosRankSum-20" \
--output germline_OCcohort.INDEL.filtered.vcf
