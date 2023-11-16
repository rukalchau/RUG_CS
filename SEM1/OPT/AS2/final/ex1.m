rng(42);
k=2;
A=rand(2^k,2^k);
b=rand(2^k,1);
x0=rand(2^k,1);
epsilon=10.^(-4);
max_iterations=10.^7;
gradient_descent_constant(A,b,x0,epsilon,max_iterations);


function [x, converged, num_iterations ,residuals] = gradient_descent_constant(A, b, x0, epsilon, max_iterations)
    x=x0;
    learning_rate = 1/(max(eig(A.'*A)));
    converged=false;
    residuals = zeros(length(x0), max_iterations);



    for iteration = 1:max_iterations
        gradient = A.'*A *x  - A.'*b;

        if abs(gradient) < epsilon
            g=sprintf('%d ', x);
            fprintf('Iteration %d: x = %s\n', iteration, g);
            converged=true;
            break;
        end

        x = x - learning_rate * gradient;
        num_iterations=iteration;
        residuals(:,  num_iterations+ 1) = gradient;


    end
end


