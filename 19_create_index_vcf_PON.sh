#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/test_somatic 

gatk IndexFeatureFile -I renamed_somatic-af-only-gnomad.raw.sites.vcf.gz

gatk IndexFeatureFile -I renamed_somatic-b37-Mutect2-exome-panel.vcf

