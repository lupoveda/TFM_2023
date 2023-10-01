#!/usr/bin/env bash


cd ~/Documents/TFM/OC_TFM/results/variants_germline # Este comando cambia el directorio actual (cd) a la ruta especificada, 
mkdir annotation_snpeff #Crea un nuevo directorio llamado annotation_snpeff dentro del directorio actual (variants_germline). Este directorio se utilizará para almacenar la salida de la anotación realizada por la herramienta Snpeff/ created a new directory to store the annotation from snpeff

snpEff -Xmx4g \ #Establece el límite máximo de memoria en 4 gigabytes (4 GB) para la ejecución de Snpeff. Esto asigna 4 GB de memoria RAM al proceso de Snpeff.
-v \ #Activa el modo verboso, lo que significa que Snpeff mostrará información detallada sobre su proceso.
hg19 \ #Especifica la versión del genoma de referencia que se utilizará para la anotación/ specified the reference version
germline_OCcohort.filtered.vcf \ #Es el archivo de entrada en formato VCF que contiene las variantes genéticas ya filtradas/ specified the input gvcf file
> annotation_snpeff/germline_OCcohort.filtered.snpeff.vcf #Redirige la salida generada por Snpeff a un nuevo archivo llamado germline_OCcohort.filtered.snpeff.vcf en el directorio annotation_snpeff.
/ the annotated gvcf file with snpeff -  ANN corresponds to the annotation information

#Este script anota las variantes con snpEff y proporciona información adicional sobre las variantes, como su efecto en genes y proteínas.
