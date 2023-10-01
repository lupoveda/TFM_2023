#!/usr/bin/env bash


cd ~/Documents/TFM/OC_TFM/results/variants_somatic ## Este comando cambia el directorio actual (cd) a la ruta especificada, 
mkdir annotation_snpeff ##Crea un nuevo directorio llamado annotation_snpeff dentro del directorio actual

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   snpEff -Xmx4g \ ##Establece el límite máximo de memoria en 4 gigabytes (4 GB) para la ejecución de Snpeff. Esto asigna 4 GB de memoria RAM al proceso de Snpeff.
    -v \ #Activa el modo verboso, lo que significa que Snpeff mostrará información detallada sobre su proceso.
    hg19 \ ##Especifica la versión del genoma de referencia que se utilizará para la anotación/ specified the reference version
    "SAMPLE".filtered_pon.vcf \ 
    > annotation_snpeff/"SAMPLE".filtered_pon.snpeff.vcf #Redirige la salida generada por Snpeff a un nuevo archivo 
done

#Este script anota las variantes con snpEff y proporciona información adicional sobre las variantes, como su efecto en genes y proteínas.
