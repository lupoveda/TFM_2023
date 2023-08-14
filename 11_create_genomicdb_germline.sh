#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

#gatk GenomicsDBImport allows to import VCFs to GenomicsDB before joint genotyping - and allows adding samples at a later stage to the datastore and avoid having to remap all the samples everytime a new sample is sequenced 
#Database is created first using one sample

gatk --java-options "-Xmx4g -Xms4g" GenomicsDBImport \
--variant results/variants_germline/OC1_L001.HC.g.vcf \ #adds a GVCFs produced by in HaplotypeCaller with the `-ERC GVCF`
--intervals data/target_regions/intervals.list \ #  file containing the genomic intervals over which to operate: BRCA2, tp53 and BRCA1
--genomicsdb-workspace-path results/genomicsdb_germline #name and location of the datastore

#Database gets updated with the rest of the samples - for this we use a loop to add the samples into the newly created datastore. All samples are in a gvcf file format and were called by the Haplotypecaller with the '-ERC GVCF'. 

for SAMPLE in OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

cd ~/Documents/TFM

gatk --java-options "-Xmx4g -Xms4g" GenomicsDBImport \
--variant results/variants_germline/"$SAMPLE".HC.g.vcf \ #adds the remaining GVCFs produced by in HaplotypeCaller with the `-ERC GVCF`
--intervals data/target_regions/intervals.list \ #  file containing the genomic intervals over which to operate: BRCA2, tp53 and BRCA1
--genomicsdb-update-workspace-path results/genomicsdb_germline #updating this previously created datastore

done

#More Information: https://gatk.broadinstitute.org/hc/en-us/articles/360036883491-GenomicsDBImport
