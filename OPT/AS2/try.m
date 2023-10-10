% Set the random number generator seed for reproducibility
rng(42);

% Initialize variables
upper_limit = 7;
num_matrices = 3; % Number of matrices to generate
matrix_sizes = 2.^(1:7); % Matrix sizes ranging from 2^1 to 2^7

% Generate random square matrices
random_matrices = cell(num_matrices, upper_limit);

% Loop to generate matrices of different sizes
for i = 1:upper_limit
    M = matrix_sizes(i); % Rows
    N = matrix_sizes(i); % Columns
    for j = 1:num_matrices
        A = rand(M, N); % Generate a random MxN matrix with values between 0 and 1
        random_matrices{j,i} = A; % Store the generated matrix
    end
end

% Display the generated matrices
for i = 1:upper_limit
    for j = 1:num_matrices
        disp(['k = ', num2str(i), ' || matrix = ', num2str(j)]);
        disp(random_matrices{j,i});
    end
end

% Export matrices to an Excel file
file_name = 'random_matrices.xlsx';

for i = 1:upper_limit
    for j = 1:num_matrices
        M = random_matrices{j,i}; % Get the matrix
        sheet_name = ['Matrix_k', num2str(i), '_matrix', num2str(j)]; % Create a unique sheet name for each matrix
        xlswrite(file_name, M, sheet_name); % Write matrix to Excel
    end
end

fprintf('Matrices exported to %s\n', file_name);
