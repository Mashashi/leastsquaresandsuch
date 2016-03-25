  % ======================================================================
  % EXAMPLE 0: some common shapes in 2D.
  % ======================================================================
 
    T = 1000;                                                                     % number of observations
    % CHOOSE WEIGHTS
    alpha = 2 / T;
    w0 = 1 / sum(exp(((1:T) - T) * alpha));
    w = w0 * exp(((1:T) - T) * alpha);                                            % weights: exponential decay
 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % a) A line is always a line!
    Y(:, 1) = 1:T;
    Y(:, 2) = rand * Y(:, 1) + rand;                                              % Linear relation
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % b) An horizontal line has a correlation equal to 0
    Y(1:T, 1) = rand;
    Y(:, 2) = 1:T;                                                                % Linear relation
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % c) A vertical line has a correlation equal to 0
    Y(:, 1) = 1:T;
    Y(:, 2) = rand;                                                               % Linear relation
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % d) A symmetric parabolic shape ... makes a huge difference!
    Y(:, 1) = (1:T) - T / 2 - 0.5;
    Y(:, 2) = rand * Y(:, 1) .^ 2 + rand;                                         % Parabolic relation (symmetric)
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % e) A circle
    angle = (2 * rand(T, 1) - 1) * pi;
    rho = rand(T, 1);
    Y(:, 1) = rho .* cos(angle);
    Y(:, 2) = rho .* sin(angle);                                                  % Circle
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % f) An exponential curve
    Y(:, 1) = 1:T;
    Y(:, 2) = exp(3 * (1:T) / T);                                                 % Exponential relation
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % g) A logarithm
    Y(:, 1) = 1:T;
    Y(:, 2) = log(1:T);                                                           % Logarithmic relation
    r1 = corrcoef(Y);
    r1 = r1(2)                                                                    % Traditional Correlation
    r2 = weightedcorrs(Y, w); 
    r2 = r2(2)                                                                    % Weighted Correlation
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%