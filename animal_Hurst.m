% Add path to the script directory
addpath('/Users/Ayesha/Documents/MATLAB/toolbox/nonfractal-master/m');

% Set current directory to where the files are located
cd('/Users/Ayesha/Documents/MATLAB/final_Atimeseries/');

% List of Ss= 
Salines = {'NRX1052b_S' 'NRX1052c_S' 'NRX1142c_S' 'NRX1151b_S' 'NRX1171a_S' 'NRX1181a_S' 'NRX1181b_S' 'NRX1201a_S' 'NRX1241b_S' 'NRX1241c_S' 'NRX1301c_S'};

lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(Salines)
    % Construct filename for the current subject and dose
    filename = sprintf('Allen_ts_%s.txt', Salines{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_S(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end

% List of Ms= 
OTs = {'NRX1052b_O' 'NRX1052c_O' 'NRX1142c_O' 'NRX1151b_O' 'NRX1171a_O' 'NRX1181a_O' 'NRX1181b_O' 'NRX1201a_O' 'NRX1241b_O' 'NRX1241c_O' 'NRX1301c_O'};


lb = [-0.5, 0];
ub = [1.5, 10];

% Loop through each ID
for s = 1:length(OTs)
    % Construct filename for the current subject and dose
    filename = sprintf('Allen_ts_%s.txt', OTs{s});
    
    % Check if the file exists
    if exist(filename, 'file') == 2
        % Import data from the file
        ts = importdata(filename);
        
        % Execute the script with the imported data
        [H, nfcor, fcor] = bfn_mfin_ml(ts, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        
        % Store the result
        Hurst_O(s, :) = H;
    else
        disp(['File not found: ' filename]);
    end
end

