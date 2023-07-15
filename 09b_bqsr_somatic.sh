#!/usr/bin/env bash

cd ~/Documents/TFM
mkdir ~/Documents/TFM/results/bqsr_somatic

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

gatk BaseRecalibrator \
--reference data/reference/hg19.fasta \
--input alignment_all/"$SAMPLE".rg.md.bam \
--known-sites data/variants/homo_sapiens_somatic_incl_consequences.vcf \
--known-sites data/variants/1000GENOMES-phase_3.vcf \
--output results/bqsr_somatic/"$SAMPLE".recal.table

gatk ApplyBQSR \
--input alignment_all/"$SAMPLE".rg.md.bam \
--bqsr-recal-file results/bqsr_somatic/"$SAMPLE".recal.table \
--output results/bqsr_somatic/"$SAMPLE".recal.bam
done
