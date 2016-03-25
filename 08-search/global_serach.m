% rf2 = @(x)rastriginsfcn(x/10);  % objective
% x0 = [20,30];                   % start point away from the minimum
% problem = createOptimProblem('fmincon','objective',rf2,'x0',x0);
% gs = GlobalSearch;
% [xg fg flg og] = run(gs,problem)

rf2 = @(x)power(x,2)+0.1;   % objective
x0 = [0];                   % start point away from the minimum
problem = createOptimProblem('fmincon','objective',rf2,'x0',x0);
gs = GlobalSearch;
[xg fg flg og] = run(gs,problem)

% rf2 = @(x)power(x,2)+100; % objective
% x0 = 20;                             % start point away from the minimum
% [xp fp flp op] = patternsearch(rf2,x0)


% The genetic algorithm is a method for solving both constrained and 
% unconstrained optimization problems that is based on natural selection,
% the process that drives biological evolution. The genetic algorithm 
% repeatedly modifies a population of individual solutions.
% At each step, the genetic algorithm selects individuals at random from 
% the current population to be parents and uses them to produce the 
% children for the next generation. Over successive generations, the 
% population "evolves" toward an optimal solution. You can apply the 
% genetic algorithm to solve a variety of optimization problems that 
% are not well suited for standard optimization algorithms, including 
% problems in which the objective function is discontinuous, 
% nondifferentiable, stochastic, or highly nonlinear. The genetic 
% algorithm can address problems of mixed integer programming, where 
% some components are restricted to be integer-valued.
