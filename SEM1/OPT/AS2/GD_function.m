function optimal_w = gradientDescent(cost_function, initial_w, learning_rate, max_iterations, tolerance)
    % Gradient Descent Optimization
    % cost_function: A function handle for the cost (loss) function
    % initial_w: Initial guess for the parameter to be optimized
    % learning_rate: The learning rate for gradient descent
    % max_iterations: Maximum number of iterations
    % tolerance: A small value to check for convergence

    w = initial_w;

    for iteration = 1:max_iterations
        % Compute the gradient of the cost function at the current w
        gradient = gradientNumerical(cost_function, w);

        % Update the parameter 'w' using the gradient and learning rate
        w = w - learning_rate * gradient;

        % Print the current iteration and the updated parameter
        fprintf('Iteration %d: w = %f\n', iteration, w);

        % Check for convergence
        if norm(gradient) < tolerance
            break;
        end
    end

    optimal_w = w;
    fprintf('Optimal solution: w = %f\n', optimal_w);
end

function grad = gradientNumerical(cost_function, w)
    epsilon = 1e-6;
    grad = (cost_function(w + epsilon) - cost_function(w - epsilon)) / (2 * epsilon);
end
