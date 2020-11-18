## How to use sra datasets 

### 1. Installing SRA toolkit 

#### Reference tutorial: https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit

Download sratoolkit file 


```bash

cd ~/Download

# Download sratoolkit 
wget --output-document sratoolkit.tar.gz http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz

```

Extract 

```bash
tar -vxzf sratoolkit.tar.gz
```

Append the path to the binaries to your PATH environment variable

```bash
# sratoolkit.2.10.8-ubuntu64 is the extracted directory 
export PATH=$PATH:$PWD/sratoolkit.2.10.8-ubuntu64/bin
```

Test whether sratoolkit is found and functional 

```bash
which fastq-dump

# The output should look like: /Users/JoeUser/sratoolkit.2.4.0-1.mac64/bin/fastq-dump
```

### 2. Downloading SRA files 

#### Download series of SRA files with **prefetch** command 

#### Run data_download.sh

```bash

#!/bin/bash


# Numbers of SRA data:
# SRR12363210
# SRR12363211
# SRR12363212
# SRR12363213
# SRR12363214
# SRR12363215

mkdir rawdata

cd rawdata


for x in {12363210..12363215}
do
    prefetch SRR$x

done

cd .. 
```

The terminal looks like:


```bash

2020-11-17T22:12:29 prefetch.2.10.8: 1) Downloading 'SRR12363210'...
2020-11-17T22:12:29 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:13:47 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:13:48 prefetch.2.10.8:  'SRR12363210' is valid
2020-11-17T22:13:48 prefetch.2.10.8: 1) 'SRR12363210' was downloaded successfully
2020-11-17T22:13:48 prefetch.2.10.8: 'SRR12363210' has 0 unresolved dependencies

2020-11-17T22:13:49 prefetch.2.10.8: 1) Downloading 'SRR12363211'...
2020-11-17T22:13:49 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:14:18 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:14:20 prefetch.2.10.8:  'SRR12363211' is valid
2020-11-17T22:14:20 prefetch.2.10.8: 1) 'SRR12363211' was downloaded successfully
2020-11-17T22:14:20 prefetch.2.10.8: 'SRR12363211' has 0 unresolved dependencies

2020-11-17T22:14:21 prefetch.2.10.8: 1) Downloading 'SRR12363212'...
2020-11-17T22:14:21 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:15:01 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:15:03 prefetch.2.10.8:  'SRR12363212' is valid
2020-11-17T22:15:03 prefetch.2.10.8: 1) 'SRR12363212' was downloaded successfully
2020-11-17T22:15:03 prefetch.2.10.8: 'SRR12363212' has 0 unresolved dependencies

2020-11-17T22:15:03 prefetch.2.10.8: 1) Downloading 'SRR12363213'...
2020-11-17T22:15:03 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:17:52 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:17:55 prefetch.2.10.8:  'SRR12363213' is valid
2020-11-17T22:17:55 prefetch.2.10.8: 1) 'SRR12363213' was downloaded successfully
2020-11-17T22:17:55 prefetch.2.10.8: 'SRR12363213' has 0 unresolved dependencies

2020-11-17T22:17:56 prefetch.2.10.8: 1) Downloading 'SRR12363214'...
2020-11-17T22:17:56 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:18:29 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:18:30 prefetch.2.10.8:  'SRR12363214' is valid
2020-11-17T22:18:30 prefetch.2.10.8: 1) 'SRR12363214' was downloaded successfully
2020-11-17T22:18:30 prefetch.2.10.8: 'SRR12363214' has 0 unresolved dependencies

2020-11-17T22:18:31 prefetch.2.10.8: 1) Downloading 'SRR12363215'...
2020-11-17T22:18:31 prefetch.2.10.8:  Downloading via HTTPS...
2020-11-17T22:20:09 prefetch.2.10.8:  HTTPS download succeed
2020-11-17T22:20:13 prefetch.2.10.8:  'SRR12363215' is valid
2020-11-17T22:20:13 prefetch.2.10.8: 1) 'SRR12363215' was downloaded successfully
2020-11-17T22:20:13 prefetch.2.10.8: 'SRR12363215' has 0 unresolved dependencies
```


### 3. Converting SRA to FASTQ files

#### Run sra_fastq.sh file

```bash

#!/bin/bash

# sra toolkit doc: https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=prefetch

# create a directory to store rawdata

cd rawdata



for x in SRR1236321{0..5}
do 
    fastq-dump --split-files $x/$x.sra 
done

cd ..
```
