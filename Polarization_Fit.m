function [fitresult, gof] = createFit1(step, Pz);
%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( step, Pz );

% Set up fittype and options.
ft = fittype( 'a*sin(x)+b*cos(x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );