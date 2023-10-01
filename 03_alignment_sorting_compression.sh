#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM #Cambia el directorio actual al camino especificado

mkdir alignment #Crea un nuevo directorio llamado "alignment" en el directorio principal del proyecto. 
#Este directorio se utilizará para almacenar los archivos de salida del alineamiento.

#El bucle for se utiliza para iterar a través de una lista de nombres de muestra de OC1_L001 hasta OC13_L002. 
for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   bwa mem -t 8 data/reference/hg19.fasta \ # se utiliza bwa con opcion mem para la alineacion, 
   #con -t se especifica el número de hilos para paralelizar el proceso y se especifica el archivo de la referencia previamente indexada
   data/fastq/fastp_results_1/"$SAMPLE"_R1.fastq.gz \ #los resultados preprocesados de la lectura R1 o forward
   data/fastq/fastp_results_1/"$SAMPLE"_R2.fastq.gz \ #los resultados preprocesados de la lectura R2 o reverse
   | samtools sort \ #Este comando toma la salida del comando anterior y la ordena utilizando Samtools, una herramienta para el procesamiento de archivos de formato SAM
   | samtools view -bh > alignment/"$SAMPLE".bam #Este comando toma la salida del comando anterior (ya ordenada) y la convierte en formato BAM utilizando Samtools.
done


