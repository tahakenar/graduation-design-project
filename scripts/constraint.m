function [c, ceq] = constraint(x)
%SIMPLE_CONSTRAINT Nonlinear inequality constraints.

%   Copyright 2005-2007 The MathWorks, Inc.
sim("multidrug2022simulation.slx");

c = [-normal_cell_pop(end) + 6.5*10^5];

% No nonlinear equality constraints:
ceq = [];

end