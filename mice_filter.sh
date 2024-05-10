 #!/bin/bash

#SBATCH --job-name=Mice_Filt.queue
#SBATCH --output=/data/project/YP_UG_2023/animal/logs/%j.out
#SBATCH --export=none
#SBATCH --mem=10G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20 

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load ants
module load afni

DATA=/data/project/YP_UG_2023/animal
INDEX=$DATA/subjects 
SUB='sub-'
SES='ses-'
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"

########### SALINE ############
cd ${DATA}/${SUBJECT}/Saline/

afni 3dTproject -overwrite -input $SUB${SUBJECT}_$SES'Saline_task-rest_acq-geEPI_desc-hifi_bold.nii.gz' -prefix filt_${SUBJECT}_Saline.nii.gz -ort $SUB${SUBJECT}_$SES'Saline_task-rest_acq-geEPI_nuisance2.1D' -polort 2 -stopband 0 0.0049

########### OXYTOCIN ############
cd ${DATA}/${SUBJECT}/Oxytocin/

afni 3dTproject -overwrite -input $SUB${SUBJECT}_$SES'Oxytocin_task-rest_acq-geEPI_desc-hifi_bold.nii.gz' -prefix filt_${SUBJECT}_Oxytocin.nii.gz -ort $SUB${SUBJECT}_$SES'Oxytocin_task-rest_acq-geEPI_nuisance2.1D' -polort 2 -stopband 0 0.0049



