#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/test_somatic #Before conducting this step, I renamed, using BCFtools, the chromosome names of the downloaded vcf files so that it matches the chromosome names from the reference, hence the prefix renamed
#The vcf files used to create the PON, are the ones recommemnded in the Best practices of the GATK suite

gatk IndexFeatureFile -I renamed_somatic-af-only-gnomad.raw.sites.vcf.gz #Indexing of the vcf file

gatk IndexFeatureFile -I renamed_somatic-b37-Mutect2-exome-panel.vcf #Indexing of the vcf file

gatk CreateSomaticPanelOfNormals \
-R ~Documents/TFM/data/reference/hg19.fasta \ #Reference used for this analysis
--germline-resource renamed_somatic-af-only-gnomad.raw.sites.vcf.gz \ #vcf containing known germline variation sites in the population, from the GnomAd database
-V renamed_somatic-b37-Mutect2-exome-panel.vcf \ #vcf containing known variation sites from the exome panels of dbSNP
-O pon.vcf.gz #output file name given to this panel of normals
