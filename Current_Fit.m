function [fitresult, gof] = createFit1(step, newPz);
%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( step, newPz );

% Set up fittype and options.
ft = fittype( '-b*sin(x)+a*cos(x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.MaxFunEvals = 100000;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );