#!/bin/bash

#SBATCH --job-name=wm_csf_tfilt.queue
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
module load ants

# set the working variables 
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/full_list
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"
sigma=44.44 

cd ${DATA}/${SUBJECT}/

#####Segment the images#####
echo "-----segmenting the images-----making the structural.fast directory"
mkdir T1/structural.fast
echo "-----running FSLfast-----"
fast -t 1 -n 3 -H 0.1 -I 4 -l 20.0 -o T1/structural.fast/structural T1/OXYDEC${SUBJECT}_T1_optiBET_brain.nii.gz

#####white matter regression#####
echo "-----processing whitematter repression-----"

echo "-----running fslmaths creating WMmask_eroded-----"
fslmaths T1/structural.fast/structural_pve_2.nii.gz -thr 0.9 -ero T1/WMmask_eroded

#H#
ants WarpImageMultiTransform 3 T1/WMmask_eroded.nii.gz H/WMmask_func.nii.gz -R H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i H/func2struct/func2struct_Affine.txt
#M#
ants WarpImageMultiTransform 3 T1/WMmask_eroded.nii.gz M/WMmask_func.nii.gz -R M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i M/func2struct/func2struct_Affine.txt
#L#
ants WarpImageMultiTransform 3 T1/WMmask_eroded.nii.gz L/WMmask_func.nii.gz -R L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i L/func2struct/func2struct_Affine.txt
#PL#
ants WarpImageMultiTransform 3 T1/WMmask_eroded.nii.gz PL/WMmask_func.nii.gz -R PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i PL/func2struct/func2struct_Affine.txt

echo "-----running fslmaths creating WMmask2_func-----"
#H#
fslmaths H/WMmask_func -mas H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz H/WMmask2_func
#M#
fslmaths M/WMmask_func -mas M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz M/WMmask2_func
#L#
fslmaths L/WMmask_func -mas L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz L/WMmask2_func
#PL#
fslmaths PL/WMmask_func -mas PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz PL/WMmask2_func

echo "-----running fsmmeants creating WM.timeseries-----"
#H#
fslmeants -i H/desc-optcomDenoised_bold.nii.gz -m H/WMmask2_func --no_bin -o H/WM.timeseries
#M#
fslmeants -i M/desc-optcomDenoised_bold.nii.gz -m M/WMmask2_func --no_bin -o M/WM.timeseries
#L#
fslmeants -i L/desc-optcomDenoised_bold.nii.gz -m L/WMmask2_func --no_bin -o L/WM.timeseries
#PL#
fslmeants -i PL/desc-optcomDenoised_bold.nii.gz -m PL/WMmask2_func --no_bin -o PL/WM.timeseries

#####CSF regression#####
echo "-----processing CSF repression-----"

echo "-----running fslmaths creating CSFmask_eroded-----"
fslmaths T1/structural.fast/structural_pve_0.nii.gz -thr 0.9 -ero T1/CSFmask_eroded

#H#
ants WarpImageMultiTransform 3 T1/CSFmask_eroded.nii.gz H/CSFmask_func.nii.gz -R H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i H/func2struct/func2struct_Affine.txt
#M#
ants WarpImageMultiTransform 3 T1/CSFmask_eroded.nii.gz M/CSFmask_func.nii.gz -R M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i M/func2struct/func2struct_Affine.txt
#L#
ants WarpImageMultiTransform 3 T1/CSFmask_eroded.nii.gz L/CSFmask_func.nii.gz -R L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i L/func2struct/func2struct_Affine.txt
#PL#
ants WarpImageMultiTransform 3 T1/CSFmask_eroded.nii.gz PL/CSFmask_func.nii.gz -R PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz -i PL/func2struct/func2struct_Affine.txt

echo "-----running fslmaths creating CSFmsk2_func-----"
#H#
fslmaths H/CSFmask_func -mas H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz H/CSFmask2_func
#M#
fslmaths M/CSFmask_func -mas M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz M/CSFmask2_func
#L#
fslmaths L/CSFmask_func -mas L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz L/CSFmask2_func
#PL#
fslmaths PL/CSFmask_func -mas PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz PL/CSFmask2_func

echo "-----running FSLmeants creating WM.timeseries-----"
#H#
fslmeants -i H/desc-optcomDenoised_bold.nii.gz -m H/CSFmask2_func --no_bin -o H/CSF.timeseries
#M#
fslmeants -i M/desc-optcomDenoised_bold.nii.gz -m M/CSFmask2_func --no_bin -o M/CSF.timeseries
#L#
fslmeants -i L/desc-optcomDenoised_bold.nii.gz -m L/CSFmask2_func --no_bin -o L/CSF.timeseries
#PL#
fslmeants -i PL/desc-optcomDenoised_bold.nii.gz -m PL/CSFmask2_func --no_bin -o PL/CSF.timeseries

#merging to create nuisance timeseries#
echo "-----creating nuisance.timeseries-----"
#H#
paste H/WM.timeseries H/CSF.timeseries > H/nuisance.timeseries
#M#
paste M/WM.timeseries M/CSF.timeseries > M/nuisance.timeseries
#L#
paste L/WM.timeseries L/CSF.timeseries > L/nuisance.timeseries
#PL#
paste PL/WM.timeseries PL/CSF.timeseries > PL/nuisance.timeseries

#creating rest_medn_wm_csf_tfilt.nii.gz# 

echo "-----running fsl_glm HIGH DOSE-----"
fsl_glm -i H/desc-optcomDenoised_bold.nii.gz -o H/confounds -d H/nuisance.timeseries --demean --out_res=H/residual
echo "-----running fslmaths creating rest_medn_wm_csf_tfilt.nii.gz "
fslmaths H/residual -bptf $sigma -1 -add H/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz H/rest_medn_wm_csf_tfilt.nii.gz

echo "-----running fsl_glm MEDIUM DOSE-----"
fsl_glm -i M/desc-optcomDenoised_bold.nii.gz -o M/confounds -d M/nuisance.timeseries --demean --out_res=M/residual
echo "-----running fslmaths creating rest_medn_wm_csf_tfilt.nii.gz "
fslmaths M/residual -bptf $sigma -1 -add M/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz M/rest_medn_wm_csf_tfilt.nii.gz

echo "-----running fsl_glm LOW DOSE-----"
fsl_glm -i L/desc-optcomDenoised_bold.nii.gz -o L/confounds -d L/nuisance.timeseries --demean --out_res=L/residual
echo "-----running fslmaths creating rest_medn_wm_csf_tfilt.nii.gz "
fslmaths L/residual -bptf $sigma -1 -add L/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz L/rest_medn_wm_csf_tfilt.nii.gz

echo "-----running fsl_glm PLACEBO-----"
fsl_glm -i PL/desc-optcomDenoised_bold.nii.gz -o PL/confounds -d PL/nuisance.timeseries --demean --out_res=PL/residual
echo "-----running fslmaths creating rest_medn_wm_csf_tfilt.nii.gz "
fslmaths PL/residual -bptf $sigma -1 -add PL/func2struct/orig/desc-optcomDenoised_bold_mean.nii.gz PL/rest_medn_wm_csf_tfilt.nii.gz

#creating rest_medn_tfilt.nii.gz# 

echo "-----running fslmaths creating rest_medn_wm_csf_tfilt.nii.gz "
#H#
fslmaths H/desc-optcomDenoised_bold.nii.gz -bptf $sigma -1 H/rest_medn_tfilt.nii.gz
#M#
fslmaths M/desc-optcomDenoised_bold.nii.gz -bptf $sigma -1 M/rest_medn_tfilt.nii.gz
#L#
fslmaths L/desc-optcomDenoised_bold.nii.gz -bptf $sigma -1 L/rest_medn_tfilt.nii.gz
#L#
fslmaths PL/desc-optcomDenoised_bold.nii.gz -bptf $sigma -1 PL/rest_medn_tfilt.nii.gz