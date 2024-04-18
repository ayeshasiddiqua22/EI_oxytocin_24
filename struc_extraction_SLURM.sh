#!/bin/bash
 
#SBATCH --job-name=obtibet.queue
#SBATCH --output=/data/project/YP_UG_2022/logs/%j.out
#SBATCH --export=none
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20
 
source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load optibet/default
 
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/full_list
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"
 
echo "Running on ${HOSTNAME}"
echo "Processing ${DATA}/${SUBJECT}/T1"
 
cd ${DATA}/${SUBJECT}/T1
echo optiBET.sh -i OXYDEC${SUBJECT}_T1.nii

optiBET.sh -i OXYDEC${SUBJECT}_T1.nii