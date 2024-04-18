#!/bin/bash

#SBATCH --job-name=func2struct.queue
#SBATCH --output=/data/project/YP_UG_2023/data/logs/%j.out
#SBATCH --export=none
#SBATCH --mem=5G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan 
module load fsl
module load ants

# set the working variables 
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/full_list
	# Search the file for the SGE_TASK_ID number as a line number
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"

# High dose
cd ${DATA}/${SUBJECT}/H

echo "------Making directory structure------"
mkdir func2struct/
mkdir func2struct/orig
mkdir func2struct/template

echo "------Running fslreorient2std------"
fslreorient2std desc-optcomDenoised_bold.nii.gz desc-optcomDenoised_bold.nii.gz

echo "------Running fslmaths------"
fslmaths desc-optcomDenoised_bold.nii.gz -Tmean func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz

echo "------Copying T1 image into dir template------"
scp ${DATA}/${SUBJECT}/T1/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz func2struct/template

echo "------Running antsIntroduction.sh------"
ants antsIntroduction.sh -d 3 -r ${DATA}/${SUBJECT}/H/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -i ${DATA}/${SUBJECT}/H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -o ${DATA}/${SUBJECT}/H/func2struct/func2struct_ -f 1 -m 30x90x20 -n 0 -s CC -t GR

echo "------loading module c3d------"
module load c3d/1.0.0

echo "------Running fsl flirts------"
/software/system/fsl/6.0.5.2/bin/flirt -in ${DATA}/${SUBJECT}/H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -ref ${DATA}/${SUBJECT}/H/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -omat ${DATA}/${SUBJECT}/H/func2struct/func2struct_fsl2.mat -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

echo "------Running c3d_affine_tool-----"
c3d_affine_tool -ref ${DATA}/${SUBJECT}/H/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -src ${DATA}/${SUBJECT}/H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz ${DATA}/${SUBJECT}/H/func2struct/func2struct_fsl2.mat -fsl2ras -oitk ${DATA}/${SUBJECT}/H/func2struct/func2struct_Affine.txt

# Medium dose
cd ${DATA}/${SUBJECT}/M

echo "------Making directory structure------"
mkdir func2struct/
mkdir func2struct/orig
mkdir func2struct/template

echo "------Running fslreorient2std------"
fslreorient2std desc-optcomDenoised_bold.nii.gz desc-optcomDenoised_bold.nii.gz

echo "------Running fslmaths------"
fslmaths desc-optcomDenoised_bold.nii.gz -Tmean func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz

echo "------Copying T1 image into dir template------"
scp ${DATA}/${SUBJECT}/T1/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz func2struct/template

echo "------Running antsIntroduction.sh------"
ants antsIntroduction.sh -d 3 -r ${DATA}/${SUBJECT}/M/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -i ${DATA}/${SUBJECT}/M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -o ${DATA}/${SUBJECT}/M/func2struct/func2struct_ -f 1 -m 30x90x20 -n 0 -s CC -t GR

echo "------loading module c3d------"
module load c3d/1.0.0

echo "------Running fsl flirts------"
/software/system/fsl/6.0.5.2/bin/flirt -in ${DATA}/${SUBJECT}/M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -ref ${DATA}/${SUBJECT}/M/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -omat ${DATA}/${SUBJECT}/M/func2struct/func2struct_fsl2.mat -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

echo "------Running c3d_affine_tool-----"
c3d_affine_tool -ref ${DATA}/${SUBJECT}/M/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -src ${DATA}/${SUBJECT}/M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz ${DATA}/${SUBJECT}/M/func2struct/func2struct_fsl2.mat -fsl2ras -oitk ${DATA}/${SUBJECT}/M/func2struct/func2struct_Affine.txt

# Low dose
cd ${DATA}/${SUBJECT}/L

echo "------Making directory structure------"
mkdir func2struct/
mkdir func2struct/orig
mkdir func2struct/template

echo "------Running fslreorient2std------"
fslreorient2std desc-optcomDenoised_bold.nii.gz desc-optcomDenoised_bold.nii.gz

echo "------Running fslmaths------"
fslmaths desc-optcomDenoised_bold.nii.gz -Tmean func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz

echo "------Copying T1 image into dir template------"
scp ${DATA}/${SUBJECT}/T1/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz func2struct/template

echo "------Running antsIntroduction.sh------"
ants antsIntroduction.sh -d 3 -r ${DATA}/${SUBJECT}/L/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -i ${DATA}/${SUBJECT}/L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -o ${DATA}/${SUBJECT}/L/func2struct/func2struct_ -f 1 -m 30x90x20 -n 0 -s CC -t GR

echo "------loading module c3d------"
module load c3d/1.0.0

echo "------Running fsl flirts------"
/software/system/fsl/6.0.5.2/bin/flirt -in ${DATA}/${SUBJECT}/L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -ref ${DATA}/${SUBJECT}/L/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -omat ${DATA}/${SUBJECT}/L/func2struct/func2struct_fsl2.mat -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

echo "------Running c3d_affine_tool-----"
c3d_affine_tool -ref ${DATA}/${SUBJECT}/L/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -src ${DATA}/${SUBJECT}/L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz ${DATA}/${SUBJECT}/L/func2struct/func2struct_fsl2.mat -fsl2ras -oitk ${DATA}/${SUBJECT}/L/func2struct/func2struct_Affine.txt

# Placebo 
cd ${DATA}/${SUBJECT}/PL

echo "------Making directory structure------"
mkdir func2struct/
mkdir func2struct/orig
mkdir func2struct/template

echo "------Running fslreorient2std------"
fslreorient2std desc-optcomDenoised_bold.nii.gz desc-optcomDenoised_bold.nii.gz

echo "------Running fslmaths------"
fslmaths desc-optcomDenoised_bold.nii.gz -Tmean func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz

echo "------Copying T1 image into dir template------"
scp ${DATA}/${SUBJECT}/T1/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz func2struct/template

echo "------Running antsIntroduction.sh------"
ants antsIntroduction.sh -d 3 -r ${DATA}/${SUBJECT}/PL/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -i ${DATA}/${SUBJECT}/PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -o ${DATA}/${SUBJECT}/PL/func2struct/func2struct_ -f 1 -m 30x90x20 -n 0 -s CC -t GR

echo "------loading module c3d------"
module load c3d/1.0.0

echo "------Running fsl flirts------"
/software/system/fsl/6.0.5.2/bin/flirt -in ${DATA}/${SUBJECT}/PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -ref ${DATA}/${SUBJECT}/PL/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -omat ${DATA}/${SUBJECT}/PL/func2struct/func2struct_fsl2.mat -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 12

echo "------Running c3d_affine_tool-----"
c3d_affine_tool -ref ${DATA}/${SUBJECT}/PL/func2struct/template/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz -src ${DATA}/${SUBJECT}/PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz ${DATA}/${SUBJECT}/PL/func2struct/func2struct_fsl2.mat -fsl2ras -oitk ${DATA}/${SUBJECT}/PL/func2struct/func2struct_Affine.txt