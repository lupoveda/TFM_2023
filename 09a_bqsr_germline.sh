#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results
mkdir ~/Documents/TFM/OC_TFM/results/bqsr_germline
cd ~/Documents/TFM/OC_TFM

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

gatk BaseRecalibrator \
--reference ~/Documents/TFM/data/reference/hg19.fasta \
--input alignment/"$SAMPLE".rg.md.bam \
--known-sites data/variants/test/renamed_Axiom_Exome_plus_hg19.vcf.gz \
--known-sites data/variants/test/renamed.hg19-v0-Mills_and_1000G_gold_standard.indels.b37.sites.vcf \
--known-sites data/variants/test/renamed_hg19-v0-Homo_sapiens_assembly19.dbsnp138.vcf \
--output results/bqsr_germline/"$SAMPLE".recal.table

gatk ApplyBQSR \
--input alignment/"$SAMPLE".rg.md.bam \
--bqsr-recal-file results/bqsr_germline/"$SAMPLE".recal.table \
--output results/bqsr_germline/"$SAMPLE".recal.bam
done
