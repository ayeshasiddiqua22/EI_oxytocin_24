# EI_oxytocin_24

This is the supplementary code for the pre-processing, extraction, and analysis of data used for Ayesha Siddiqua's final year project (2023 - 2024; BSc Neuroscience & Psychology; Institute of Psychiatry, Psychology and Neuroscience; King's College London), titled "Investigating the effect of oxytocin on the excitation-inhibition ratio via the Hurst exponent: a rsfMRI study of mice and men."

Pre-processing scripts should be read/utilised in the following order (corresponding with the manuscript): 
1. struc_extraction_SLURM.sh
2. echo_split_SLURM.sh
3. tedana_SLURM.sh
4. S_S_template_SLURM.sh
5. templ2MNI_SLURM.sh
6. func2struc_SLURM.sh
7. WM_CSFReg_SLURM.sh
8. normalisation_SLURM3.sh

Here are links to github pages for important functions/scripts used here: 
1. Tedana (https://github.com/ME-ICA/tedana)
2. antsMultivariateTemplateConstruction.sh (https://github.com/ANTsX/ANTs/blob/master/Scripts/antsMultivariateTemplateConstruction.sh)
3. antsIntroduction.sh (https://github.com/ANTsX/ANTs/blob/master/Scripts/antsIntroduction.sh)
