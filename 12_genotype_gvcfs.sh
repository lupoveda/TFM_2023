#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

gatk GenotypeGVCFs \ #Perform joint genotyping on one or more samples pre-called with HaplotypeCaller. Performs joint genotyping on the GenomicsDB workspace created with GenomicsDBImport (script 11_create_genomicsdb_germline.sh)

--reference ~/Documents/TFM/data/reference/hg19.fasta \ # Reference sequence file
--variant gendb://results/genomicsdb_germline \ # A VCF file containing variants - the input samples possess genotype likelihoods produced by HaplotypeCaller with `-ERC GVCF` 
--intervals data/target_regions/intervals.list \ # Genomic intervals over which to operate - BRCA2, tp53 and BRCA1
--output results/variants_germline/germline_OCcohort.vcf # File to which variants should be written

#More information: https://gatk.broadinstitute.org/hc/en-us/articles/360037057852-GenotypeGVCFs
