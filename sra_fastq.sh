
#!/bin/bash

# sra toolkit doc: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=prefetch

# create a directory to store rawdata

cd rawdata



for x in SRR1236321{0..5}
do 
    fastq-dump --split-files $x/$x.sra 
done

cd ..
