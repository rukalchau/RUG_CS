function X_deblurred = admm_deblur(X_blur, R, lambda, rho, max_iterations)
    % Initialize variables
    X = X_blur; % Initialize X with the blurred image
    Y = grad(X); % Initialize Y with the gradient of X
    Z = zeros(size(Y)); % Initialize Z

    % ADMM iterations
    for iter = 1:max_iterations
        % Update X
        X = update_X(X, Y, Z, lambda, rho, R);

        % Update Y
        Y = update_Y(Y, grad(X), Z, rho);

        % Update Z
        Z = Z + rho * (grad(X) - Y);
    end

    X_deblurred = X;
end

function X = update_X(X, Y, Z, lambda, rho, R)
    A = lambda * R(X) + rho * grad_T(Y - Z);
    B = lambda * ones(size(X)) + rho;
    X = A ./ B;
end

function Y = update_Y(Y, G, Z, rho)
    Y = soft_threshold(G + Z, 1/rho);
end

function result = soft_threshold(X, lambda)
    result = sign(X) .* max(0, abs(X) - lambda);
end