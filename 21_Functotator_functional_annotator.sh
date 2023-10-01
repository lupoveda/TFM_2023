cd ~/Documents/TFM/OC_TFM #especificamos el directorio
mkdir results/variants_somatic/annotation_funcotator # Creamos un nuevo directorio para almacenar los resultados de la anotación con Funcotator /We create a new directory to store the results of the annotation with Functotator

#un bucle para iterar sobre todas las muestras especificadas
for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   gatk Funcotator \
     --variant ~/Documents/TFM/OC_TFM/results/variants_somatic/"SAMPLE".filtered_pon.vcf \ #La entrada son las variantes filtradas llamadas con Mutect2 generadas con los parámetros definidos en el script 20_somatic_calling_Mutect2.sh
     #Input is the filtered variants called with Mutect2 generated with the parameters defined in script 20_somatic_calling_Mutect2.sh
     --reference ~/Documents/TFM/data/reference/hg19.fasta \ #Es necesario especificar la referencia
     #Required to specify the reference
     --ref-version hg19 \ #y la versión de la referencia humana utilizada
     #and the version of the human reference used
     --data-sources-path ~/Documents/TFM/OC_TFM/test_somatic/funcotator_dataSources.v1.7.20200521s \ #Antes de este paso, descargamos las dataSources recomendadas para Funcotator como se especifica en las mejores prácticas.
     #Previous to this step, we downloaded the recommended dataSources for funcotator as specified in the Best practice guidelines
     --output ~/Documents/TFM/OC_TFM/results/variants_somatic/annotation_funcotator/"SAMPLE".funcotated.vcf \ #Especificamos el nombre del archivo de salida /Specified the output file name 
     --output-file-format VCF #Especificamos el formato del archivo, que puede ser VCF o MAF / Specified the file format, can be VCF or MAF
     #El resultado de la anotación se almacena en un archivo VCF con un nombre específico que incluye el nombre de la muestra y la extensión ".funcotated.vcf".

done

#Para cada muestra, se utiliza la herramienta GATK Funcotator para anotar las variantes somáticas previamente filtradas (en formato VCF) generadas con Mutect2. Las anotaciones se realizan utilizando un archivo de referencia, 
#una versión específica de la referencia humana (hg19) y un conjunto de fuentes de datos previamente descargadas y recomendadas para Funcotator.
