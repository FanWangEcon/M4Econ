%% Find Value just below or above each element of ar_a from ar_grid.
% a vector of grid points, find for each element of ar_a the element of
% ar_grid that is just above or just below.
%
% # *ar_a* should be a sorted negative array
% # *ar_grid* sorts from lowest to highest, negative array of grid points
%

% a sorted array of say asset
ar_a = -sort(rand([10,1])*13)
% each point on ar_a, what is element of ar_grid that is just below and above
ar_grid = [-10, -7, -5, -4, -3, -2, -1, -0]


%% Step by Step
% all combination division
mt_a_dvd_grid = (ar_a./ar_grid)

% ceiling for each
(mt_a_dvd_grid >= 1)

% If ceiling exists and cloest ceiling index
% min_{j}( ar_grid[j] - ar_a[i] | ar_grid[j] > ar_a[i])
[~, ar_max_a_on_grid_idx] = max((mt_a_dvd_grid >= 1),[], 2)

% ar_grid[argmin_{j}( ar_grid[j] - ar_a[i] | ar_grid[j] > ar_a[i])]
ar_a_grid_ceil = ar_grid(ar_max_a_on_grid_idx)
% ar_a_grid_ceil(ar_max_a_on_grid_idx == 1) = ar_grid(0)

% now floor, just one index less
ar_a_grid_floor = ar_grid(max(ar_max_a_on_grid_idx - 1, 1))
% ar_a_grid_floor(ar_max_a_on_grid_idx == 1) =

% ar_a along with points from formal grid that is just higher or just lower
[ar_a ar_a_grid_floor' ar_a_grid_ceil']

%% Single Lin

% Get Index
[~, ar_max_a_on_grid_idx] = max(((ar_a./ar_grid) >= 1),[], 2);

% Get value
ar_a_grid_ceil = ar_grid(ar_max_a_on_grid_idx);
ar_a_grid_floor = ar_grid(max(ar_max_a_on_grid_idx - 1, 1));

% Display
[ar_a ar_a_grid_floor' ar_a_grid_ceil']
