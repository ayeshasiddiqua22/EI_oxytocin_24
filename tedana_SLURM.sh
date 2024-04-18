#!/bin/bash

#SBATCH --job-name=Tedana.queue
#SBATCH --output=/data/project/YP_UG_2023/tedana_logs/%j.out
#SBATCH --export=none
#SBATCH --mem=10G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20 

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load tedana
module load afni
module load fsl

# set the working variables
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/list
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"

# High dose
cd ${DATA}/${SUBJECT}/H

echo "------Running afni_proc.py------"
afni afni_proc.py -subj_id rsfmri_newTedana_nocomb_nostruc2 -blocks despike tshift volreg -dsets_me_run me_echo1.nii.gz me_echo2.nii.gz me_echo3.nii.gz -echo_times 12 28 44 -tcat_remove_first_trs 0 -tshift_opts_ts -tpattern seqminus -volreg_align_to MIN_OUTLIER -volreg_post_vr_allin no -volreg_pvra_base_index MIN_OUTLIER -html_review_style pythonic -execute

echo "------Running bet------"
bet me_echo1.nii.gz me_echo1_brain.nii.gz

echo "------Running fslmaths------"
fslmaths me_echo1_brain.nii.gz -bin me_echo1_brain_bin.nii.gz

cd ${DATA}/${SUBJECT}/H/rsfmri_newTedana_nocomb_nostruc2.results

echo "------Running tedana------"
tedana -d pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e01.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e02.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e03.volreg+orig.BRIK -e 12.0 28.0 44.0 --mask ${DATA}/${SUBJECT}/H/me_echo1_brain_bin.nii.gz --verbose

cp ${DATA}/${SUBJECT}/H/rsfmri_newTedana_nocomb_nostruc2.results/desc-optcomDenoised_bold.nii.gz ${DATA}/${SUBJECT}/H/desc-optcomDenoised_bold.nii.gz

# Medium dose
cd ${DATA}/${SUBJECT}/M

echo "------Running afni_proc.py------"
afni afni_proc.py -subj_id rsfmri_newTedana_nocomb_nostruc2 -blocks despike tshift volreg -dsets_me_run me_echo1.nii.gz me_echo2.nii.gz me_echo3.nii.gz -echo_times 12 28 44 -tcat_remove_first_trs 0 -tshift_opts_ts -tpattern seqminus -volreg_align_to MIN_OUTLIER -volreg_post_vr_allin no -volreg_pvra_base_index MIN_OUTLIER -html_review_style pythonic -execute

echo "------Running bet------"
bet me_echo1.nii.gz me_echo1_brain.nii.gz

echo "------Running fslmaths------"
fslmaths me_echo1_brain.nii.gz -bin me_echo1_brain_bin.nii.gz

cd ${DATA}/${SUBJECT}/M/rsfmri_newTedana_nocomb_nostruc2.results

echo "------Running tedana------"
tedana -d pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e01.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e02.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e03.volreg+orig.BRIK -e 12.0 28.0 44.0 --mask ${DATA}/${SUBJECT}/M/me_echo1_brain_bin.nii.gz --verbose

cp ${DATA}/${SUBJECT}/M/rsfmri_newTedana_nocomb_nostruc2.results/desc-optcomDenoised_bold.nii.gz ${DATA}/${SUBJECT}/M/desc-optcomDenoised_bold.nii.gz

# Low dose
cd ${DATA}/${SUBJECT}/L

echo "------Running afni_proc.py------"
afni afni_proc.py -subj_id rsfmri_newTedana_nocomb_nostruc2 -blocks despike tshift volreg -dsets_me_run me_echo1.nii.gz me_echo2.nii.gz me_echo3.nii.gz -echo_times 12 28 44 -tcat_remove_first_trs 0 -tshift_opts_ts -tpattern seqminus -volreg_align_to MIN_OUTLIER -volreg_post_vr_allin no -volreg_pvra_base_index MIN_OUTLIER -html_review_style pythonic -execute

echo "------Running bet------"
bet me_echo1.nii.gz me_echo1_brain.nii.gz

echo "------Running fslmaths------"
fslmaths me_echo1_brain.nii.gz -bin me_echo1_brain_bin.nii.gz

cd ${DATA}/${SUBJECT}/L/rsfmri_newTedana_nocomb_nostruc2.results

echo "------Running tedana------"
tedana -d pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e01.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e02.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e03.volreg+orig.BRIK -e 12.0 28.0 44.0 --mask ${DATA}/${SUBJECT}/L/me_echo1_brain_bin.nii.gz --verbose

cp ${DATA}/${SUBJECT}/L/rsfmri_newTedana_nocomb_nostruc2.results/desc-optcomDenoised_bold.nii.gz ${DATA}/${SUBJECT}/L/desc-optcomDenoised_bold.nii.gz

# Placebo
cd ${DATA}/${SUBJECT}/PL

echo "------Running afni_proc.py------"
afni afni_proc.py -subj_id rsfmri_newTedana_nocomb_nostruc2 -blocks despike tshift volreg -dsets_me_run me_echo1.nii.gz me_echo2.nii.gz me_echo3.nii.gz -echo_times 12 28 44 -tcat_remove_first_trs 0 -tshift_opts_ts -tpattern seqminus -volreg_align_to MIN_OUTLIER -volreg_post_vr_allin no -volreg_pvra_base_index MIN_OUTLIER -html_review_style pythonic -execute

echo "------Running bet------"
bet me_echo1.nii.gz me_echo1_brain.nii.gz

echo "------Running fslmaths------"
fslmaths me_echo1_brain.nii.gz -bin me_echo1_brain_bin.nii.gz

cd ${DATA}/${SUBJECT}/PL/rsfmri_newTedana_nocomb_nostruc2.results

echo "------Running tedana------"
tedana -d pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e01.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e02.volreg+orig.BRIK pb03.rsfmri_newTedana_nocomb_nostruc2.r01.e03.volreg+orig.BRIK -e 12.0 28.0 44.0 --mask ${DATA}/${SUBJECT}/PL/me_echo1_brain_bin.nii.gz --verbose

cp ${DATA}/${SUBJECT}/PL/rsfmri_newTedana_nocomb_nostruc2.results/desc-optcomDenoised_bold.nii.gz ${DATA}/${SUBJECT}/PL/desc-optcomDenoised_bold.nii.gz