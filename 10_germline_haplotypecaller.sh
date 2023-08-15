#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM
mkdir results/variants_germline

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

    gatk HaplotypeCaller \ #Calls germline SNPs and indels via local re-assembly of haplotypes. It can call SNPs and indels simultaneously via local de-novo assembly of haplotypes in an active region
    --reference ~/Documents/TFM/data/reference/hg19.fasta \ #reference used
    --input results/bqsr_germline/"$SAMPLE".recal.bam \ 
    --output results/variants_germline/"$SAMPLE".HC.g.vcf \
    --bam-output results/variants_germline/"$SAMPLE".phased.bam \
    --intervals chr13:7564997-7590956 \ #BRCA2 -The program determines which regions of the genome it needs to operate on (active regions), based on the presence of evidence for variation. 
    --intervals chr17:32889123-32974505 \ #tp53
    --intervals chr17:41196212-41322362 \ #BRCA1
    --emit-ref-confidence GVCF #output is in gvcf format
done

#More Information: https://gatk.broadinstitute.org/hc/en-us/articles/360037225632-HaplotypeCaller
# the GVCF workflow used in this script allows for scalable variant calling in DNA sequence data, HaplotypeCaller runs per-sample to generate an intermediate GVCF, which can then be used in GenotypeGVCFs for joint genotyping of multiple samples in a very efficient way. 
