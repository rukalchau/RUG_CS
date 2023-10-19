rng(42);
A=rand(2,2);
b=rand(2,1);
x0=rand(2,1);
epsilon=10.^(-4);
max_iterations=10.^7;
gradient_descent_constant(A,b,x0,epsilon,max_iterations);


function [x, converged, num_iterations] = gradient_descent_constant(A, b, x0, epsilon, max_iterations)
    x=x0;
    learning_rate = 1/(max(eig(A.'*A)));
    converged=false;
    for iteration = 1:max_iterations
        gradient = A.'*A *x  - A.'*b;
        x = x - learning_rate * gradient;
        num_iterations=iteration;
        g=sprintf('%d ', x);
        fprintf('Iteration %d: x = %s\n', iteration, g);
        if abs(gradient) < epsilon
            converged=true;
            break;
        end
    end
end


