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

% Blur Image and add noise
rng(10); % Seed for reproducibility
n = normrnd(0, 0.5, size(X_ref));
X_blur = R(X_ref) + n;

% Show blurry image
subplot(1, 3, 2);
imshow(X_blur, [0, 255], 'Colormap', gray);
title('Blurred Image');


%PRIMAL DUAL
%{
% Experiment with different parameters
lambda_pd = [3]; % Adjust as needed
sigma = 1 / (lambda_pd * 8);
num_iterations_values = [70]

% Primal-Dual Deblurring
X_deblur_pd = primal_dual_deblur(X_blur, lambda_pd, sigma, R, num_iteration_values);

% Show Primal-Dual deblurred image
%figure;
subplot(1, 3, 3);
imshow(X_deblur_pd, [0, 255], 'Colormap', gray);
title('Improved Primal-Dual Deblurred Image');
%}

%{
% Experiment with different lambda and iteration values
lambda_values = [1, 2, 3, 4, 5];
num_iteration_values = [50, 60, 70, 80, 90, 100];

figure;


for i = 1:length(lambda_values)
    lambda_pd = lambda_values(i);
    
    for j = 1:length(num_iteration_values)
        num_iterations = num_iteration_values(j);
        sigma = 1 / (lambda_pd * 8);

        % Primal-Dual Deblurring
        X_deblur_pd = primal_dual_deblur(X_blur, lambda_pd, sigma, R, num_iterations);

        % Show Primal-Dual deblurred image
        subplot(length(lambda_values), length(num_iteration_values), (i - 1) * length(num_iteration_values) + j);
        imshow(X_deblur_pd, [0, 255], 'Colormap', gray);
        title(['\lambda = ', num2str(lambda_pd), ', Iterations = ', num2str(num_iterations)]);
    end
end
%}

%{
for i = 1:length(lambda_values)
    lambda_pd = lambda_values(i);
    
    for j = 1:length(num_iteration_values)
        num_iterations = num_iteration_values(j);
        sigma = 1 / (lambda_pd * 8);

        % Primal-Dual Deblurring
        X_deblur_pd = primal_dual_deblur(X_blur, lambda_pd, sigma, R, num_iterations);

        % Show Primal-Dual deblurred image
        subplot(length(lambda_values), length(num_iteration_values), (i - 1) * length(num_iteration_values) + j);
        imshow(X_deblur_pd, [0, 255], 'Colormap', gray);
        title(['\lambda = ', num2str(lambda_pd), ', Iterations = ', num2str(num_iterations)]);
    end
end
%}

%{
%ADMM
% Call ADMM function to deblur the image
    lambda = 0.1; % You need to test different values of lambda
    rho = 1; % Penalty parameter
    max_iterations = 100;

    X_deblurred = admm_deblur(X_blur, R, lambda, rho, max_iterations);

    % Show deblurred image
    subplot(1, 3, 3);
    imshow(X_deblurred, [0, 255], 'Colormap', gray);
    title('Deblurred Image');
%}

%{
% Loop over different lambda and max_iterations values
lambda_values = [1, 100, 500, 1000]; % Add more values as needed
iteration_values = [1]; % Add more values as needed
rho = 1; % Penalty parameter

for lambda = lambda_values
    for max_iterations = iteration_values
        fprintf('Lambda: %.2f, Iterations: %d\n', lambda, max_iterations);

        % Create a new figure for each iteration
        figure;

        % Call ADMM function to deblur the image
        %X_deblurred = admm_deblur(X_blur, R, lambda, rho, max_iterations);
        X_deblurred = admm_deblur(X_blur, R, lambda, rho, max_iterations);

        % Show deblurred image
        imshow(X_deblurred, [0, 255], 'Colormap', gray);
        title(['Deblurred Image - Lambda: ', num2str(lambda), ', Iterations: ', num2str(max_iterations)]);

        % Ensure the figure is updated
        drawnow;
        pause(2); % Add a pause to observe the result (optional)
    end
end
%}

% Loop over different lambda, rho, and max_iterations values
lambda_values = [0.0001]; % Add more values as needed
rho_values = [0.0001]; % Add more values as needed
rho = 1;
num_iteration_values = [1, 5, 100, 500];
%{
for lambda = lambda_values
    for rho = rho_values
        fprintf('Lambda: %.2f, Rho: %.2f\n', lambda, rho);

        % Call ADMM function to deblur the image
        X_deblurred = admm_deblur(X_blur, R, lambda, rho, 1);

        % Create a new figure for each combination of lambda and rho
        figure;

        % Show deblurred image
        imshow(X_deblurred, [0, 255], 'Colormap', gray);
        title(['Deblurred Image - Lambda: ', num2str(lambda), ', Rho: ', num2str(rho)]);

        % Ensure the figure is updated
        drawnow;
        pause(2); % Add a pause to observe the result (optional)
    end
end
%}
%{
%LAMBDAITERATIONS
for i = 1:length(lambda_values)
    for k = 1:length(num_iteration_values)
        lambda = lambda_values(i);
        num_iterations = num_iteration_values(k);

        fprintf('Lambda: %.2f, Iterations: %d\n', lambda, num_iterations);

        % Call ADMM function to deblur the image
        X_deblurred = admm_deblur_variational(X_blur, lambda_values(i), rho, 1);

        % Create a new figure for each combination of lambda and number_of_iterations
        subplot(length(lambda_values), length(num_iteration_values), (i - 1) * length(num_iteration_values) + k); % Adjust the subplot indexing
        imshow(X_deblurred, [0, 255], 'Colormap', gray);
        title(['\lambda = ', num2str(lambda), ', Iterations = ', num2str(num_iterations)]);

        % Ensure the figure is updated
        drawnow;
        pause(2); % Add a pause to observe the result (optional)
    end
end
%}

%LAMBDARHO
for i = 1:length(lambda_values)
    for j = 1:length(rho_values)
        fprintf('Lambda: %.2f, Rho: %.2f\n', lambda_values(i), rho_values(j));

        % Call ADMM function to deblur the image
        %X_deblurred = admm_deblur(X_blur, R, lambda_values(i), rho_values(j), 1);
        X_deblurred = admm_deblur_variational(X_blur, lambda_values(i), rho_values(j), 1);

        % Create a new figure for each combination of lambda and rho
        %subplot(length(lambda_values), length(rho_values), (i - 1) * length(rho_values) + j); % Adjust the subplot indexing
        %imshow(X_deblurred, [0, 255], 'Colormap', gray);
        %title(['\lambda = ', num2str(lambda_values(i)), ', Rho = ', num2str(rho_values(j))]);

        subplot(1, 3, 3);
        imshow(X_deblurred, [0, 255], 'Colormap', gray);
        title('Improved ADMM Deblurred Image');

        % Ensure the figure is updated
        drawnow;
        pause(2); % Add a pause to observe the result (optional)
    end
end
%}

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