#!/bin/bash

#SBATCH --job-name=Allenextraction.queue
#SBATCH --output=/data/project/YP_UG_2023/animal/logs/%j.out
#SBATCH --export=none
#SBATCH --mem=10G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20 

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan 
module load fsl

export PATH=$PATH:/usr/bin/mkdir
export PATH=$PATH:/usr/bin/cp
echo "added commands to path"

DATA=/data/project/YP_UG_2023/animal
INDEX=$DATA/subjects 
SUB='sub-'
SES='ses-'
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"

########### SALINE ############
cd ${DATA}/${SUBJECT}/Saline/

echo "extracting ROI data for ${SUBJECT} Saline."

fslmeants -i filt_${SUBJECT}_Saline.nii.gz \
		  -o Allen_ts_${SUBJECT}_S.txt \
		  --label=$SUB${SUBJECT}_$SES'Saline_desc-DC2labels_fmri.nii.gz' \



########### OXYTOCIN ############
cd ${DATA}/${SUBJECT}/Oxytocin/

echo "extracting ROI data for ${SUBJECT} Oxytocin."

fslmeants -i filt_${SUBJECT}_Oxytocin.nii.gz \
		  -o Allen_ts_${SUBJECT}_O.txt \
		  --label=$SUB${SUBJECT}_$SES'Oxytocin_desc-DC2labels_fmri.nii.gz' \

## Copy over all timeseries into one directory for statistical analysis ##
mkdir -p /home/k21010717/Desktop/YP_UG_2023/animal/analysis/final_Atimeseries
# Saline
cp ${DATA}/${SUBJECT}/Saline/Allen_ts_${SUBJECT}_S.txt ${DATA}/analysis/final_Atimeseries/
# Oxytocin
cp ${DATA}/${SUBJECT}/Oxytocin/Allen_ts_${SUBJECT}_O.txt ${DATA}/analysis/final_Atimeseries/



