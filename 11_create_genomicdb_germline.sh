#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM

#gatk GenomicsDBImport allows to import VCFs to GenomicsDB before joint genotyping - and allows adding samples at a later stage to the datastore and avoid having to remap all the samples everytime a new sample is sequenced 
#La bases de datos se crea primero a partir de una muestra en formato gVCF:
#Database is created first using one sample

gatk --java-options "-Xmx4g -Xms4g" GenomicsDBImport \ #Utiliza la herramienta GATK para importar archivos VCF a una base de datos GenomicsDB
#La opción --java-options se utiliza para configurar la memoria asignada a la ejecución de GATK
--variant results/variants_germline/OC1_L001.HC.g.vcf \ #adds a GVCFs produced by in HaplotypeCaller with the `-ERC GVCF`
#Especifica el archivo VCF de entrada que se va a importar a la base de datos GenomicsDB en formato gVCF (GVCFs).
--intervals data/target_regions/intervals.list \ #  file containing the genomic intervals over which to operate: BRCA2, tp53 and BRCA1
#Define los intervalos genómicos sobre los cuales se realizará la operación. Estos intervalos representan regiones específicas del genoma, como los genes BRCA2, TP53 y BRCA1.
--genomicsdb-workspace-path results/genomicsdb_germline #Establece el nombre y la ubicación de la base de datos GenomicsDB que se creará para almacenar las variantes genéticas.

#La base de datos se actualiza con el resto de muestras (todas en formato gVCF):
#Database gets updated with the rest of the samples - for this we use a loop to add the samples into the newly created datastore. All samples are in a gvcf file format and were called by the Haplotypecaller with the '-ERC GVCF'. 

#en un bucle for que itera a través de una lista de nombres de muestras:
for SAMPLE in OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

cd ~/Documents/TFM #se cambia al directorio especificado

gatk --java-options "-Xmx4g -Xms4g" GenomicsDBImport \ #Utiliza la herramienta GATK para importar archivos VCF a una base de datos GenomicsDB
#La opción --java-options se utiliza para configurar la memoria asignada a la ejecución de GATK
--variant results/variants_germline/"$SAMPLE".HC.g.vcf \ # aggrega el resto de muestras a la bases de datos ya creada /adds the remaining GVCFs produced by in HaplotypeCaller with the `-ERC GVCF`
--intervals data/target_regions/intervals.list \ #  file containing the genomic intervals over which to operate: BRCA2, tp53 and BRCA1
#Define los intervalos genómicos sobre los cuales se realizará la operación. Estos intervalos representan regiones específicas del genoma, como los genes BRCA2, TP53 y BRCA1.
--genomicsdb-update-workspace-path results/genomicsdb_germline #actualizar la base de datos creada GenomicsDB

done

# Este script se utiliza para importar archivos en formato gVCF a una base de datos GenomicsDB utilizando la herramienta GATK (Genome Analysis Toolkit)
# de esta manera se puede hacer un genotipo conjunto y agragar muestras a posteriori sin tener que repetir los pasos previos.
#More Information: https://gatk.broadinstitute.org/hc/en-us/articles/360036883491-GenomicsDBImport
