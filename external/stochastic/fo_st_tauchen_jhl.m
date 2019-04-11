%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function is writtan by Jan Hannes Lang
% https://sites.google.com/site/janhanneslang/programs
% FUNCTION: [s, Pi] = fo_st_tauchen_jhl(mu, rho, sig, N)
%
% This function discretizes a continuous AR(1) process by using the method
% proposed by Tauchen (1986). The AR(1) process takes the following form:
% y(t) = mu + rho*y(t-1) + eps(t), where eps ~ N(0,sig^2)
% Parts of the code are taken from the function tauchen.m written by Martin
% Flod�n.
%
% INPUTS
%   mu:     scalar, intercept term of the AR(1) process
%   rho:    scalar, AR-coefficient
%   sig:    scalar, standard deviation of innovations
%   N:      scalar, number of grid points for the discretized process
%
% OUTPUTS
%   s:      column vector of size Nx1, contains all possible states in ascending order
%   Pi:     matrix of size NxN, contains the transition proabilities. Rows
%           are current state and columns future state
%
% Author:   Jan Hannes Lang
% Date:     6.7.2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [s, Pi] = fo_st_tauchen_jhl(mu,rho,sig,N)

m       = 3;
s       = zeros(N,1);
Pi      = zeros(N,N);
s(1)    = mu/(1-rho) - m*sqrt(sig^2/(1-rho^2));
s(N)    = mu/(1-rho) + m*sqrt(sig^2/(1-rho^2));
step    = (s(N)-s(1))/(N-1);

for i=2:(N-1)
   s(i) = s(i-1) + step;
end

for j = 1:N
    for k = 1:N
        if k == 1
            Pi(j,k) = cdf_normal((s(1) - mu - rho*s(j) + step/2) / sig);
        elseif k == N
            Pi(j,k) = 1 - cdf_normal((s(N) - mu - rho*s(j) - step/2) / sig);
        else
            Pi(j,k) = cdf_normal((s(k) - mu - rho*s(j) + step/2) / sig) - ...
                      cdf_normal((s(k) - mu - rho*s(j) - step/2) / sig);
        end
    end
end

function c = cdf_normal(x)
    c = 0.5 * erfc(-x/sqrt(2));
