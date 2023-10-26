rng(42);
k=2;
A=rand(2^k,2^k);
b=rand(2^k,1);
x0=rand(2^k,1);
epsilon=10.^(-4);
max_iterations=10.^7;   
gradient_descent_exact_line(A,b,x0,epsilon,max_iterations);

function [x, converged, num_iterations,residuals] = gradient_descent_exact_line(A, b, x0, epsilon, max_iterations)
    x=x0;
    converged=false;
    residuals = zeros(length(x0), max_iterations);

    for iteration = 1:max_iterations
        r = A*x -b;

        if abs(norm(r)) < epsilon
            g=sprintf('%d ', x);
            fprintf('Iteration %d: x = %s\n', iteration, g);
            converged=true;
            break;
        end

        gd = grad(x,A,b);
        learning_rate = (gd.'*gd)/(gd.'*(A.')*A*gd);
        x=x-learning_rate*grad(x,A,b);
        num_iterations=iteration;
        residuals(:,  num_iterations+ 1) = gd;

        if mod(iteration,1000)==0
            g=sprintf('%d ', x);
            fprintf('Iteration %d: x = %s\n', iteration, g);
        end
      


    end
end

function [y] = f(x,A,b)
    y=(norm(A*x-b)).^2/2;
end

function [g] = grad(x,A,b)
    g=A.'*A *x  - A.'*b;
end
