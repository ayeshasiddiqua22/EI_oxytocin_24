#!/bin/bash
 
#SBATCH --job-name=echo_split.queue
#SBATCH --output=/data/project/YP_UG_2023/logs/%j.out
#SBATCH --export=none
# Run 1-100 jobs and limit to 20 jobs at once
#SBATCH --array=1-100%20
 
source /software/system/modules/latest/init/bash
module use /software/system/modules/NaN/generic
module purge
module load nan
module load fsl
 
DATA=/data/project/YP_UG_2023/data
INDEX=$DATA/list
	# Search the file for the SGE_TASK_ID number as a line number
SUBJECT="`awk FNR==$SLURM_ARRAY_TASK_ID $INDEX`"
 
# H
cd ${DATA}/${SUBJECT}/H
 
fslsplit OXYDEC${SUBJECT}_RS_H.nii.gz ./

fslmerge -t me_echo1.nii.gz 0000.nii.gz 0001.nii.gz 0002.nii.gz 0003.nii.gz 0004.nii.gz 0005.nii.gz 0006.nii.gz 0007.nii.gz 0008.nii.gz 0009.nii.gz 0010.nii.gz 0011.nii.gz 0012.nii.gz 0013.nii.gz 0014.nii.gz 0015.nii.gz 0016.nii.gz 0017.nii.gz 0018.nii.gz 0019.nii.gz 0020.nii.gz 0021.nii.gz 0022.nii.gz 0023.nii.gz 0024.nii.gz 0025.nii.gz 0026.nii.gz 0027.nii.gz 0028.nii.gz 0029.nii.gz 0030.nii.gz 0031.nii.gz 0032.nii.gz 0033.nii.gz 0034.nii.gz 0035.nii.gz 0036.nii.gz 0037.nii.gz 0038.nii.gz 0039.nii.gz 0040.nii.gz 0041.nii.gz 0042.nii.gz 0043.nii.gz 0044.nii.gz 0045.nii.gz 0046.nii.gz 0047.nii.gz 0048.nii.gz 0049.nii.gz 0050.nii.gz 0051.nii.gz 0052.nii.gz 0053.nii.gz 0054.nii.gz 0055.nii.gz 0056.nii.gz 0057.nii.gz 0058.nii.gz 0059.nii.gz 0060.nii.gz 0061.nii.gz 0062.nii.gz 0063.nii.gz 0064.nii.gz 0065.nii.gz 0066.nii.gz 0067.nii.gz 0068.nii.gz 0069.nii.gz 0070.nii.gz 0071.nii.gz 0072.nii.gz 0073.nii.gz 0074.nii.gz 0075.nii.gz 0076.nii.gz 0077.nii.gz 0078.nii.gz 0079.nii.gz 0080.nii.gz 0081.nii.gz 0082.nii.gz 0083.nii.gz 0084.nii.gz 0085.nii.gz 0086.nii.gz 0087.nii.gz 0088.nii.gz 0089.nii.gz 0090.nii.gz 0091.nii.gz 0092.nii.gz 0093.nii.gz 0094.nii.gz 0095.nii.gz 0096.nii.gz 0097.nii.gz 0098.nii.gz 0099.nii.gz 0100.nii.gz 0101.nii.gz 0102.nii.gz 0103.nii.gz 0104.nii.gz 0105.nii.gz 0106.nii.gz 0107.nii.gz 0108.nii.gz 0109.nii.gz 0110.nii.gz 0111.nii.gz 0112.nii.gz 0113.nii.gz 0114.nii.gz 0115.nii.gz 0116.nii.gz 0117.nii.gz 0118.nii.gz 0119.nii.gz 0120.nii.gz 0121.nii.gz 0122.nii.gz 0123.nii.gz 0124.nii.gz 0125.nii.gz 0126.nii.gz 0127.nii.gz 0128.nii.gz 0129.nii.gz 0130.nii.gz 0131.nii.gz 0132.nii.gz 0133.nii.gz 0134.nii.gz 0135.nii.gz 0136.nii.gz 0137.nii.gz 0138.nii.gz 0139.nii.gz 0140.nii.gz 0141.nii.gz 0142.nii.gz 0143.nii.gz 0144.nii.gz 0145.nii.gz 0146.nii.gz 0147.nii.gz 0148.nii.gz 0149.nii.gz 0150.nii.gz 0151.nii.gz 0152.nii.gz 0153.nii.gz 0154.nii.gz 0155.nii.gz 0156.nii.gz 0157.nii.gz 0158.nii.gz 0159.nii.gz 0160.nii.gz 0161.nii.gz 0162.nii.gz 0163.nii.gz 0164.nii.gz 0165.nii.gz 0166.nii.gz 0167.nii.gz 0168.nii.gz 0169.nii.gz 0170.nii.gz 0171.nii.gz 0172.nii.gz 0173.nii.gz 0174.nii.gz 0175.nii.gz 0176.nii.gz 0177.nii.gz 0178.nii.gz 0179.nii.gz 0180.nii.gz 0181.nii.gz 0182.nii.gz 0183.nii.gz 0184.nii.gz 0185.nii.gz 0186.nii.gz 0187.nii.gz 0188.nii.gz 0189.nii.gz 0190.nii.gz 0191.nii.gz 0192.nii.gz 0193.nii.gz 0194.nii.gz 0195.nii.gz 0196.nii.gz 0197.nii.gz 0198.nii.gz 0199.nii.gz 0200.nii.gz 0201.nii.gz 0202.nii.gz 0203.nii.gz 0204.nii.gz 0205.nii.gz 0206.nii.gz 0207.nii.gz 0208.nii.gz 0209.nii.gz 0210.nii.gz 0211.nii.gz 0212.nii.gz 0213.nii.gz 
 
fslmerge -t me_echo2.nii.gz 0214.nii.gz 0215.nii.gz 0216.nii.gz 0217.nii.gz 0218.nii.gz 0219.nii.gz 0220.nii.gz 0221.nii.gz 0222.nii.gz 0223.nii.gz 0224.nii.gz 0225.nii.gz 0226.nii.gz 0227.nii.gz 0228.nii.gz 0229.nii.gz 0230.nii.gz 0231.nii.gz 0232.nii.gz 0233.nii.gz 0234.nii.gz 0235.nii.gz 0236.nii.gz 0237.nii.gz 0238.nii.gz 0239.nii.gz 0240.nii.gz 0241.nii.gz 0242.nii.gz 0243.nii.gz 0244.nii.gz 0245.nii.gz 0246.nii.gz 0247.nii.gz 0248.nii.gz 0249.nii.gz 0250.nii.gz 0251.nii.gz 0252.nii.gz 0253.nii.gz 0254.nii.gz 0255.nii.gz 0256.nii.gz 0257.nii.gz 0258.nii.gz 0259.nii.gz 0260.nii.gz 0261.nii.gz 0262.nii.gz 0263.nii.gz 0264.nii.gz 0265.nii.gz 0266.nii.gz 0267.nii.gz 0268.nii.gz 0269.nii.gz 0270.nii.gz 0271.nii.gz 0272.nii.gz 0273.nii.gz 0274.nii.gz 0275.nii.gz 0276.nii.gz 0277.nii.gz 0278.nii.gz 0279.nii.gz 0280.nii.gz 0281.nii.gz 0282.nii.gz 0283.nii.gz 0284.nii.gz 0285.nii.gz 0286.nii.gz 0287.nii.gz 0288.nii.gz 0289.nii.gz 0290.nii.gz 0291.nii.gz 0292.nii.gz 0293.nii.gz 0294.nii.gz 0295.nii.gz 0296.nii.gz 0297.nii.gz 0298.nii.gz 0299.nii.gz 0300.nii.gz 0301.nii.gz 0302.nii.gz 0303.nii.gz 0304.nii.gz 0305.nii.gz 0306.nii.gz 0307.nii.gz 0308.nii.gz 0309.nii.gz 0310.nii.gz 0311.nii.gz 0312.nii.gz 0313.nii.gz 0314.nii.gz 0315.nii.gz 0316.nii.gz 0317.nii.gz 0318.nii.gz 0319.nii.gz 0320.nii.gz 0321.nii.gz 0322.nii.gz 0323.nii.gz 0324.nii.gz 0325.nii.gz 0326.nii.gz 0327.nii.gz 0328.nii.gz 0329.nii.gz 0330.nii.gz 0331.nii.gz 0332.nii.gz 0333.nii.gz 0334.nii.gz 0335.nii.gz 0336.nii.gz 0337.nii.gz 0338.nii.gz 0339.nii.gz 0340.nii.gz 0341.nii.gz 0342.nii.gz 0343.nii.gz 0344.nii.gz 0345.nii.gz 0346.nii.gz 0347.nii.gz 0348.nii.gz 0349.nii.gz 0350.nii.gz 0351.nii.gz 0352.nii.gz 0353.nii.gz 0354.nii.gz 0355.nii.gz 0356.nii.gz 0357.nii.gz 0358.nii.gz 0359.nii.gz 0360.nii.gz 0361.nii.gz 0362.nii.gz 0363.nii.gz 0364.nii.gz 0365.nii.gz 0366.nii.gz 0367.nii.gz 0368.nii.gz 0369.nii.gz 0370.nii.gz 0371.nii.gz 0372.nii.gz 0373.nii.gz 0374.nii.gz 0375.nii.gz 0376.nii.gz 0377.nii.gz 0378.nii.gz 0379.nii.gz 0380.nii.gz 0381.nii.gz 0382.nii.gz 0383.nii.gz 0384.nii.gz 0385.nii.gz 0386.nii.gz 0387.nii.gz 0388.nii.gz 0389.nii.gz 0390.nii.gz 0391.nii.gz 0392.nii.gz 0393.nii.gz 0394.nii.gz 0395.nii.gz 0396.nii.gz 0397.nii.gz 0398.nii.gz 0399.nii.gz 0400.nii.gz 0401.nii.gz 0402.nii.gz 0403.nii.gz 0404.nii.gz 0405.nii.gz 0406.nii.gz 0407.nii.gz 0408.nii.gz 0409.nii.gz 0410.nii.gz 0411.nii.gz 0412.nii.gz 0413.nii.gz 0414.nii.gz 0415.nii.gz 0416.nii.gz 0417.nii.gz 0418.nii.gz 0419.nii.gz 0420.nii.gz 0421.nii.gz 0422.nii.gz 0423.nii.gz 0424.nii.gz 0425.nii.gz 0426.nii.gz 0427.nii.gz 
 
fslmerge -t me_echo3.nii.gz 0428.nii.gz 0429.nii.gz 0430.nii.gz 0431.nii.gz 0432.nii.gz 0433.nii.gz 0434.nii.gz 0435.nii.gz 0436.nii.gz 0437.nii.gz 0438.nii.gz 0439.nii.gz 0440.nii.gz 0441.nii.gz 0442.nii.gz 0443.nii.gz 0444.nii.gz 0445.nii.gz 0446.nii.gz 0447.nii.gz 0448.nii.gz 0449.nii.gz 0450.nii.gz 0451.nii.gz 0452.nii.gz 0453.nii.gz 0454.nii.gz 0455.nii.gz 0456.nii.gz 0457.nii.gz 0458.nii.gz 0459.nii.gz 0460.nii.gz 0461.nii.gz 0462.nii.gz 0463.nii.gz 0464.nii.gz 0465.nii.gz 0466.nii.gz 0467.nii.gz 0468.nii.gz 0469.nii.gz 0470.nii.gz 0471.nii.gz 0472.nii.gz 0473.nii.gz 0474.nii.gz 0475.nii.gz 0476.nii.gz 0477.nii.gz 0478.nii.gz 0479.nii.gz 0480.nii.gz 0481.nii.gz 0482.nii.gz 0483.nii.gz 0484.nii.gz 0485.nii.gz 0486.nii.gz 0487.nii.gz 0488.nii.gz 0489.nii.gz 0490.nii.gz 0491.nii.gz 0492.nii.gz 0493.nii.gz 0494.nii.gz 0495.nii.gz 0496.nii.gz 0497.nii.gz 0498.nii.gz 0499.nii.gz 0500.nii.gz 0501.nii.gz 0502.nii.gz 0503.nii.gz 0504.nii.gz 0505.nii.gz 0506.nii.gz 0507.nii.gz 0508.nii.gz 0509.nii.gz 0510.nii.gz 0511.nii.gz 0512.nii.gz 0513.nii.gz 0514.nii.gz 0515.nii.gz 0516.nii.gz 0517.nii.gz 0518.nii.gz 0519.nii.gz 0520.nii.gz 0521.nii.gz 0522.nii.gz 0523.nii.gz 0524.nii.gz 0525.nii.gz 0526.nii.gz 0527.nii.gz 0528.nii.gz 0529.nii.gz 0530.nii.gz 0531.nii.gz 0532.nii.gz 0533.nii.gz 0534.nii.gz 0535.nii.gz 0536.nii.gz 0537.nii.gz 0538.nii.gz 0539.nii.gz 0540.nii.gz 0541.nii.gz 0542.nii.gz 0543.nii.gz 0544.nii.gz 0545.nii.gz 0546.nii.gz 0547.nii.gz 0548.nii.gz 0549.nii.gz 0550.nii.gz 0551.nii.gz 0552.nii.gz 0553.nii.gz 0554.nii.gz 0555.nii.gz 0556.nii.gz 0557.nii.gz 0558.nii.gz 0559.nii.gz 0560.nii.gz 0561.nii.gz 0562.nii.gz 0563.nii.gz 0564.nii.gz 0565.nii.gz 0566.nii.gz 0567.nii.gz 0568.nii.gz 0569.nii.gz 0570.nii.gz 0571.nii.gz 0572.nii.gz 0573.nii.gz 0574.nii.gz 0575.nii.gz 0576.nii.gz 0577.nii.gz 0578.nii.gz 0579.nii.gz 0580.nii.gz 0581.nii.gz 0582.nii.gz 0583.nii.gz 0584.nii.gz 0585.nii.gz 0586.nii.gz 0587.nii.gz 0588.nii.gz 0589.nii.gz 0590.nii.gz 0591.nii.gz 0592.nii.gz 0593.nii.gz 0594.nii.gz 0595.nii.gz 0596.nii.gz 0597.nii.gz 0598.nii.gz 0599.nii.gz 0600.nii.gz 0601.nii.gz 0602.nii.gz 0603.nii.gz 0604.nii.gz 0605.nii.gz 0606.nii.gz 0607.nii.gz 0608.nii.gz 0609.nii.gz 0610.nii.gz 0611.nii.gz 0612.nii.gz 0613.nii.gz 0614.nii.gz 0615.nii.gz 0616.nii.gz 0617.nii.gz 0618.nii.gz 0619.nii.gz 0620.nii.gz 0621.nii.gz 0622.nii.gz 0623.nii.gz 0624.nii.gz 0625.nii.gz 0626.nii.gz 0627.nii.gz 0628.nii.gz 0629.nii.gz 0630.nii.gz 0631.nii.gz 0632.nii.gz 0633.nii.gz 0634.nii.gz 0635.nii.gz 0636.nii.gz 0637.nii.gz 0638.nii.gz 0639.nii.gz 0640.nii.gz 0641.nii.gz 
 rm 0*
 
# M
cd ${DATA}/${SUBJECT}/M
 
fslsplit OXYDEC${SUBJECT}_RS_M.nii.gz ./

fslmerge -t me_echo1.nii.gz 0000.nii.gz 0001.nii.gz 0002.nii.gz 0003.nii.gz 0004.nii.gz 0005.nii.gz 0006.nii.gz 0007.nii.gz 0008.nii.gz 0009.nii.gz 0010.nii.gz 0011.nii.gz 0012.nii.gz 0013.nii.gz 0014.nii.gz 0015.nii.gz 0016.nii.gz 0017.nii.gz 0018.nii.gz 0019.nii.gz 0020.nii.gz 0021.nii.gz 0022.nii.gz 0023.nii.gz 0024.nii.gz 0025.nii.gz 0026.nii.gz 0027.nii.gz 0028.nii.gz 0029.nii.gz 0030.nii.gz 0031.nii.gz 0032.nii.gz 0033.nii.gz 0034.nii.gz 0035.nii.gz 0036.nii.gz 0037.nii.gz 0038.nii.gz 0039.nii.gz 0040.nii.gz 0041.nii.gz 0042.nii.gz 0043.nii.gz 0044.nii.gz 0045.nii.gz 0046.nii.gz 0047.nii.gz 0048.nii.gz 0049.nii.gz 0050.nii.gz 0051.nii.gz 0052.nii.gz 0053.nii.gz 0054.nii.gz 0055.nii.gz 0056.nii.gz 0057.nii.gz 0058.nii.gz 0059.nii.gz 0060.nii.gz 0061.nii.gz 0062.nii.gz 0063.nii.gz 0064.nii.gz 0065.nii.gz 0066.nii.gz 0067.nii.gz 0068.nii.gz 0069.nii.gz 0070.nii.gz 0071.nii.gz 0072.nii.gz 0073.nii.gz 0074.nii.gz 0075.nii.gz 0076.nii.gz 0077.nii.gz 0078.nii.gz 0079.nii.gz 0080.nii.gz 0081.nii.gz 0082.nii.gz 0083.nii.gz 0084.nii.gz 0085.nii.gz 0086.nii.gz 0087.nii.gz 0088.nii.gz 0089.nii.gz 0090.nii.gz 0091.nii.gz 0092.nii.gz 0093.nii.gz 0094.nii.gz 0095.nii.gz 0096.nii.gz 0097.nii.gz 0098.nii.gz 0099.nii.gz 0100.nii.gz 0101.nii.gz 0102.nii.gz 0103.nii.gz 0104.nii.gz 0105.nii.gz 0106.nii.gz 0107.nii.gz 0108.nii.gz 0109.nii.gz 0110.nii.gz 0111.nii.gz 0112.nii.gz 0113.nii.gz 0114.nii.gz 0115.nii.gz 0116.nii.gz 0117.nii.gz 0118.nii.gz 0119.nii.gz 0120.nii.gz 0121.nii.gz 0122.nii.gz 0123.nii.gz 0124.nii.gz 0125.nii.gz 0126.nii.gz 0127.nii.gz 0128.nii.gz 0129.nii.gz 0130.nii.gz 0131.nii.gz 0132.nii.gz 0133.nii.gz 0134.nii.gz 0135.nii.gz 0136.nii.gz 0137.nii.gz 0138.nii.gz 0139.nii.gz 0140.nii.gz 0141.nii.gz 0142.nii.gz 0143.nii.gz 0144.nii.gz 0145.nii.gz 0146.nii.gz 0147.nii.gz 0148.nii.gz 0149.nii.gz 0150.nii.gz 0151.nii.gz 0152.nii.gz 0153.nii.gz 0154.nii.gz 0155.nii.gz 0156.nii.gz 0157.nii.gz 0158.nii.gz 0159.nii.gz 0160.nii.gz 0161.nii.gz 0162.nii.gz 0163.nii.gz 0164.nii.gz 0165.nii.gz 0166.nii.gz 0167.nii.gz 0168.nii.gz 0169.nii.gz 0170.nii.gz 0171.nii.gz 0172.nii.gz 0173.nii.gz 0174.nii.gz 0175.nii.gz 0176.nii.gz 0177.nii.gz 0178.nii.gz 0179.nii.gz 0180.nii.gz 0181.nii.gz 0182.nii.gz 0183.nii.gz 0184.nii.gz 0185.nii.gz 0186.nii.gz 0187.nii.gz 0188.nii.gz 0189.nii.gz 0190.nii.gz 0191.nii.gz 0192.nii.gz 0193.nii.gz 0194.nii.gz 0195.nii.gz 0196.nii.gz 0197.nii.gz 0198.nii.gz 0199.nii.gz 0200.nii.gz 0201.nii.gz 0202.nii.gz 0203.nii.gz 0204.nii.gz 0205.nii.gz 0206.nii.gz 0207.nii.gz 0208.nii.gz 0209.nii.gz 0210.nii.gz 0211.nii.gz 0212.nii.gz 0213.nii.gz 
 
fslmerge -t me_echo2.nii.gz 0214.nii.gz 0215.nii.gz 0216.nii.gz 0217.nii.gz 0218.nii.gz 0219.nii.gz 0220.nii.gz 0221.nii.gz 0222.nii.gz 0223.nii.gz 0224.nii.gz 0225.nii.gz 0226.nii.gz 0227.nii.gz 0228.nii.gz 0229.nii.gz 0230.nii.gz 0231.nii.gz 0232.nii.gz 0233.nii.gz 0234.nii.gz 0235.nii.gz 0236.nii.gz 0237.nii.gz 0238.nii.gz 0239.nii.gz 0240.nii.gz 0241.nii.gz 0242.nii.gz 0243.nii.gz 0244.nii.gz 0245.nii.gz 0246.nii.gz 0247.nii.gz 0248.nii.gz 0249.nii.gz 0250.nii.gz 0251.nii.gz 0252.nii.gz 0253.nii.gz 0254.nii.gz 0255.nii.gz 0256.nii.gz 0257.nii.gz 0258.nii.gz 0259.nii.gz 0260.nii.gz 0261.nii.gz 0262.nii.gz 0263.nii.gz 0264.nii.gz 0265.nii.gz 0266.nii.gz 0267.nii.gz 0268.nii.gz 0269.nii.gz 0270.nii.gz 0271.nii.gz 0272.nii.gz 0273.nii.gz 0274.nii.gz 0275.nii.gz 0276.nii.gz 0277.nii.gz 0278.nii.gz 0279.nii.gz 0280.nii.gz 0281.nii.gz 0282.nii.gz 0283.nii.gz 0284.nii.gz 0285.nii.gz 0286.nii.gz 0287.nii.gz 0288.nii.gz 0289.nii.gz 0290.nii.gz 0291.nii.gz 0292.nii.gz 0293.nii.gz 0294.nii.gz 0295.nii.gz 0296.nii.gz 0297.nii.gz 0298.nii.gz 0299.nii.gz 0300.nii.gz 0301.nii.gz 0302.nii.gz 0303.nii.gz 0304.nii.gz 0305.nii.gz 0306.nii.gz 0307.nii.gz 0308.nii.gz 0309.nii.gz 0310.nii.gz 0311.nii.gz 0312.nii.gz 0313.nii.gz 0314.nii.gz 0315.nii.gz 0316.nii.gz 0317.nii.gz 0318.nii.gz 0319.nii.gz 0320.nii.gz 0321.nii.gz 0322.nii.gz 0323.nii.gz 0324.nii.gz 0325.nii.gz 0326.nii.gz 0327.nii.gz 0328.nii.gz 0329.nii.gz 0330.nii.gz 0331.nii.gz 0332.nii.gz 0333.nii.gz 0334.nii.gz 0335.nii.gz 0336.nii.gz 0337.nii.gz 0338.nii.gz 0339.nii.gz 0340.nii.gz 0341.nii.gz 0342.nii.gz 0343.nii.gz 0344.nii.gz 0345.nii.gz 0346.nii.gz 0347.nii.gz 0348.nii.gz 0349.nii.gz 0350.nii.gz 0351.nii.gz 0352.nii.gz 0353.nii.gz 0354.nii.gz 0355.nii.gz 0356.nii.gz 0357.nii.gz 0358.nii.gz 0359.nii.gz 0360.nii.gz 0361.nii.gz 0362.nii.gz 0363.nii.gz 0364.nii.gz 0365.nii.gz 0366.nii.gz 0367.nii.gz 0368.nii.gz 0369.nii.gz 0370.nii.gz 0371.nii.gz 0372.nii.gz 0373.nii.gz 0374.nii.gz 0375.nii.gz 0376.nii.gz 0377.nii.gz 0378.nii.gz 0379.nii.gz 0380.nii.gz 0381.nii.gz 0382.nii.gz 0383.nii.gz 0384.nii.gz 0385.nii.gz 0386.nii.gz 0387.nii.gz 0388.nii.gz 0389.nii.gz 0390.nii.gz 0391.nii.gz 0392.nii.gz 0393.nii.gz 0394.nii.gz 0395.nii.gz 0396.nii.gz 0397.nii.gz 0398.nii.gz 0399.nii.gz 0400.nii.gz 0401.nii.gz 0402.nii.gz 0403.nii.gz 0404.nii.gz 0405.nii.gz 0406.nii.gz 0407.nii.gz 0408.nii.gz 0409.nii.gz 0410.nii.gz 0411.nii.gz 0412.nii.gz 0413.nii.gz 0414.nii.gz 0415.nii.gz 0416.nii.gz 0417.nii.gz 0418.nii.gz 0419.nii.gz 0420.nii.gz 0421.nii.gz 0422.nii.gz 0423.nii.gz 0424.nii.gz 0425.nii.gz 0426.nii.gz 0427.nii.gz 
 
fslmerge -t me_echo3.nii.gz 0428.nii.gz 0429.nii.gz 0430.nii.gz 0431.nii.gz 0432.nii.gz 0433.nii.gz 0434.nii.gz 0435.nii.gz 0436.nii.gz 0437.nii.gz 0438.nii.gz 0439.nii.gz 0440.nii.gz 0441.nii.gz 0442.nii.gz 0443.nii.gz 0444.nii.gz 0445.nii.gz 0446.nii.gz 0447.nii.gz 0448.nii.gz 0449.nii.gz 0450.nii.gz 0451.nii.gz 0452.nii.gz 0453.nii.gz 0454.nii.gz 0455.nii.gz 0456.nii.gz 0457.nii.gz 0458.nii.gz 0459.nii.gz 0460.nii.gz 0461.nii.gz 0462.nii.gz 0463.nii.gz 0464.nii.gz 0465.nii.gz 0466.nii.gz 0467.nii.gz 0468.nii.gz 0469.nii.gz 0470.nii.gz 0471.nii.gz 0472.nii.gz 0473.nii.gz 0474.nii.gz 0475.nii.gz 0476.nii.gz 0477.nii.gz 0478.nii.gz 0479.nii.gz 0480.nii.gz 0481.nii.gz 0482.nii.gz 0483.nii.gz 0484.nii.gz 0485.nii.gz 0486.nii.gz 0487.nii.gz 0488.nii.gz 0489.nii.gz 0490.nii.gz 0491.nii.gz 0492.nii.gz 0493.nii.gz 0494.nii.gz 0495.nii.gz 0496.nii.gz 0497.nii.gz 0498.nii.gz 0499.nii.gz 0500.nii.gz 0501.nii.gz 0502.nii.gz 0503.nii.gz 0504.nii.gz 0505.nii.gz 0506.nii.gz 0507.nii.gz 0508.nii.gz 0509.nii.gz 0510.nii.gz 0511.nii.gz 0512.nii.gz 0513.nii.gz 0514.nii.gz 0515.nii.gz 0516.nii.gz 0517.nii.gz 0518.nii.gz 0519.nii.gz 0520.nii.gz 0521.nii.gz 0522.nii.gz 0523.nii.gz 0524.nii.gz 0525.nii.gz 0526.nii.gz 0527.nii.gz 0528.nii.gz 0529.nii.gz 0530.nii.gz 0531.nii.gz 0532.nii.gz 0533.nii.gz 0534.nii.gz 0535.nii.gz 0536.nii.gz 0537.nii.gz 0538.nii.gz 0539.nii.gz 0540.nii.gz 0541.nii.gz 0542.nii.gz 0543.nii.gz 0544.nii.gz 0545.nii.gz 0546.nii.gz 0547.nii.gz 0548.nii.gz 0549.nii.gz 0550.nii.gz 0551.nii.gz 0552.nii.gz 0553.nii.gz 0554.nii.gz 0555.nii.gz 0556.nii.gz 0557.nii.gz 0558.nii.gz 0559.nii.gz 0560.nii.gz 0561.nii.gz 0562.nii.gz 0563.nii.gz 0564.nii.gz 0565.nii.gz 0566.nii.gz 0567.nii.gz 0568.nii.gz 0569.nii.gz 0570.nii.gz 0571.nii.gz 0572.nii.gz 0573.nii.gz 0574.nii.gz 0575.nii.gz 0576.nii.gz 0577.nii.gz 0578.nii.gz 0579.nii.gz 0580.nii.gz 0581.nii.gz 0582.nii.gz 0583.nii.gz 0584.nii.gz 0585.nii.gz 0586.nii.gz 0587.nii.gz 0588.nii.gz 0589.nii.gz 0590.nii.gz 0591.nii.gz 0592.nii.gz 0593.nii.gz 0594.nii.gz 0595.nii.gz 0596.nii.gz 0597.nii.gz 0598.nii.gz 0599.nii.gz 0600.nii.gz 0601.nii.gz 0602.nii.gz 0603.nii.gz 0604.nii.gz 0605.nii.gz 0606.nii.gz 0607.nii.gz 0608.nii.gz 0609.nii.gz 0610.nii.gz 0611.nii.gz 0612.nii.gz 0613.nii.gz 0614.nii.gz 0615.nii.gz 0616.nii.gz 0617.nii.gz 0618.nii.gz 0619.nii.gz 0620.nii.gz 0621.nii.gz 0622.nii.gz 0623.nii.gz 0624.nii.gz 0625.nii.gz 0626.nii.gz 0627.nii.gz 0628.nii.gz 0629.nii.gz 0630.nii.gz 0631.nii.gz 0632.nii.gz 0633.nii.gz 0634.nii.gz 0635.nii.gz 0636.nii.gz 0637.nii.gz 0638.nii.gz 0639.nii.gz 0640.nii.gz 0641.nii.gz 
 rm 0*
 
# L
cd ${DATA}/${SUBJECT}/L
 
fslsplit OXYDEC${SUBJECT}_RS_L.nii.gz ./

fslmerge -t me_echo1.nii.gz 0000.nii.gz 0001.nii.gz 0002.nii.gz 0003.nii.gz 0004.nii.gz 0005.nii.gz 0006.nii.gz 0007.nii.gz 0008.nii.gz 0009.nii.gz 0010.nii.gz 0011.nii.gz 0012.nii.gz 0013.nii.gz 0014.nii.gz 0015.nii.gz 0016.nii.gz 0017.nii.gz 0018.nii.gz 0019.nii.gz 0020.nii.gz 0021.nii.gz 0022.nii.gz 0023.nii.gz 0024.nii.gz 0025.nii.gz 0026.nii.gz 0027.nii.gz 0028.nii.gz 0029.nii.gz 0030.nii.gz 0031.nii.gz 0032.nii.gz 0033.nii.gz 0034.nii.gz 0035.nii.gz 0036.nii.gz 0037.nii.gz 0038.nii.gz 0039.nii.gz 0040.nii.gz 0041.nii.gz 0042.nii.gz 0043.nii.gz 0044.nii.gz 0045.nii.gz 0046.nii.gz 0047.nii.gz 0048.nii.gz 0049.nii.gz 0050.nii.gz 0051.nii.gz 0052.nii.gz 0053.nii.gz 0054.nii.gz 0055.nii.gz 0056.nii.gz 0057.nii.gz 0058.nii.gz 0059.nii.gz 0060.nii.gz 0061.nii.gz 0062.nii.gz 0063.nii.gz 0064.nii.gz 0065.nii.gz 0066.nii.gz 0067.nii.gz 0068.nii.gz 0069.nii.gz 0070.nii.gz 0071.nii.gz 0072.nii.gz 0073.nii.gz 0074.nii.gz 0075.nii.gz 0076.nii.gz 0077.nii.gz 0078.nii.gz 0079.nii.gz 0080.nii.gz 0081.nii.gz 0082.nii.gz 0083.nii.gz 0084.nii.gz 0085.nii.gz 0086.nii.gz 0087.nii.gz 0088.nii.gz 0089.nii.gz 0090.nii.gz 0091.nii.gz 0092.nii.gz 0093.nii.gz 0094.nii.gz 0095.nii.gz 0096.nii.gz 0097.nii.gz 0098.nii.gz 0099.nii.gz 0100.nii.gz 0101.nii.gz 0102.nii.gz 0103.nii.gz 0104.nii.gz 0105.nii.gz 0106.nii.gz 0107.nii.gz 0108.nii.gz 0109.nii.gz 0110.nii.gz 0111.nii.gz 0112.nii.gz 0113.nii.gz 0114.nii.gz 0115.nii.gz 0116.nii.gz 0117.nii.gz 0118.nii.gz 0119.nii.gz 0120.nii.gz 0121.nii.gz 0122.nii.gz 0123.nii.gz 0124.nii.gz 0125.nii.gz 0126.nii.gz 0127.nii.gz 0128.nii.gz 0129.nii.gz 0130.nii.gz 0131.nii.gz 0132.nii.gz 0133.nii.gz 0134.nii.gz 0135.nii.gz 0136.nii.gz 0137.nii.gz 0138.nii.gz 0139.nii.gz 0140.nii.gz 0141.nii.gz 0142.nii.gz 0143.nii.gz 0144.nii.gz 0145.nii.gz 0146.nii.gz 0147.nii.gz 0148.nii.gz 0149.nii.gz 0150.nii.gz 0151.nii.gz 0152.nii.gz 0153.nii.gz 0154.nii.gz 0155.nii.gz 0156.nii.gz 0157.nii.gz 0158.nii.gz 0159.nii.gz 0160.nii.gz 0161.nii.gz 0162.nii.gz 0163.nii.gz 0164.nii.gz 0165.nii.gz 0166.nii.gz 0167.nii.gz 0168.nii.gz 0169.nii.gz 0170.nii.gz 0171.nii.gz 0172.nii.gz 0173.nii.gz 0174.nii.gz 0175.nii.gz 0176.nii.gz 0177.nii.gz 0178.nii.gz 0179.nii.gz 0180.nii.gz 0181.nii.gz 0182.nii.gz 0183.nii.gz 0184.nii.gz 0185.nii.gz 0186.nii.gz 0187.nii.gz 0188.nii.gz 0189.nii.gz 0190.nii.gz 0191.nii.gz 0192.nii.gz 0193.nii.gz 0194.nii.gz 0195.nii.gz 0196.nii.gz 0197.nii.gz 0198.nii.gz 0199.nii.gz 0200.nii.gz 0201.nii.gz 0202.nii.gz 0203.nii.gz 0204.nii.gz 0205.nii.gz 0206.nii.gz 0207.nii.gz 0208.nii.gz 0209.nii.gz 0210.nii.gz 0211.nii.gz 0212.nii.gz 0213.nii.gz 
 
fslmerge -t me_echo2.nii.gz 0214.nii.gz 0215.nii.gz 0216.nii.gz 0217.nii.gz 0218.nii.gz 0219.nii.gz 0220.nii.gz 0221.nii.gz 0222.nii.gz 0223.nii.gz 0224.nii.gz 0225.nii.gz 0226.nii.gz 0227.nii.gz 0228.nii.gz 0229.nii.gz 0230.nii.gz 0231.nii.gz 0232.nii.gz 0233.nii.gz 0234.nii.gz 0235.nii.gz 0236.nii.gz 0237.nii.gz 0238.nii.gz 0239.nii.gz 0240.nii.gz 0241.nii.gz 0242.nii.gz 0243.nii.gz 0244.nii.gz 0245.nii.gz 0246.nii.gz 0247.nii.gz 0248.nii.gz 0249.nii.gz 0250.nii.gz 0251.nii.gz 0252.nii.gz 0253.nii.gz 0254.nii.gz 0255.nii.gz 0256.nii.gz 0257.nii.gz 0258.nii.gz 0259.nii.gz 0260.nii.gz 0261.nii.gz 0262.nii.gz 0263.nii.gz 0264.nii.gz 0265.nii.gz 0266.nii.gz 0267.nii.gz 0268.nii.gz 0269.nii.gz 0270.nii.gz 0271.nii.gz 0272.nii.gz 0273.nii.gz 0274.nii.gz 0275.nii.gz 0276.nii.gz 0277.nii.gz 0278.nii.gz 0279.nii.gz 0280.nii.gz 0281.nii.gz 0282.nii.gz 0283.nii.gz 0284.nii.gz 0285.nii.gz 0286.nii.gz 0287.nii.gz 0288.nii.gz 0289.nii.gz 0290.nii.gz 0291.nii.gz 0292.nii.gz 0293.nii.gz 0294.nii.gz 0295.nii.gz 0296.nii.gz 0297.nii.gz 0298.nii.gz 0299.nii.gz 0300.nii.gz 0301.nii.gz 0302.nii.gz 0303.nii.gz 0304.nii.gz 0305.nii.gz 0306.nii.gz 0307.nii.gz 0308.nii.gz 0309.nii.gz 0310.nii.gz 0311.nii.gz 0312.nii.gz 0313.nii.gz 0314.nii.gz 0315.nii.gz 0316.nii.gz 0317.nii.gz 0318.nii.gz 0319.nii.gz 0320.nii.gz 0321.nii.gz 0322.nii.gz 0323.nii.gz 0324.nii.gz 0325.nii.gz 0326.nii.gz 0327.nii.gz 0328.nii.gz 0329.nii.gz 0330.nii.gz 0331.nii.gz 0332.nii.gz 0333.nii.gz 0334.nii.gz 0335.nii.gz 0336.nii.gz 0337.nii.gz 0338.nii.gz 0339.nii.gz 0340.nii.gz 0341.nii.gz 0342.nii.gz 0343.nii.gz 0344.nii.gz 0345.nii.gz 0346.nii.gz 0347.nii.gz 0348.nii.gz 0349.nii.gz 0350.nii.gz 0351.nii.gz 0352.nii.gz 0353.nii.gz 0354.nii.gz 0355.nii.gz 0356.nii.gz 0357.nii.gz 0358.nii.gz 0359.nii.gz 0360.nii.gz 0361.nii.gz 0362.nii.gz 0363.nii.gz 0364.nii.gz 0365.nii.gz 0366.nii.gz 0367.nii.gz 0368.nii.gz 0369.nii.gz 0370.nii.gz 0371.nii.gz 0372.nii.gz 0373.nii.gz 0374.nii.gz 0375.nii.gz 0376.nii.gz 0377.nii.gz 0378.nii.gz 0379.nii.gz 0380.nii.gz 0381.nii.gz 0382.nii.gz 0383.nii.gz 0384.nii.gz 0385.nii.gz 0386.nii.gz 0387.nii.gz 0388.nii.gz 0389.nii.gz 0390.nii.gz 0391.nii.gz 0392.nii.gz 0393.nii.gz 0394.nii.gz 0395.nii.gz 0396.nii.gz 0397.nii.gz 0398.nii.gz 0399.nii.gz 0400.nii.gz 0401.nii.gz 0402.nii.gz 0403.nii.gz 0404.nii.gz 0405.nii.gz 0406.nii.gz 0407.nii.gz 0408.nii.gz 0409.nii.gz 0410.nii.gz 0411.nii.gz 0412.nii.gz 0413.nii.gz 0414.nii.gz 0415.nii.gz 0416.nii.gz 0417.nii.gz 0418.nii.gz 0419.nii.gz 0420.nii.gz 0421.nii.gz 0422.nii.gz 0423.nii.gz 0424.nii.gz 0425.nii.gz 0426.nii.gz 0427.nii.gz 
 
fslmerge -t me_echo3.nii.gz 0428.nii.gz 0429.nii.gz 0430.nii.gz 0431.nii.gz 0432.nii.gz 0433.nii.gz 0434.nii.gz 0435.nii.gz 0436.nii.gz 0437.nii.gz 0438.nii.gz 0439.nii.gz 0440.nii.gz 0441.nii.gz 0442.nii.gz 0443.nii.gz 0444.nii.gz 0445.nii.gz 0446.nii.gz 0447.nii.gz 0448.nii.gz 0449.nii.gz 0450.nii.gz 0451.nii.gz 0452.nii.gz 0453.nii.gz 0454.nii.gz 0455.nii.gz 0456.nii.gz 0457.nii.gz 0458.nii.gz 0459.nii.gz 0460.nii.gz 0461.nii.gz 0462.nii.gz 0463.nii.gz 0464.nii.gz 0465.nii.gz 0466.nii.gz 0467.nii.gz 0468.nii.gz 0469.nii.gz 0470.nii.gz 0471.nii.gz 0472.nii.gz 0473.nii.gz 0474.nii.gz 0475.nii.gz 0476.nii.gz 0477.nii.gz 0478.nii.gz 0479.nii.gz 0480.nii.gz 0481.nii.gz 0482.nii.gz 0483.nii.gz 0484.nii.gz 0485.nii.gz 0486.nii.gz 0487.nii.gz 0488.nii.gz 0489.nii.gz 0490.nii.gz 0491.nii.gz 0492.nii.gz 0493.nii.gz 0494.nii.gz 0495.nii.gz 0496.nii.gz 0497.nii.gz 0498.nii.gz 0499.nii.gz 0500.nii.gz 0501.nii.gz 0502.nii.gz 0503.nii.gz 0504.nii.gz 0505.nii.gz 0506.nii.gz 0507.nii.gz 0508.nii.gz 0509.nii.gz 0510.nii.gz 0511.nii.gz 0512.nii.gz 0513.nii.gz 0514.nii.gz 0515.nii.gz 0516.nii.gz 0517.nii.gz 0518.nii.gz 0519.nii.gz 0520.nii.gz 0521.nii.gz 0522.nii.gz 0523.nii.gz 0524.nii.gz 0525.nii.gz 0526.nii.gz 0527.nii.gz 0528.nii.gz 0529.nii.gz 0530.nii.gz 0531.nii.gz 0532.nii.gz 0533.nii.gz 0534.nii.gz 0535.nii.gz 0536.nii.gz 0537.nii.gz 0538.nii.gz 0539.nii.gz 0540.nii.gz 0541.nii.gz 0542.nii.gz 0543.nii.gz 0544.nii.gz 0545.nii.gz 0546.nii.gz 0547.nii.gz 0548.nii.gz 0549.nii.gz 0550.nii.gz 0551.nii.gz 0552.nii.gz 0553.nii.gz 0554.nii.gz 0555.nii.gz 0556.nii.gz 0557.nii.gz 0558.nii.gz 0559.nii.gz 0560.nii.gz 0561.nii.gz 0562.nii.gz 0563.nii.gz 0564.nii.gz 0565.nii.gz 0566.nii.gz 0567.nii.gz 0568.nii.gz 0569.nii.gz 0570.nii.gz 0571.nii.gz 0572.nii.gz 0573.nii.gz 0574.nii.gz 0575.nii.gz 0576.nii.gz 0577.nii.gz 0578.nii.gz 0579.nii.gz 0580.nii.gz 0581.nii.gz 0582.nii.gz 0583.nii.gz 0584.nii.gz 0585.nii.gz 0586.nii.gz 0587.nii.gz 0588.nii.gz 0589.nii.gz 0590.nii.gz 0591.nii.gz 0592.nii.gz 0593.nii.gz 0594.nii.gz 0595.nii.gz 0596.nii.gz 0597.nii.gz 0598.nii.gz 0599.nii.gz 0600.nii.gz 0601.nii.gz 0602.nii.gz 0603.nii.gz 0604.nii.gz 0605.nii.gz 0606.nii.gz 0607.nii.gz 0608.nii.gz 0609.nii.gz 0610.nii.gz 0611.nii.gz 0612.nii.gz 0613.nii.gz 0614.nii.gz 0615.nii.gz 0616.nii.gz 0617.nii.gz 0618.nii.gz 0619.nii.gz 0620.nii.gz 0621.nii.gz 0622.nii.gz 0623.nii.gz 0624.nii.gz 0625.nii.gz 0626.nii.gz 0627.nii.gz 0628.nii.gz 0629.nii.gz 0630.nii.gz 0631.nii.gz 0632.nii.gz 0633.nii.gz 0634.nii.gz 0635.nii.gz 0636.nii.gz 0637.nii.gz 0638.nii.gz 0639.nii.gz 0640.nii.gz 0641.nii.gz 
 rm 0*
 
 # PL
cd ${DATA}/${SUBJECT}/PL
 
fslsplit OXYDEC${SUBJECT}_RS_PL.nii.gz ./

fslmerge -t me_echo1.nii.gz 0000.nii.gz 0001.nii.gz 0002.nii.gz 0003.nii.gz 0004.nii.gz 0005.nii.gz 0006.nii.gz 0007.nii.gz 0008.nii.gz 0009.nii.gz 0010.nii.gz 0011.nii.gz 0012.nii.gz 0013.nii.gz 0014.nii.gz 0015.nii.gz 0016.nii.gz 0017.nii.gz 0018.nii.gz 0019.nii.gz 0020.nii.gz 0021.nii.gz 0022.nii.gz 0023.nii.gz 0024.nii.gz 0025.nii.gz 0026.nii.gz 0027.nii.gz 0028.nii.gz 0029.nii.gz 0030.nii.gz 0031.nii.gz 0032.nii.gz 0033.nii.gz 0034.nii.gz 0035.nii.gz 0036.nii.gz 0037.nii.gz 0038.nii.gz 0039.nii.gz 0040.nii.gz 0041.nii.gz 0042.nii.gz 0043.nii.gz 0044.nii.gz 0045.nii.gz 0046.nii.gz 0047.nii.gz 0048.nii.gz 0049.nii.gz 0050.nii.gz 0051.nii.gz 0052.nii.gz 0053.nii.gz 0054.nii.gz 0055.nii.gz 0056.nii.gz 0057.nii.gz 0058.nii.gz 0059.nii.gz 0060.nii.gz 0061.nii.gz 0062.nii.gz 0063.nii.gz 0064.nii.gz 0065.nii.gz 0066.nii.gz 0067.nii.gz 0068.nii.gz 0069.nii.gz 0070.nii.gz 0071.nii.gz 0072.nii.gz 0073.nii.gz 0074.nii.gz 0075.nii.gz 0076.nii.gz 0077.nii.gz 0078.nii.gz 0079.nii.gz 0080.nii.gz 0081.nii.gz 0082.nii.gz 0083.nii.gz 0084.nii.gz 0085.nii.gz 0086.nii.gz 0087.nii.gz 0088.nii.gz 0089.nii.gz 0090.nii.gz 0091.nii.gz 0092.nii.gz 0093.nii.gz 0094.nii.gz 0095.nii.gz 0096.nii.gz 0097.nii.gz 0098.nii.gz 0099.nii.gz 0100.nii.gz 0101.nii.gz 0102.nii.gz 0103.nii.gz 0104.nii.gz 0105.nii.gz 0106.nii.gz 0107.nii.gz 0108.nii.gz 0109.nii.gz 0110.nii.gz 0111.nii.gz 0112.nii.gz 0113.nii.gz 0114.nii.gz 0115.nii.gz 0116.nii.gz 0117.nii.gz 0118.nii.gz 0119.nii.gz 0120.nii.gz 0121.nii.gz 0122.nii.gz 0123.nii.gz 0124.nii.gz 0125.nii.gz 0126.nii.gz 0127.nii.gz 0128.nii.gz 0129.nii.gz 0130.nii.gz 0131.nii.gz 0132.nii.gz 0133.nii.gz 0134.nii.gz 0135.nii.gz 0136.nii.gz 0137.nii.gz 0138.nii.gz 0139.nii.gz 0140.nii.gz 0141.nii.gz 0142.nii.gz 0143.nii.gz 0144.nii.gz 0145.nii.gz 0146.nii.gz 0147.nii.gz 0148.nii.gz 0149.nii.gz 0150.nii.gz 0151.nii.gz 0152.nii.gz 0153.nii.gz 0154.nii.gz 0155.nii.gz 0156.nii.gz 0157.nii.gz 0158.nii.gz 0159.nii.gz 0160.nii.gz 0161.nii.gz 0162.nii.gz 0163.nii.gz 0164.nii.gz 0165.nii.gz 0166.nii.gz 0167.nii.gz 0168.nii.gz 0169.nii.gz 0170.nii.gz 0171.nii.gz 0172.nii.gz 0173.nii.gz 0174.nii.gz 0175.nii.gz 0176.nii.gz 0177.nii.gz 0178.nii.gz 0179.nii.gz 0180.nii.gz 0181.nii.gz 0182.nii.gz 0183.nii.gz 0184.nii.gz 0185.nii.gz 0186.nii.gz 0187.nii.gz 0188.nii.gz 0189.nii.gz 0190.nii.gz 0191.nii.gz 0192.nii.gz 0193.nii.gz 0194.nii.gz 0195.nii.gz 0196.nii.gz 0197.nii.gz 0198.nii.gz 0199.nii.gz 0200.nii.gz 0201.nii.gz 0202.nii.gz 0203.nii.gz 0204.nii.gz 0205.nii.gz 0206.nii.gz 0207.nii.gz 0208.nii.gz 0209.nii.gz 0210.nii.gz 0211.nii.gz 0212.nii.gz 0213.nii.gz 
 
fslmerge -t me_echo2.nii.gz 0214.nii.gz 0215.nii.gz 0216.nii.gz 0217.nii.gz 0218.nii.gz 0219.nii.gz 0220.nii.gz 0221.nii.gz 0222.nii.gz 0223.nii.gz 0224.nii.gz 0225.nii.gz 0226.nii.gz 0227.nii.gz 0228.nii.gz 0229.nii.gz 0230.nii.gz 0231.nii.gz 0232.nii.gz 0233.nii.gz 0234.nii.gz 0235.nii.gz 0236.nii.gz 0237.nii.gz 0238.nii.gz 0239.nii.gz 0240.nii.gz 0241.nii.gz 0242.nii.gz 0243.nii.gz 0244.nii.gz 0245.nii.gz 0246.nii.gz 0247.nii.gz 0248.nii.gz 0249.nii.gz 0250.nii.gz 0251.nii.gz 0252.nii.gz 0253.nii.gz 0254.nii.gz 0255.nii.gz 0256.nii.gz 0257.nii.gz 0258.nii.gz 0259.nii.gz 0260.nii.gz 0261.nii.gz 0262.nii.gz 0263.nii.gz 0264.nii.gz 0265.nii.gz 0266.nii.gz 0267.nii.gz 0268.nii.gz 0269.nii.gz 0270.nii.gz 0271.nii.gz 0272.nii.gz 0273.nii.gz 0274.nii.gz 0275.nii.gz 0276.nii.gz 0277.nii.gz 0278.nii.gz 0279.nii.gz 0280.nii.gz 0281.nii.gz 0282.nii.gz 0283.nii.gz 0284.nii.gz 0285.nii.gz 0286.nii.gz 0287.nii.gz 0288.nii.gz 0289.nii.gz 0290.nii.gz 0291.nii.gz 0292.nii.gz 0293.nii.gz 0294.nii.gz 0295.nii.gz 0296.nii.gz 0297.nii.gz 0298.nii.gz 0299.nii.gz 0300.nii.gz 0301.nii.gz 0302.nii.gz 0303.nii.gz 0304.nii.gz 0305.nii.gz 0306.nii.gz 0307.nii.gz 0308.nii.gz 0309.nii.gz 0310.nii.gz 0311.nii.gz 0312.nii.gz 0313.nii.gz 0314.nii.gz 0315.nii.gz 0316.nii.gz 0317.nii.gz 0318.nii.gz 0319.nii.gz 0320.nii.gz 0321.nii.gz 0322.nii.gz 0323.nii.gz 0324.nii.gz 0325.nii.gz 0326.nii.gz 0327.nii.gz 0328.nii.gz 0329.nii.gz 0330.nii.gz 0331.nii.gz 0332.nii.gz 0333.nii.gz 0334.nii.gz 0335.nii.gz 0336.nii.gz 0337.nii.gz 0338.nii.gz 0339.nii.gz 0340.nii.gz 0341.nii.gz 0342.nii.gz 0343.nii.gz 0344.nii.gz 0345.nii.gz 0346.nii.gz 0347.nii.gz 0348.nii.gz 0349.nii.gz 0350.nii.gz 0351.nii.gz 0352.nii.gz 0353.nii.gz 0354.nii.gz 0355.nii.gz 0356.nii.gz 0357.nii.gz 0358.nii.gz 0359.nii.gz 0360.nii.gz 0361.nii.gz 0362.nii.gz 0363.nii.gz 0364.nii.gz 0365.nii.gz 0366.nii.gz 0367.nii.gz 0368.nii.gz 0369.nii.gz 0370.nii.gz 0371.nii.gz 0372.nii.gz 0373.nii.gz 0374.nii.gz 0375.nii.gz 0376.nii.gz 0377.nii.gz 0378.nii.gz 0379.nii.gz 0380.nii.gz 0381.nii.gz 0382.nii.gz 0383.nii.gz 0384.nii.gz 0385.nii.gz 0386.nii.gz 0387.nii.gz 0388.nii.gz 0389.nii.gz 0390.nii.gz 0391.nii.gz 0392.nii.gz 0393.nii.gz 0394.nii.gz 0395.nii.gz 0396.nii.gz 0397.nii.gz 0398.nii.gz 0399.nii.gz 0400.nii.gz 0401.nii.gz 0402.nii.gz 0403.nii.gz 0404.nii.gz 0405.nii.gz 0406.nii.gz 0407.nii.gz 0408.nii.gz 0409.nii.gz 0410.nii.gz 0411.nii.gz 0412.nii.gz 0413.nii.gz 0414.nii.gz 0415.nii.gz 0416.nii.gz 0417.nii.gz 0418.nii.gz 0419.nii.gz 0420.nii.gz 0421.nii.gz 0422.nii.gz 0423.nii.gz 0424.nii.gz 0425.nii.gz 0426.nii.gz 0427.nii.gz 
 
fslmerge -t me_echo3.nii.gz 0428.nii.gz 0429.nii.gz 0430.nii.gz 0431.nii.gz 0432.nii.gz 0433.nii.gz 0434.nii.gz 0435.nii.gz 0436.nii.gz 0437.nii.gz 0438.nii.gz 0439.nii.gz 0440.nii.gz 0441.nii.gz 0442.nii.gz 0443.nii.gz 0444.nii.gz 0445.nii.gz 0446.nii.gz 0447.nii.gz 0448.nii.gz 0449.nii.gz 0450.nii.gz 0451.nii.gz 0452.nii.gz 0453.nii.gz 0454.nii.gz 0455.nii.gz 0456.nii.gz 0457.nii.gz 0458.nii.gz 0459.nii.gz 0460.nii.gz 0461.nii.gz 0462.nii.gz 0463.nii.gz 0464.nii.gz 0465.nii.gz 0466.nii.gz 0467.nii.gz 0468.nii.gz 0469.nii.gz 0470.nii.gz 0471.nii.gz 0472.nii.gz 0473.nii.gz 0474.nii.gz 0475.nii.gz 0476.nii.gz 0477.nii.gz 0478.nii.gz 0479.nii.gz 0480.nii.gz 0481.nii.gz 0482.nii.gz 0483.nii.gz 0484.nii.gz 0485.nii.gz 0486.nii.gz 0487.nii.gz 0488.nii.gz 0489.nii.gz 0490.nii.gz 0491.nii.gz 0492.nii.gz 0493.nii.gz 0494.nii.gz 0495.nii.gz 0496.nii.gz 0497.nii.gz 0498.nii.gz 0499.nii.gz 0500.nii.gz 0501.nii.gz 0502.nii.gz 0503.nii.gz 0504.nii.gz 0505.nii.gz 0506.nii.gz 0507.nii.gz 0508.nii.gz 0509.nii.gz 0510.nii.gz 0511.nii.gz 0512.nii.gz 0513.nii.gz 0514.nii.gz 0515.nii.gz 0516.nii.gz 0517.nii.gz 0518.nii.gz 0519.nii.gz 0520.nii.gz 0521.nii.gz 0522.nii.gz 0523.nii.gz 0524.nii.gz 0525.nii.gz 0526.nii.gz 0527.nii.gz 0528.nii.gz 0529.nii.gz 0530.nii.gz 0531.nii.gz 0532.nii.gz 0533.nii.gz 0534.nii.gz 0535.nii.gz 0536.nii.gz 0537.nii.gz 0538.nii.gz 0539.nii.gz 0540.nii.gz 0541.nii.gz 0542.nii.gz 0543.nii.gz 0544.nii.gz 0545.nii.gz 0546.nii.gz 0547.nii.gz 0548.nii.gz 0549.nii.gz 0550.nii.gz 0551.nii.gz 0552.nii.gz 0553.nii.gz 0554.nii.gz 0555.nii.gz 0556.nii.gz 0557.nii.gz 0558.nii.gz 0559.nii.gz 0560.nii.gz 0561.nii.gz 0562.nii.gz 0563.nii.gz 0564.nii.gz 0565.nii.gz 0566.nii.gz 0567.nii.gz 0568.nii.gz 0569.nii.gz 0570.nii.gz 0571.nii.gz 0572.nii.gz 0573.nii.gz 0574.nii.gz 0575.nii.gz 0576.nii.gz 0577.nii.gz 0578.nii.gz 0579.nii.gz 0580.nii.gz 0581.nii.gz 0582.nii.gz 0583.nii.gz 0584.nii.gz 0585.nii.gz 0586.nii.gz 0587.nii.gz 0588.nii.gz 0589.nii.gz 0590.nii.gz 0591.nii.gz 0592.nii.gz 0593.nii.gz 0594.nii.gz 0595.nii.gz 0596.nii.gz 0597.nii.gz 0598.nii.gz 0599.nii.gz 0600.nii.gz 0601.nii.gz 0602.nii.gz 0603.nii.gz 0604.nii.gz 0605.nii.gz 0606.nii.gz 0607.nii.gz 0608.nii.gz 0609.nii.gz 0610.nii.gz 0611.nii.gz 0612.nii.gz 0613.nii.gz 0614.nii.gz 0615.nii.gz 0616.nii.gz 0617.nii.gz 0618.nii.gz 0619.nii.gz 0620.nii.gz 0621.nii.gz 0622.nii.gz 0623.nii.gz 0624.nii.gz 0625.nii.gz 0626.nii.gz 0627.nii.gz 0628.nii.gz 0629.nii.gz 0630.nii.gz 0631.nii.gz 0632.nii.gz 0633.nii.gz 0634.nii.gz 0635.nii.gz 0636.nii.gz 0637.nii.gz 0638.nii.gz 0639.nii.gz 0640.nii.gz 0641.nii.gz 
 rm 0*