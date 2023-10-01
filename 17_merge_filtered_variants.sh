#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline #Cambio y especificamos el directorio

gatk MergeVcfs \ #Esta herramienta combina multiples archivos VCF en un único archivo /Combines multiple variant files into a single variant file.
--INPUT germline_OCcohort.SNP.filtered.vcf \ #se especifica el primer documento a combinar
--INPUT germline_OCcohort.INDEL.filtered.vcf \ #se especifica el segundo documento a combinar
--OUTPUT germline_OCcohort.filtered.vcf #Este es el archivo de salida que ya esta sorteado segun las coordinadas / The output VCF is already sorted according to the dictionary and by coordinate.
#More info: https://gatk.broadinstitute.org/hc/en-us/articles/360037226612-MergeVcfs-Picard-

#Este script permite combinar múltiples archivos de VCF o gVCF. 
