#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM # Cambia y especifica el directorio

gatk SelectVariants \ # Utiliza la herramienta GATK para seleccionar un subconjunto de variantes genéticas de un archivo VCF/ Allows to select a subset of variants from a VCF file
--variant results/variants_germline/germline_OCcohort.vcf \ #Especifica el archivo VCF de entrada del cual se seleccionarán las variantes /gvcf file from Ovarian Cancer cohort
--select-type-to-include INDEL \ #Esta opción indica que se deben seleccionar solo las variantes de tipoParameter for selection INDEL (inserciones/deleciones)./ Valid types are INDEL, SNP, MIXED, MNP, SYMBOLIC, NO_VARIATION. 
--output results/variants_germline/germline_OCcohort.INDEL.vcf #Especifica el archivo de salida en formato VCF donde se escribirán las variantes seleccionadas

##este script se utiliza para filtrar y seleccionar únicamente las variantes genéticas de tipo INDEL de un archivo VCF más grande
#More info:https://gatk.broadinstitute.org/hc/en-us/articles/360037055952-SelectVariants

