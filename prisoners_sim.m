function p_win = prisoners_sim(n, trials)
% PRISONERS_SIM  Monte Carlo for the prisoners & boxes puzzle.
% Returns the probability of winning with the loop strategy.
% If called without output, comparse the loop strategy with
% random guessing.

assert(mod(n,2)==0, 'n must be even.');
if nargin < 2, trials = 1e3; end

wins = 0;

for t = 1:trials
    perm = randperm(n);  % box i contains label perm(i)

    % loop strategy succeeds iff there is no cycle with length > n/2
    if ~cycle_longer_than(perm,n/2)
        wins = wins + 1;
    end

end

p_win = wins / trials;

% print results
if nargout == 0
    fprintf('n=%d, trials=%d\n', n, trials);
    fprintf('Loop strategy:   %.6f\n', p_win);
    fprintf('Random strategy: %.6e\n', 0.5^n);
    fprintf('Improvement: ~%.0f× over 0.5^n\n', p_win / (0.5^n));
end
end

%% cycle_longer_than
function isLonger = cycle_longer_than(perm, L)
% Returns 'true', if there is a cycle longer than 'L' in the permutation
% 'perm', otherwise returns 'false'.

n = numel(perm);
seen = false(1,n);
isLonger = false;
for i = 1:n
    if ~seen(i)
        j = i; len = 0;
        while ~seen(j)
            seen(j) = true;
            j = perm(j);
            len = len + 1;
        end
        if len > L
            isLonger = true;
            return;
        end
        if sum(seen) > n-L
            return;
        end
    end
end
end