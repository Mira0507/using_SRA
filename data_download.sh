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
