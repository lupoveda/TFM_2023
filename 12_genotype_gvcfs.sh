#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM #Cambia al directorio especificado

gatk GenotypeGVCFs \ #Utiliza la herramienta GATK para realizar la genotipificación conjunta de variantes genéticas.
#Perform joint genotyping on one or more samples pre-called with HaplotypeCaller. 
#Performs joint genotyping on the GenomicsDB workspace created with GenomicsDBImport (script 11_create_genomicsdb_germline.sh)

--reference ~/Documents/TFM/data/reference/hg19.fasta \ # Especifica el archivo de referencia genómica que se utilizará para la genotipificación / Reference sequence file
--variant gendb://results/genomicsdb_germline \ # Indica la ubicación de la base de datos GenomicsDB /A VCF file containing variants - the input samples possess genotype likelihoods produced by HaplotypeCaller with `-ERC GVCF` 
--intervals data/target_regions/intervals.list \ # Define los intervalos genómicos sobre los cuales se realizará la genotipificación conjunta. 
#Estos intervalos corresponden a regiones específicas del genoma, como los genes BRCA2, TP53 y BRCA1.
#Genomic intervals over which to operate - BRCA2, tp53 and BRCA1
--output results/variants_germline/germline_OCcohort.vcf # Especifica el archivo de salida en formato VCF donde se escribirán las variantes genéticas genotipificadas conjuntamente para el conjunto de muestras. / File to which variants should be written

#este script realiza la genotipificación conjunta de variantes genéticas en un conjunto de muestras genómicas 
#previamente llamadas con HaplotypeCaller y almacenadas en una base de datos GenomicsDB. 
#More information: https://gatk.broadinstitute.org/hc/en-us/articles/360037057852-GenotypeGVCFs
