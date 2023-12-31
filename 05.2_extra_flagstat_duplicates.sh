#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/alignment #Cambia el directorio actual al directorio especificado

#El bucle for se utiliza para iterar a través de una lista de nombres de muestra
for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

#Este comando de Samtools genera estadísticas de mapeo para el archivo BAM de la muestra actual. 
#Las estadísticas incluyen información sobre las lecturas mapeadas, las lecturas no mapeadas, las lecturas duplicadas
samtools flagstat "$SAMPLE".rg.md.bam > "$SAMPLE".rg.md.bam.flagstat #Redirige la salida de las estadísticas de mapeo generadas por Samtools 
# a un archivo de texto con el nombre de la muestra actual y el sufijo ".rg.md.bam.flagstat"
done


