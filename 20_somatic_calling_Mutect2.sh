#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM #Cambia el directorio de trabajo 
mkdir results/variants_somatic #Crea un nuevo directorio llamado variants_somatic dentro de la carpeta results. Este directorio se utilizará para almacenar los resultados de las variantes somáticas.
#new directory to store the somatic variants 

#un bucle for que recorre una lista de nombres de muestra, se ejecutan una serie de comandos utilizando la herramienta GATK
for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   gatk Mutect2 \ Ejecuta Mutect2, una herramienta de GATK para la detección de variantes somáticas. 
    --reference ~/Documents/TFM/data/reference/hg19.fasta \ #se especifica la la referencia genómica /Indexed reference used
    --input alignment/"$SAMPLE".rg.md.bam \ # el archivo BAM de mapeo / Mapping output with marked duplicates
    --germline-resource test_somatic/renamed_somatic-af-only-gnomad.raw.sites.vcf.gz \ #recursos germinales descargados de las pautas de GATK / Germline reference from GnomAd database with renamed chromosomes 
    --panel-of-normals test_somatic/pon.vcf.gz \ # Panel de normales previamente creado / Panel of normal sites observed in normal created in script 19_create_index_vcf_PON.sh 
    --f1r2-tar-gz results/variants_somatic/"$SAMPLE".f1r2.tar.gz \ #Recopilar recuentos F1R2 y archivos de salida en este archivo tar.gz para la detección de artefactos de lectura/Collect F1R2 counts and output files into this tar.gz file for read artifact detection
    --output results/variants_somatic/"$SAMPLE".unfiltered_pon.vcf #El resultado se guarda en un archivo VCF no filtrado.
    
   gatk LearnReadOrientationModel \ #Aprende un modelo de orientación de lectura a partir de los datos de F1R2 (forward and reverse reads) para detectar artefactos de lectura
    --input results/variants_somatic/"$SAMPLE".f1r2.tar.gz \ #se especifica el documento recopilado en el paso anterior
    --output results/variants_somatic/"$SAMPLE".read-orientation-model.tar.gz  #crea un modelo para detectar artefactos de lectura

   gatk FilterMutectCalls \ # Filtra las llamadas de variantes somáticas utilizando el modelo de orientación de lectura y otros parámetros. El resultado se guarda en un archivo VCF filtrado.
    --reference ~/Documents/TFM/data/reference/hg19.fasta \ #se especifica la la referencia genómica /Indexed reference used
    --variant results/variants_somatic/"$SAMPLE".unfiltered_pon.vcf \ # se especifica el archivo VCF no filtrado
    --intervals data/target_regions/intervals.list \ # Se especifica los intervalos genomicos sobre los que operar / Genomic intervals over which to operate
    --ob-priors results/variants_somatic/"$SAMPLE".read-orientation-model.tar.gz \ #Este parametro es importante para detectar artefactos a causa del tratamiento FFPE de las muestras 
    #To detect artifacts due to FFPE treatment of sample
    --output results/variants_somatic/"$SAMPLE".filtered_pon.vcf #Archivo VCF con las variantes filtradas de artefactos/ Filtered somatic variants detected

   gatk VariantsToTable \ #Convierte las variantes filtradas en una tabla que incluye información 
    --variant results/variants_somatic/"$SAMPLE".filtered_pon.vcf \ #archivos de entrada
    --fields CHROM -F POS -F TYPE -GF GT \ # campos definidos sobre la cromosoma, posición, tipo de variante y genotipo.
    --output results/variants_somatic/"$SAMPLE".filtered_pon.table #Tabla recopila la informacion de los campos definidos

done

