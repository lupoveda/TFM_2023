cd ~/Documents/TFM/OC_TFM
mkdir results/variants_somatic/annotation_funcotator #We create a new directory to store the results of the annotation with Functotator

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

   gatk Funcotator \
     --variant ~/Documents/TFM/OC_TFM/results/variants_somatic/"SAMPLE".filtered_pon.vcf \ #Input is the filtered variants called with Mutect2 generated with the parameters defined in script 20_somatic_calling_Mutect2.sh
     --reference ~/Documents/TFM/data/reference/hg19.fasta \ #Required to specify the reference
     --ref-version hg19 \ #and the version of the human reference used
     --data-sources-path ~/Documents/TFM/OC_TFM/test_somatic/funcotator_dataSources.v1.7.20200521s \ #Previous to this step, we downloaded the recommended dataSources for funcotator as specified in the Best practice guidelines
     --output ~/Documents/TFM/OC_TFM/results/variants_somatic/annotation_funcotator/"SAMPLE".funcotated.vcf \ #Specified the output file name 
     --output-file-format VCF #Specified the file format, can be VCF or MAF

done


