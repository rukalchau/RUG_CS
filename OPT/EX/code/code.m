% Load the image, Resize it, Grayscale it, and convert it to an array
img = imread('cat.jpg','jpg');
img = imresize(img, [256, 256]);
X_ref = rgb2gray(img); % Assuming 'cat.jpg' is an RGB image

% Convert to float32
X_ref = single(X_ref);

% Show original image
figure;
subplot(1, 3, 1);
imshow(X_ref, [0, 255], 'Colormap', gray);
title('Original Image');

% Retrieve blurring and adjoint of blurring operators
R = blackbox(X_ref);

% Blur Image and add no ise
rng(10); % Seed for reproducibility
n = normrnd(0, 0.5, size(X_ref));
X_blur = R(X_ref) + n;

% Show blurry image
subplot(1, 3, 2);
imshow(X_blur, [0, 255], 'Colormap', gray);
title('Blurred Image');

% Primal-Dual Deblurring
lambda_pd = 5;
num_iterations_pd = 100;
X_deblur_pd = primal_dual_deblur(X_blur, R, lambda_pd, num_iterations_pd);

% Show Primal-Dual deblurred image
subplot(1, 3, 3);
imshow(X_deblur_pd, [0, 255], 'Colormap', gray);
title('Primal-Dual Deblurred Image');

% ADMM Deblurring
lambda_admm = 2.5;
num_iterations_admm = 250;
X_deblur_admm = admm_deblur(X_blur, R, lambda_admm, num_iterations_admm);

% Display ADMM Deblurred Results
figure;
subplot(1, 3, 1); imshow(X_ref, [0, 255], 'Colormap', gray); title('Original Image');
subplot(1, 3, 2); imshow(X_blur, [0, 255], 'Colormap', gray); title('Blurred Image');
subplot(1, 3, 3); imshow(X_deblur_admm, [0, 255], 'Colormap', gray); title('ADMM Deblurred Image');

% The following are the Primal-Dual and ADMM functions (as provided before)

function X_deblur_pd = primal_dual_deblur(X_blur, R, lambda, num_iterations)
    % Parameters
    sigma = 1 / sqrt(8);
    tau = 1 / sqrt(8);
    %theta = 1;

    % Initialize variables
    X_deblur_pd = X_blur;
    P = zeros(2, size(X_blur, 1), size(X_blur, 2));
    div_P = zeros(size(X_blur));

    % Primal-Dual Iterations
    for k = 1:num_iterations
        % Primal update
        X_deblur_pd = X_deblur_pd + sigma * R(div_P);

        % Dual update
       % P = proximal_l1(P + tau * grad(X_deblur_pd), lambda * tau);

        % Divergence update
        div_P = grad_T(P);

        %Dual update
        P = P + tau * grad(X_deblur_pd);

        % Proximal operator for the dual variable
        P = proximal_l1(P, lambda * tau);

        % Update parameters
        %theta_next = 1 / sqrt(1 + 2 * tau * theta^2);
        %tau = tau * theta_next / theta;
        %sigma = sigma / theta_next;
        %theta = theta_next;
    end
end

function prox = proximal_l1(Y, alpha)
    % Soft thresholding proximal operator
    %prox = max(0, 1 - alpha ./ sqrt(sum(Y.^2, 1))) .* Y;
    normY = sqrt(sum(Y.^2, 1));
    scaling_factor = max(0, 1 - alpha ./ normY);
    prox = bsxfun(@times, Y, scaling_factor ./ (1 + alpha ./ normY));
end


function X_deblur_admm = admm_deblur(X_blur, R, lambda, num_iterations)
    % Parameters
    rho = 1;

    % Initialize variables
    [m, n] = size(X_blur);
    X_deblur_admm = X_blur;
    Y = grad(X_deblur_admm);
    Lagrange = zeros(size(Y));

    % ADMM Iterations
    for k = 1:num_iterations
        % X update
        X_deblur_admm = update_X(X_blur, R, Y, Lagrange, rho, lambda);

        % Y update
        Y = update_Y(grad(X_deblur_admm)+ Lagrange / rho, lambda / rho);

        % Lagrange update
        Lagrange = Lagrange + rho * (grad(X_deblur_admm) - Y);
    end
end

%Update X in ADMM
function X_updated = update_X(X_blur, R, Y, Lagrange, rho, lambda)
    A = rho * grad_T(Y - Lagrange);
    B = lambda * R(X_blur);
    X_updated = (A + B) / (rho + lambda);
end

%Update Y in ADMM
function Y_updated = update_Y(Y, alpha)
      normY = sqrt(sum(Y.^2, 1));
      scaling_factor = max(0, 1 - alpha ./ normY);
    Y_updated = bsxfun(@times, Y, scaling_factor ./ normY);
end

% Black Box, Not Important how it works
function R = blackbox(X_ref)
    s = 4;
    size_filter = 9;
    PSF = zeros(size_filter, size_filter);
    for i = 1:size_filter
        for j = 1:size_filter
            PSF(i, j) = exp(-0.5*((i-4)/s)^2 - 0.5*((j-4)/s)^2);
        end
    end
    PSF = PSF / sum(PSF(:));

    function Ps = dctshift(PSF, center)
        [m, n] = size(PSF);
        i = center(1);
        j = center(2);
        l = min([i, m-i+1, j, n-j+1]);
        PP = PSF(i-l+1:i+l+1, j-l+1:j+l+1);
        Z1 = diag(ones(l+1,1), l);
        Z2 = diag(ones(l,1), l+1);
        PP = Z1 * PP * Z1' + Z1 * PP * Z2' + Z2 * PP * Z1' + Z2 * PP * Z2';
        Ps = zeros(size(PSF));
        Ps(1:2*l+1, 1:2*l+1) = PP;
    end

    dct2 = @(a) dct(dct(a, [], 1), [], 2);
    idct2 = @(a) idct(idct(a, [], 1), [], 2);

    Pbig = zeros(size(X_ref));
    Pbig(1:size_filter, 1:size_filter) = PSF;

    e1 = zeros(size(X_ref));
    e1(1,1) = 1;

    S = dct2(dctshift(Pbig, [4, 4])) ./ dct2(e1);

    R = @(X) idct2(S .* dct2(X));
end

% The Discrete Gradient Linear Operator
% grad: R^{256x256} -> R^{2x256x256}
function G = grad(X)
    [m, n] = size(X);
    G = zeros(2, m, n);
    G(1, :, 1:end-1) = X(:, 2:end) - X(:, 1:end-1); % Horizontal Direction
    G(2, 1:end-1, :) = X(2:end, :) - X(1:end-1, :); % Vertical Direction
end

% The Adjoint of the Discrete Gradient Linear Operator, the Discrete Divergence
% grad_T: R^{2x256x256} -> R^{256x256}
function G_T = grad_T(Y)
    [c, m, n] = size(Y);
    G_T = zeros(m, n);
    G_T(:, 1:end-1) = G_T(:, 1:end-1) + squeeze(Y(1, :, 1:end-1)); % Corresponds to c[0]
    G_T(:, 2:end) = G_T(:, 2:end) - squeeze(Y(1, :, 2:end)); % Corresponds to c[0]
    G_T(1:end-1, :) = G_T(1:end-1, :) + squeeze(Y(2, 1:end-1, :)); % Corresponds to c[1]
    G_T(2:end, :) = G_T(2:end, :) - squeeze(Y(2, 2:end, :)); % Corresponds to c[1]
end