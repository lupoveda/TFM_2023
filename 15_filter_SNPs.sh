#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline
#In this step we filter according to the values recommended by the Best practices of the GATK suite.

gatk VariantFiltration \
--variant germline_OCcohort.SNP.vcf \
--filter-expression "QD < 2.0"              --filter-name "QD2" \
--filter-expression "QUAL < 30.0"           --filter-name "QUAL30" \
--filter-expression "SOR > 3.0"             --filter-name "SOR3" \
--filter-expression "FS > 60.0"             --filter-name "FS60" \
--filter-expression "MQ < 40.0"             --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5"     --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output germline_OCcohort.SNP.filtered.vcf #output file of the fileterd SNPs
