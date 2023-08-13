#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM
mkdir results/variants_somatic #new directory to store the somatic variants

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   gatk Mutect2 \
    --reference ~/Documents/TFM/data/reference/hg19.fasta \ #Indexed reference used
    --input alignment/"$SAMPLE".rg.md.bam \ #Mapping output with marked duplicates
    --germline-resource test_somatic/renamed_somatic-af-only-gnomad.raw.sites.vcf.gz \ #Germline reference from GnomAd database with renamed chromosomes 
    --panel-of-normals test_somatic/pon.vcf.gz \ #Panel of normal sites observed in normal created in script 19_create_index_vcf_PON.sh 
    --f1r2-tar-gz results/variants_somatic/"$SAMPLE".f1r2.tar.gz \ #Collect F1R2 counts and output files into this tar.gz file for read artifact detection
    --output results/variants_somatic/"$SAMPLE".unfiltered_pon.vcf
   
   gatk LearnReadOrientationModel \
    --input results/variants_somatic/"$SAMPLE".f1r2.tar.gz \
    --output results/variants_somatic/"$SAMPLE".read-orientation-model.tar.gz  

   gatk FilterMutectCalls \
    --reference ~/Documents/TFM/data/reference/hg19.fasta \
    --variant results/variants_somatic/"$SAMPLE".unfiltered_pon.vcf \
    --intervals data/target_regions/intervals.list \ #Genomic intervals over which to operate
    --ob-priors results/variants_somatic/"$SAMPLE".read-orientation-model.tar.gz \ #To detect artifacts due to FFPE treatment of sample
    --output results/variants_somatic/"$SAMPLE".filtered_pon.vcf #Filtered somati variants detected

   gatk VariantsToTable \ 
    --variant results/variants_somatic/"$SAMPLE".filtered_pon.vcf \
    --fields CHROM -F POS -F TYPE -GF GT \
    --output results/variants_somatic/"$SAMPLE".filtered_pon.table

done

