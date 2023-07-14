#!/usr/bin/env bash

cd ~/Documents/TFM/data 

gatk IndexFeatureFile -F variants/gnomad.exomes.r2.1.1.sites.vcf.gz 

gatk IndexFeatureFile -F variants/1000GENOMES-phase_3.vcf

gatk IndexFeatureFile -F variants/homo_sapiens_somatic_incl_consequences.vcf
