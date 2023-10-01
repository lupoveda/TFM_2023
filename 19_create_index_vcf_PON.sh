#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/test_somatic #Cambia y especifica el directorio. Es necesario renombrar los archivos descargados de VCF antes de realizar este paso. 
#Before conducting this step, I renamed, using BCFtools, the chromosome names of the downloaded vcf files so that it matches the chromosome names from the reference, hence the prefix renamed
#The vcf files used to create the PON, are the ones recommemnded in the Best practices of the GATK suite

gatk IndexFeatureFile -I renamed_somatic-af-only-gnomad.raw.sites.vcf.gz # para indexar archivos VCF, el vcf Contiene información sobre sitios de variación genética en la población conocidos como "germline" / Indexing of the vcf file

gatk IndexFeatureFile -I renamed_somatic-b37-Mutect2-exome-panel.vcf #para indexar archivos VCF, el vcf contiene información sobre sitios de variación genética conocidos de los paneles de exoma. / Indexing of the vcf file

gatk CreateSomaticPanelOfNormals \ #para crear un Panel de Normales Sómicas (PoN) que se utiliza en análisis de variantes somáticas.
-R ~Documents/TFM/data/reference/hg19.fasta \ # Especifica la referencia genómica que se utilizará en el análisis. / Reference used for this analysis - ref_fasta, ref_fai, ref_dict: reference genome, index, and dictionary
--germline-resource renamed_somatic-af-only-gnomad.raw.sites.vcf.gz \ # Se utiliza un archivo VCF que contiene información sobre sitios de variación genética germline conocidos en la población. /
#vcf containing known germline variation sites in the population, from the GnomAd database
-V renamed_somatic-b37-Mutect2-exome-panel.vcf \ #Se utiliza un archivo VCF que contiene información sobre sitios de variación genética conocidos de los paneles de exoma./
#vcf containing known variation sites from the exome panels of dbSNP
-O pon.vcf.gz #Especifica el nombre del archivo de salida que contendrá el Panel de Normales Sómicas (PoN) generado/ output file name given to this panel of normals

#este script crea un Panel de Normales Sómicas (PoN) que se utiliza en análisis de variantes somáticas
