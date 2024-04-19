#!/bin/bash

#SBATCH --job-name=NormFuncData.queue
#SBATCH --output=/data/project/YP_UG_2023/data/norm_logs/%j.out
#SBATCH --export=none
#SBATCH --mem=10G
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20 

source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load ants
module load fsl

# set the working variables
DATA=/data/project/YP_UG_2023/data
T1DIR=/data/project/YP_UG_2023/T1
INDEX=$DATA/full_list
NO=$DATA/file
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"
FILE="`awk FNR==$SLURM_ARRAY_TASK_ID $NO`"

###################~◊HIGH DOSE◊~###################
echo "------Processing High Dose------"

echo "------Making $/{DATA}/$/{SUBJECT}/H/func2MNI folder------"
mkdir ${DATA}/${SUBJECT}/H/func2MNI

echo "------Running FSLsplit------"
fslsplit ${DATA}/${SUBJECT}/H/rest_medn_wm_csf_tfilt.nii.gz ${DATA}/${SUBJECT}/H/func2MNI/

echo "------cd /H/func2MNI/ folder------"
cd ${DATA}/${SUBJECT}/H/func2MNI/

echo "------Running ants WarpImageMultiTransform for each volume------"
for vol in 0*.nii.gz
do ants WarpImageMultiTransform 3 $vol out_${vol}.nii.gz -R ${DATA}/Template/templ2MNI/template/MNI.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Warp.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Affine.txt $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Warp.nii.gz $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Affine.txt ${DATA}/${SUBJECT}/H/func2struct/func2struct_Affine.txt
done

echo "------Running FSLmerge, merging volumes to a 4D file------"
fslmerge -t ${DATA}/${SUBJECT}/H/rest_medn_wm_csf_tfilt_final.nii.gz out_*.nii.gz

echo "------Removing original and warped individual volumes------"
rm out*
rm 0*

###################~◊MEDIUM DOSE◊~###################
echo "------Processing Medium Dose------"

echo "------Making $/{DATA}/$/{SUBJECT}/M/func2MNI folder------"
mkdir ${DATA}/${SUBJECT}/M/func2MNI

echo "------Running FSLsplit------"
fslsplit ${DATA}/${SUBJECT}/M/rest_medn_wm_csf_tfilt.nii.gz ${DATA}/${SUBJECT}/M/func2MNI/

echo "------cd /M/func2MNI/ folder------"
cd ${DATA}/${SUBJECT}/M/func2MNI/

echo "------Running ants WarpImageMultiTransform for each volume------"
for vol in 0*.nii.gz
do ants WarpImageMultiTransform 3 $vol out_${vol}.nii.gz -R ${DATA}/Template/templ2MNI/template/MNI.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Warp.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Affine.txt $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Warp.nii.gz $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Affine.txt ${DATA}/${SUBJECT}/H/func2struct/func2struct_Affine.txt
done

echo "------Running FSLmerge, merging volumes to a 4D file------"
fslmerge -t ${DATA}/${SUBJECT}/M/rest_medn_wm_csf_tfilt_final.nii.gz out_*.nii.gz

echo "------Removing original and warped individual volumes------"
rm out*
rm 0*

###################~◊LOW DOSE◊~###################
echo "------Processing Low Dose------"

echo "------Making $/{DATA}/$/{SUBJECT}/L/func2MNI folder------"
mkdir ${DATA}/${SUBJECT}/L/func2MNI

echo "------Running FSLsplit------"
fslsplit ${DATA}/${SUBJECT}/L/rest_medn_wm_csf_tfilt.nii.gz ${DATA}/${SUBJECT}/L/func2MNI/

echo "------cd /L/func2MNI/ folder------"
cd ${DATA}/${SUBJECT}/L/func2MNI/

echo "------Running ants WarpImageMultiTransform for each volume------"
for vol in 0*.nii.gz
do ants WarpImageMultiTransform 3 $vol out_${vol}.nii.gz -R ${DATA}/Template/templ2MNI/template/MNI.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Warp.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Affine.txt $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Warp.nii.gz $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Affine.txt ${DATA}/${SUBJECT}/H/func2struct/func2struct_Affine.txt
done

echo "------Running FSLmerge, merging volumes to a 4D file------"
fslmerge -t ${DATA}/${SUBJECT}/L/rest_medn_wm_csf_tfilt_final.nii.gz out_*.nii.gz

echo "------Removing original and warped individual volumes------"
rm out*
rm 0*

###################~◊PLACEBO◊~###################
echo "------Processing Placebo------"

echo "------Making $/{DATA}/${SUBJECT}/PL/func2MNI folder------"
mkdir ${DATA}/${SUBJECT}/PL/func2MNI

echo "------Running FSLsplit------"
fslsplit ${DATA}/${SUBJECT}/PL/rest_medn_wm_csf_tfilt.nii.gz ${DATA}/${SUBJECT}/PL/func2MNI/

echo "------cd /PL/func2MNI/ folder------"
cd ${DATA}/${SUBJECT}/PL/func2MNI/

echo "------Running ants WarpImageMultiTransform for each volume------"
for vol in 0*.nii.gz
do ants WarpImageMultiTransform 3 $vol out_${vol}.nii.gz -R ${DATA}/Template/templ2MNI/template/MNI.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Warp.nii.gz ${DATA}/Template/templ2MNI/templ2MNI_Affine.txt $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Warp.nii.gz $T1DIR/OXYDEC${SUBJECT}_T1_optiBET_brain{FILE}*Affine.txt ${DATA}/${SUBJECT}/H/func2struct/func2struct_Affine.txt
done

echo "------Running FSLmerge, merging volumes to a 4D file------"
fslmerge -t ${DATA}/${SUBJECT}/PL/rest_medn_wm_csf_tfilt_final.nii.gz out_*.nii.gz

echo "------Removing original and warped individual volumes------"
rm out*
rm 0*
