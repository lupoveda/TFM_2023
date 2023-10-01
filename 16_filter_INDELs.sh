#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline #Cambio y especificamos el directorio

#Filtered with parameters taken from the recommendations on the best practices from the GATK suite

gatk VariantFiltration \ #Con la herramienta de GATK se filtran los INDELS de acuerdo con las pautas para INDELS para Hard filtering
--variant germline_OCcohort.INDEL.vcf \
--filter-expression "QD < 2.0"                  --filter-name "QD2" \
--filter-expression "QUAL < 30.0"               --filter-name "QUAL30" \
--filter-expression "FS > 200.0"                --filter-name "FS200" \
--filter-expression "ReadPosRankSum < -20.0"    --filter-name "ReadPosRankSum-20" \
--output germline_OCcohort.INDEL.filtered.vcf #gvcf file containing the filtered called INDELs

# Información sobre los parámetros elegidos para INDELs, ligeramente menos estrictos que para SNPs
# QD - QualByDepth - es la confianza de la variante (del campo QUAL) dividida por la profundidad no filtrada de las muestras no homocigotas de referencia. Esta anotación tiene como objetivo normalizar la calidad de la variante para evitar la inflación causada cuando hay una cobertura profunda.
# QUAL - Puntuación de calidad - Puntuación de Phred - el filtrado riguroso eliminará cualquier variante en la que la lectura tenga una puntuación de Phred inferior a Q30.
# FS - FisherStrand - es la probabilidad en escala Phred de que exista un sesgo de hebra en el sitio. la variante alternativa se observó más o menos a menudo en la hebra hacia adelante o hacia atrás que la variante de referencia. Cuando hay poco o ningún sesgo de hebra en el sitio, el valor de FS estará cerca de 0. Las recomendaciones de filtrado riguroso de GATK apuntan a eliminar variantes con un valor de FS superior a 200.
# MQ - calidad de mapeo de la raíz cuadrada media sobre todas las lecturas en el sitio - esta anotación da la raíz cuadrada del promedio de los cuadrados de las calidades de mapeo en el sitio. Está destinado a incluir la desviación estándar de las calidades de mapeo. Incluir la desviación estándar nos permite incluir la variación en el conjunto de datos. Cuando las calidades de mapeo son buenas en un sitio, MQ estará alrededor de 60. La recomendación de GATK es eliminar cualquier variante con un valor de MQ menor que 40.0.
# ReadPosRankSum - aproximación z basada en U del Rank Sum Test para la posición del sitio dentro de las lecturas. Compara si las posiciones de las variantes de referencia y alternativas son diferentes dentro de las lecturas. El umbral de filtrado riguroso elimina cualquier variante con un valor de ReadPosRankSum menor que -20.0.
# Más información sobre el filtrado riguroso en las pautas de mejores prácticas de GATK:  https://gatk.broadinstitute.org/hc/en-us/articles/360035890471-Hard-filtering-germline-short-variants

#Information on the chosen parameters for INDELs, slightly looser parameters than for SNPs
#QD - QualByDepth- is the variant confidence (from the QUAL field) divided by the unfiltered depth of non-hom-ref samples. This annotation is intended to normalize the variant quality in order to avoid inflation caused when there is deep coverage. 
#QUAL - Quality score - Phred score - the hard filtering will remove any variants where the read has a phred score lower than Q30. 
#FS - FisherStrand - is the Phred-scaled probability that there is strand bias at the site. the alternate allele was seen more or less often on the forward or reverse strand than the reference allele. When there little to no strand bias at the site, the FS value will be close to 0. Hard filtering recommendations from GATK aim to fail variants with an FS value greater than 200
#MQ - root mean square mapping quality over all the reads at the site - this annotation gives the square root of the average of the squares of the mapping qualities at the site. It is meant to include the standard deviation of the mapping qualities. Including the standard deviation allows us to include the variation in the dataset. When the mapping qualities are good at a site, the MQ will be around 60. GATK recommendation is to fail any variant with an MQ value less than 40.0
#ReadPosRankSum - u-based z-approximation from the Rank Sum Test for site position within reads. It compares whether the positions of the reference and alternate alleles are different within the reads. Hard filtering threshold removes any variant with a ReadPosRankSum value less than -20.0
#More info on hard filtering in the GATK best practise guidelines: https://gatk.broadinstitute.org/hc/en-us/articles/360035890471-Hard-filtering-germline-short-variants

