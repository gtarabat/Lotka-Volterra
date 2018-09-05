function res = optimize_likelihood( theta0, data)


addpath('./CMA')

% change warning of ode15s on Tolerance to error for catching
% warnId = 'MATLAB:ode15s:IntegrationTolNotMet';
% warnstate = warning('error', warnId);


opts.CMA.active = 0;
opts.PopSize    = 128; % population size in every generation
opts.Resume     = 0;
opts.MaxFunEvals = 300000;

opts.LBounds = [ 0.1, 0.001,  0.1,  0.001,  1e-5 ]';    % upper bound in search space
opts.UBounds = [ 0.9, 0.1,    0.9,    0.1,     5    ]';    % lower bound in search space

opts.Noise.on = 0;
opts.LogModulo = 1;
opts.LogPlot = 1;
opts.DispModulo = 1;
opts.EvalParallel = 1;
opts.EvalInitialX = 1;
opts.TolX = 1e-12;

opts.SaveFilename = 'opt_theta.mat';
opts.LogFilenamePrefix =  'outcmaes_';

res = cmaes_parfor( 'likelihood', theta0', [], opts, data );

disp(res)