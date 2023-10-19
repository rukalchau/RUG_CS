% Define the file name
FileName = 'random_matrices.xlsx';
% Get the sheets in the excel file
Sheets = sheetnames(FileName);

% Generate the variable with the matrices
myMatrices = struct;
% Read the matrices and store it in the struct
for n=1:length(Sheets)
    % Get evaluated sheet
    eval_sheet = Sheets{n};
    % Get the matrix
    values = readmatrix(FileName,'Sheet',eval_sheet);
    % Create a field in the struct and store the matrix there
    myMatrices.(eval_sheet) = values;
end

% Print the variable
myMatrices