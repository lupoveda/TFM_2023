#!/usr/bin/env bash #shebang y especifica que el script debe ejecutarse utilizando el intérprete de comandos Bash

cd ~/Documents/TFM/OC_TFM/data/fastq #Cambia al directorio especificado, que es "~/Documents/TFM/OC_TFM/data/fastq". 

mkdir fastp_results #Crea un nuevo directorio llamado "fastp_results" en el directorio actual. Esto es donde se almacenarán los resultados procesados.

#el bucle 'for' se utiliza para iterar a través de una lista de nombres de muestra de OC1_L001 a OC13_L002

for SAMPLE in OC1_L001 OC1_L002 OC1_L003 OC1_L004 OC2_L001 OC2_L002 OC2_L003 OC2_L004 \
OC3_L001 OC3_L002 OC3_L003 OC3_L004 OC4_L001 OC4_L002 OC4_L003 OC4_L004 \
OC5_L001 OC5_L002 OC5_L003 OC5_L004 OC6_L001 OC6_L002 OC6_L003 OC6_L004 \
OC7_L001 OC7_L002 OC7_L003 OC7_L004 OC8_L001 OC8_L002 OC8_L003 OC8_L004 \
OC9_L001 OC9_L002 OC9_L003 OC9_L004 OC10_L001 OC10_L002 OC10_L003 OC10_L004 \
OC11_L001 OC11_L002 OC11_L003 OC11_L004 OC12_L001 OC12_L002 OC12_L003 OC12_L004 \
OC13_L001 OC13_L002
do

# dentro del bucle, se ejecuta el comando FastP para preprocesar los archivos de datos de cada muestra. 
   fastp -i "$SAMPLE"_R1_001.fastq.gz -I "$SAMPLE"_R2_001.fastq.gz \ #-i y -I, especifica los archivos de entrada R1 y R2, respectivamente, para cada muestra.
   -o fastp_results_1/"$SAMPLE"_R1.fastq.gz \ 
   -O fastp_results_1/"$SAMPLE"_R2.fastq.gz \ #-o y -O, especifica los archivos de salida R1 y R2, respectivamente, para cada muestra.
   -f 5 -F 25 -w 16 -5 30 -3 30 -l 30 \ #Estos son parámetros de calidad y filtrado que controlan cómo se procesan las secuencias.
   #‘-f’ elimina las 5 bases del frente para la lectura 1 (forward read); ‘-F’ elimina las 25 bases del frente para la lectura 2 (reverse read); 
   #‘-w’ asigna 16 hilos/threads de trabajo para el procesamiento; 
   #‘-5’ inicia una ventana deslizante desde el frente (5') hasta la cola, eliminando las bases dentro de la ventana si su calidad promedio bajo por debajo de 30, y deteniendo el procesamiento en caso contrario; 
   #‘-3’ inicia una ventana deslizante desde la cola (3') hasta el frente, eliminando las bases en la ventana si su calidad promedio baja por debajo de 30, y deteniendo el procesamiento en caso contrario; 
   #‘-l’ descarta las lecturas más cortas de 30 pares de bases de longitud
   -V "$SAMPLE".loginfo -h "$SAMPLE".html #‘-V’ genera información de registro detallada, almacenada en un archivo llamado "$SAMPLE".loginfo; 
   #‘-h’ indica el nombre del archivo de informe en formato HTML como "$SAMPLE".html.
done

