#!/bin/bash

#SBATCH --job-name=DKAextraction.queue
#SBATCH --output=/data/project/YP_UG_2023/data/logs/%j.out
#SBATCH --export=none
#SBATCH --mem=10G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20 

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan 
module load fsl

# setting working variables 
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/full_list
ROIs=$DATA/analysis/3_onemap/onemap/
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"

# high dose 
echo "sorting out the timeseries directory for participant ${SUBJECT}"
mkdir -p ${DATA}/${SUBJECT}/H/timeseries
scp ${DATA}/${SUBJECT}/H/rest_medn_wm_csf_tfilt_final.nii.gz ${DATA}/${SUBJECT}/H/timeseries/


cd ${ROIs} 
echo "for loop for extraction for participant ${SUBJECT}"
for roi in dka*.nii.gz; do 
    # Extract timeseries data for the current ROI and participant
    fslmeants -i ${DATA}/${SUBJECT}/H/timeseries/rest_medn_wm_csf_tfilt_final.nii.gz \
              -o ${DATA}/${SUBJECT}/H/timeseries/tmp_${SUBJECT}_${roi}.txt \
              -m ${ROIs}/${roi}
done

echo "timeseries concatenation for participant $SUBJECT"
# Change directory to participant's timeseries directory
cd ${DATA}/${SUBJECT}/H/timeseries

# Concatenate temporary files for each participant
paste tmp_*.txt > DKA_ts_${SUBJECT}_H.txt

# Copy over final timeseries file for statistical analysis
mkdir -p ${DATA}/analysis/final_timeseries
cp ${DATA}/${SUBJECT}/H/timeseries/DKA_ts_${SUBJECT}_H.txt ${DATA}/analysis/final_timeseries/

# Clean up temporary files
rm tmp_*.txt


# medium dose
echo "sorting out the timeseries directory for participant ${SUBJECT}"
mkdir -p ${DATA}/${SUBJECT}/M/timeseries
scp ${DATA}/${SUBJECT}/M/rest_medn_wm_csf_tfilt_final.nii.gz ${DATA}/${SUBJECT}/M/timeseries/


cd ${ROIs} 


echo "for loop for extraction for participant ${SUBJECT}"
for roi in dka*.nii.gz; do 
    # Extract timeseries data for the current ROI and participant
    fslmeants -i ${DATA}/${SUBJECT}/M/timeseries/rest_medn_wm_csf_tfilt_final.nii.gz \
              -o ${DATA}/${SUBJECT}/M/timeseries/tmp_${SUBJECT}_${roi}.txt \
              -m ${ROIs}/${roi}
done

echo "timeseries concatenation for participant $SUBJECT"
# Change directory to participant's timeseries directory
cd ${DATA}/${SUBJECT}/M/timeseries

# Concatenate temporary files for each participant
paste tmp_*.txt > DKA_ts_${SUBJECT}_M.txt

# Copy over final timeseries file for statistical analysis
mkdir -p ${DATA}/analysis/final_timeseries
cp ${DATA}/${SUBJECT}/M/timeseries/DKA_ts_${SUBJECT}_M.txt ${DATA}/analysis/final_timeseries/

# Clean up temporary files
rm tmp_*.txt


# low dose 
echo "sorting out the timeseries directory for participant ${SUBJECT}"
mkdir -p ${DATA}/${SUBJECT}/L/timeseries
scp ${DATA}/${SUBJECT}/L/rest_medn_wm_csf_tfilt_final.nii.gz ${DATA}/${SUBJECT}/L/timeseries/


cd ${ROIs} 


echo "for loop for extraction for participant ${SUBJECT}"
for roi in dka*.nii.gz; do 
    # Extract timeseries data for the current ROI and participant
    fslmeants -i ${DATA}/${SUBJECT}/L/timeseries/rest_medn_wm_csf_tfilt_final.nii.gz \
              -o ${DATA}/${SUBJECT}/L/timeseries/tmp_${SUBJECT}_${roi}.txt \
              -m ${ROIs}/${roi}
done

echo "timeseries concatenation for participant $SUBJECT"
# Change directory to participant's timeseries directory
cd ${DATA}/${SUBJECT}/L/timeseries

# Concatenate temporary files for each participant
paste tmp_*.txt > DKA_ts_${SUBJECT}_L.txt

# Copy over final timeseries file for statistical analysis
mkdir -p ${DATA}/analysis/final_timeseries
cp ${DATA}/${SUBJECT}/L/timeseries/DKA_ts_${SUBJECT}_L.txt ${DATA}/analysis/final_timeseries/

# Clean up temporary files
rm tmp_*.txt


# placebo
echo "sorting out the timeseries directory for participant ${SUBJECT}"
mkdir -p ${DATA}/${SUBJECT}/PL/timeseries
scp ${DATA}/${SUBJECT}/PL/rest_medn_wm_csf_tfilt_final.nii.gz ${DATA}/${SUBJECT}/PL/timeseries/


cd ${ROIs} 


echo "for loop for extraction for participant ${SUBJECT}"
for roi in dka*.nii.gz; do 
    # Extract timeseries data for the current ROI and participant
    fslmeants -i ${DATA}/${SUBJECT}/PL/timeseries/rest_medn_wm_csf_tfilt_final.nii.gz \
              -o ${DATA}/${SUBJECT}/PL/timeseries/tmp_${SUBJECT}_${roi}.txt \
              -m ${ROIs}/${roi}
done

echo "timeseries concatenation for participant $SUBJECT"
# Change directory to participant's timeseries directory
cd ${DATA}/${SUBJECT}/PL/timeseries

# Concatenate temporary files for each participant
paste tmp_*.txt > DKA_ts_${SUBJECT}_PL.txt

# Copy over final timeseries file for statistical analysis
mkdir -p ${DATA}/analysis/final_timeseries
cp ${DATA}/${SUBJECT}/PL/timeseries/DKA_ts_${SUBJECT}_PL.txt ${DATA}/analysis/final_timeseries/

# Clean up temporary files
rm tmp_*.txt
