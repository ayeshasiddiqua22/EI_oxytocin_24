#!/bin/bash

#SBATCH --job-name=ANTS_Multivariate
#SBATCH --output=/data/project/YP_UG_2023/T1/logs/%A_%a.out
#SBATCH --export=none
#SBATCH --cpus-per-task=20
#SBATCH --mem=20G

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan

module load ants

DATA=/data/project/YP_UG_2023/T1

echo "Running on $HOSTNAME"

cd ${DATA}
ants antsMultivariateTemplateConstruction.sh -d 3 -o OXYDEC_ -c 2 -i 8 -j 20 -s CC -t GR -y 0 *_brain.nii.gz 

echo "Complete"