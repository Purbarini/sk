function [ label ] = targetData
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
l1 = repmat([1 0 0 0 0 0 0 0 0 0 0 0 0 0 ], 43, 1)';
l2 = repmat([0 1 0 0 0 0 0 0 0 0 0 0 0 0 ], 43, 1)';
l3 = repmat([0 0 1 0 0 0 0 0 0 0 0 0 0 0 ], 43, 1)';
l4 = repmat([0 0 0 1 0 0 0 0 0 0 0 0 0 0 ], 43, 1)';
l5 = repmat([0 0 0 0 1 0 0 0 0 0 0 0 0 0 ], 43, 1)';
l6 = repmat([0 0 0 0 0 1 0 0 0 0 0 0 0 0 ], 43, 1)';
l7 = repmat([0 0 0 0 0 0 1 0 0 0 0 0 0 0 ], 43, 1)';
l8 = repmat([0 0 0 0 0 0 0 1 0 0 0 0 0 0 ], 43, 1)';
l9 = repmat([0 0 0 0 0 0 0 0 1 0 0 0 0 0 ], 43, 1)';
l10 = repmat([0 0 0 0 0 0 0 0 0 1 0 0 0 0 ], 43, 1)';
l11 = repmat([0 0 0 0 0 0 0 0 0 0 1 0 0 0 ], 43, 1)';
l12 = repmat([0 0 0 0 0 0 0 0 0 0 0 1 0 0 ], 43, 1)';
l13 = repmat([0 0 0 0 0 0 0 0 0 0 0 0 1 0 ], 43, 1)';
l14 = repmat([0 0 0 0 0 0 0 0 0 0 0 0 0 1 ], 43, 1)';

% isiData = dataset(1:8,:);
% labelData = dataset(9,:);
label = [l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14];

end
