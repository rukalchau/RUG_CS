rng(42);
A=rand(2,2);
b=rand(2,1);
x0=rand(2,1);
epsilon=10.^(-4);
max_iterations=10.^7;
gradient_descent_constant_armijo(A,b,x0,epsilon,max_iterations);




function [x, converged, num_iterations] = gradient_descent_constant_armijo(A, b, x0, epsilon, max_iterations)
    x=x0;
    learning_rate = 3/(max(eig(A.'*A)));
    % disp(learning_rate);
    beta=1/2;
    sigma=10^(-4);
    converged=false;
    

    for iteration = 1:max_iterations
        gradient = grad(x,A,b);

        if abs(gradient) < epsilon
            g=sprintf('%d ', x);
            fprintf('Iteration %d: x = %s\n', iteration, g);
            converged=true;
            break;
        end
        % disp(f(x-learning_rate * gradient,A,b));
        % disp((f(x,A,b)-learning_rate*sigma*norm(gradient)^2));
        while f(x-learning_rate * gradient,A,b) > (f(x,A,b)-learning_rate*sigma*norm(gradient)^2)
            learning_rate = learning_rate * beta;
            disp(learning_rate);
            break;
        end

        x=x-learning_rate*gradient;
        num_iterations=iteration;
        % g=sprintf('%d ', x);
        % fprintf('Iteration %d: x = %s\n', iteration, g);


    end
end

function [y] = f(x,A,b)
    y=(norm(A*x-b)).^2/2;
end

function [g] = grad(x,A,b)
    g=A.'*A *x  - A.'*b;
end
