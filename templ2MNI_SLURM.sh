#!/bin/bash

#SBATCH --job-name=templ2MNI_job
#SBATCH --output=/data/project/YP_UG_2023/logs/%A_%a.out
#SBATCH --export=none
#SBATCH --cpus-per-task=20
#SBATCH --mem=5G

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load ants
module load fsl

mkdir /data/project/YP_UG_2023/data/Template
mkdir /data/project/YP_UG_2023/data/Template/templ2MNI
mkdir /data/project/YP_UG_2023/data/Template/templ2MNI/orig
mkdir /data/project/YP_UG_2023/data/Template/templ2MNI/template
scp $FSLDIR/data/standard/MNI152_T1_2mm_brain.nii.gz /data/project/YP_UG_2023/data/Template/templ2MNI/template/MNI.nii.gz
scp /data/project/YP_UG_2023/T1/OXYDECtemplate0.nii.gz /data/project/YP_UG_2023/data/Template/templ2MNI/orig/template.nii.gz

ants antsIntroduction.sh -d 3 -r /data/project/YP_UG_2023/data/Template/templ2MNI/template/MNI.nii.gz -i /data/project/YP_UG_2023/data/Template/templ2MNI/orig/template.nii.gz -o /data/project/YP_UG_2023/data/Template/templ2MNI/templ2MNI_ -f 1 -m 30x90x20 -n 0 -q 0 -s CC -t GR