#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM # Especifica el directorio 

gatk SelectVariants \ # Utiliza la herramienta GATK para seleccionar un subconjunto de variantes genéticas de un archivo VCF/ Allows to select a subset of variants from a VCF file
--variant results/variants_germline/germline_OCcohort.vcf \ #Especifica el archivo VCF de entrada del cual se seleccionarán las variantes /gvcf file from Ovarian Cancer cohort
--select-type-to-include SNP \ #Esta opción indica que se deben seleccionar solo las variantes de tipo SNP (Single Nucleotide Polymorphism) del archivo VCF de entrada
#Parameter for selection. Valid types are INDEL, SNP, MIXED, MNP, SYMBOLIC, NO_VARIATION. 
--output results/variants_germline/germline_OCcohort.SNP.vcf #Especifica el archivo de salida en formato VCF donde se escribirán las variantes seleccionadas/ Output gvcf containing only the SNPs

#este script se utiliza para filtrar y seleccionar únicamente las variantes genéticas de tipo SNP de un archivo VCF más grande
#More info:https://gatk.broadinstitute.org/hc/en-us/articles/360037055952-SelectVariants
