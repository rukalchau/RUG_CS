clear all;
% Setting parameters
epsilon = 1e-4;
max_iterations = 1e7;
alpha = 0.1;%method 7
use_optimal_step_size = true;%method 7 and 8
c1 = 1e-4;             % Wolfe condition constant c1
c2 = 0.9;              % Wolfe condition constant c2
max_linesearch_iterations = 200;  % Increase the maximum line search iterations


% Initializing variables to store average iterations
num_matrices = 3;
upper_limit = 7;
average_iterations_gradient_descent = zeros(upper_limit, 1);

% Loading the Excel file containing the matrices
excel_file = 'random_matrices.xlsx';

% Looping over matrix sizes (2^k for k = 1 to 7)
for k = 1:upper_limit
    %matrix_size = 2^k;
    total_iterations = 0;
    
    % Performing Gradient Descent for each matrix size and calculate the average number of iterations
    for j = 1:num_matrices
        % Load the matrix from the Excel file
        sheet_name = ['Matrix_k', num2str(k), '_matrix', num2str(j)];
        matrix = xlsread(excel_file, sheet_name);
        matrix_size = size(matrix, 1);
        % Perform Gradient Descent
        A = matrix;  % Use the loaded matrix as A
        b = rand(matrix_size, 1);  % Generate a random b for each matrix
        x0 = zeros(matrix_size, 1);
        
        %actual function calls to solve the methods
        %[x, converged, iterations, residuals] = gradient_descent_constant(A, b, x0, epsilon, max_iterations);
        
        %[x, converged, iterations, residuals] = nesterov_gradient_descent(A, b, x0, epsilon, max_iterations, alpha);
        %[x, converged, iterations, residuals] = nesterov_gradient_descent2(A, b, x0, epsilon, max_iterations, alpha, use_optimal_step_size);
        %[x, converged, iterations] = nesterov_gradient_descent3(A, b, x0, epsilon, max_iterations, alpha, use_optimal_step_size);
        %[x, converged, iterations] = nesterov_gradient_descent4(A, b, x0, epsilon, max_iterations, alpha, use_optimal_step_size);
        %[x, converged, iterations] = nesterov_gradient_descent5(A, b, x0, epsilon, max_iterations, alpha, use_optimal_step_size)
        [x, converged, iterations, residuals] = nesterov_gradient_descent6(A, b, x0, epsilon, max_iterations, alpha, use_optimal_step_size);
        
        %[x, converged, iterations, residuals] = stochastic_gradient_descent(A, b, x0, epsilon, max_iterations, alpha)
        %[x, converged, iterations, residuals] = stochastic_gradient_descent2(A, b, x0, epsilon, max_iterations);
        
        %[x, converged, iterations, past_iterates] = polyaksHeavyBall(A, b, x0, epsilon, max_iterations);
        %[x, converged, iterations, past_iterates] = polyaksHeavyBall0(A, b, x0, epsilon, max_iterations);
        %[x, converged, iterations, past_iterates] = bfgsQuasiNewton(A, b, x0, epsilon, max_iterations, c1, c2);
        %[x, converged, iterations, past_iterates] = bfgsObjectiveFunction(A, b, x0, epsilon, max_iterations, c1, c2);
        %[x, converged, iterations, past_iterates, fval] = bfgs_quasi_newton2(A, b, x0, epsilon, max_iterations);
        %[x, converged, iterations, past_iterates, fval] = heavy_ball_accelerated_gradient_descent2(A, b, x0, epsilon, max_iterations);
        
        if converged
            total_iterations = total_iterations + iterations;
        else
            total_iterations = total_iterations + max_iterations;
        end
    end
    
    % Calculating average iterations for the current matrix size
    average_iterations_gradient_descent(k) = total_iterations / num_matrices;
end

% Plot the results on a log-log scale
%{
figure;
loglog(2.^(1:upper_limit), average_iterations_gradient_descent, '-o', 'LineWidth', 2);
%title('Gradient Descent: Average Iterations vs. Matrix Size (k)');
%title('Nesterov Momentum to Gradient Descent: Average Iterations vs. Matrix Size (k)');
%title('Stochastic Gradient Descent: Average Iterations vs. Matrix Size (k)');
%title('BFGS Quasi Newton: Average Iterations vs. Matrix Size (k)');
title('Heavy Ball: Average Iterations vs. Matrix Size (k)');
xlabel('Matrix Size (2^k)');
ylabel('Average Iterations');
grid on;
%}


% Plot the results on a log-log scale
figure;
loglog(2.^(1:upper_limit), average_iterations_gradient_descent, '-o', 'LineWidth', 2);

% Specify the labels for the legend
legend_labels = {'Nesterov Momentum'};

% Add legend with the specified labels
legend(legend_labels, 'Location', 'NorthWest');

% Add title, axis labels, and grid
%title('BFGS Quasi Newton: Average Iterations vs. Matrix Size (k)');
title('Nesterov Momentum: Average Iterations vs. Matrix Size (k)');
xlabel('Matrix Size (2^k)');
ylabel('Average Iterations');
grid on;
