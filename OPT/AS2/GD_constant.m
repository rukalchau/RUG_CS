% f(x) = norm(Ax-b)/2
% Initialize the parameters and hyperparameters

rng(42);
A=rand(2,2);
b=rand(2,1);
learning_rate = 1/(max(eig(A.'*A)));
max_iterations = 100; % Maximum number of iterations
x = zeros(2,1);               % Initial guess for the parameter

% Gradient descent optimization
for iteration = 1:max_iterations
    % Compute the gradient of the cost function with respect to 'x'
    gradient = A.'*A *x  - A.'*b;
    
    % Update the parameter 'x' using the gradient and learning rate
    x = x - learning_rate * gradient;
    
    % Print the current iteration and the updated parameter
    g=sprintf('%d ', x);
    fprintf('Iteration %d: x = %s\n', iteration, g);
    
    % Check for convergence or stopping criteria (e.g., small gradient)
    if abs(gradient) < 1e-6
        break;
    end
end

fprintf('Optimal solution:  = %f\n', x);
