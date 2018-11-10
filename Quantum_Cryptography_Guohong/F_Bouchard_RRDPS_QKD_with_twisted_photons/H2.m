% Zelin Meng 2018 @ SWU
% mengzelin@email.swu.edu.cn
% F. Bouchard - RRDPS QKD with twisted photons.

function [entropy] = H2(p)
%H2 Calculate Shannon Entropy.
entropy = - p * log2(p) - (1 - p) * log2(1 - p);
end

