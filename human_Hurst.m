% Add path to the script directory
addpath('/Users/Ayesha/Documents/MATLAB/toolbox/nonfractal-master/m');

% Set current directory to where the files are located
cd('/Users/Ayesha/Documents/MATLAB/final_timeseries/');

% List of Hs= 
Highs = {'01_H' '02_H' '03_H' '05_H' '06_H' '07_H' '08_H' '09_H' '10_H' '11_H' '12_H' '13_H' '15_H' '17_H' '18_H' '19_H' '20_H' '21_H' '22_H' '23_H' '24_H' '25_H' '26_H' '27_H'};


lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(Highs)
    % Construct filename for the current subject and dose
    filename = sprintf('DKA_ts_%s.txt', Highs{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_H(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end

% List of Ms= 
Meds = {'01_M' '02_M' '03_M' '05_M' '06_M' '07_M' '08_M' '09_M' '10_M' '11_M' '12_M' '13_M' '15_M' '17_M' '18_M' '19_M' '20_M' '21_M' '22_M' '23_M' '24_M' '25_M' '26_M' '27_M'};


lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(Meds)
    % Construct filename for the current subject and dose
    filename = sprintf('DKA_ts_%s.txt', Meds{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_M(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end

% List of Ls= 
Lows = {'01_L' '02_L' '03_L' '05_L' '06_L' '07_L' '08_L' '09_L' '10_L' '11_L' '12_L' '13_L' '15_L' '17_L' '18_L' '19_L' '20_L' '21_L' '22_L' '23_L' '24_L' '25_L' '26_L' '27_L'};


lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(Lows)
    % Construct filename for the current subject and dose
    filename = sprintf('DKA_ts_%s.txt', Lows{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_L(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end

% List of PLs= 
Placebos = {'01_PL' '02_PL' '03_PL' '05_PL' '06_PL' '07_PL' '08_PL' '09_PL' '10_PL' '11_PL' '12_PL' '13_PL' '15_PL' '17_PL' '18_PL' '19_PL' '20_PL' '21_PL' '22_PL' '23_PL' '24_PL' '25_PL' '26_PL' '27_PL'};


lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(Placebos)
    % Construct filename for the current subject and dose
    filename = sprintf('DKA_ts_%s.txt', Placebos{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_PL(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end