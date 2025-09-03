%% Monte Carlo vs exact for the prisoners & boxes puzzle

% Parameters
N = 200;        % how many even n values to test (n = 2,4,...,2N)
trials = 1e4;   % Monte Carlo trials per n

% Preallocate result arrays
p_loop = zeros(N,1);    % Estimates for loop strategy
p_exact = zeros(N,1);   % Exact

% Main loop over even n
for i = 1:N
    n = 2*i;
    p_loop(i) = prisoners_sim(n, trials);
    p_exact(i) = 1 - sum(1./((i+1):n));
end

% Random-guess baseline
p_rand = 2.^-(2:2:2*N);

% Asymptotic limit
p_limit = (1 - log(2)) * ones(N,1);

% Plot
nvals = 2*(1:N);
figure('Name','Prisoners & Boxes: simulation vs exact'); hold on; grid on; box on;
plot(nvals, p_exact, '-',  'LineWidth', 1.5);
plot(nvals, p_limit, '--', 'LineWidth', 1);
plot(nvals, p_loop, 'k.', 'MarkerSize', 4);
legend('Exact', 'Limit: 1 - ln 2', 'Monte Carlo', 'Location','northeast');
xlabel('n (prisoners)'); ylabel('Success probability');
title('Prisoners & Loops: simulation vs exact and asymptotic');

% Results at n=100 (i=50)
fprintf('Check n=100: exact=%.6f, MC≈%.6f, random=%.2e\n', ...
    p_exact(50), p_loop(50), 2^-100);