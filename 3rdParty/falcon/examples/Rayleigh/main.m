% This example has been taken from Betts, Practical Methods for Optimal Control and Estimation, p. 183

%% Define States Controls and Parameter
x_vec = [falcon.State('y1',       -100,    100,    1);...
    falcon.State('y2',       -100,    100,    1);...
    falcon.State('L',        -100,    100,    1)];

u_vec = falcon.Control('u',   -10,    10, 1);

%% Define Optimal Control Problem
% Create new Problem Instance (Main Instance)
problem = falcon.Problem('Rayleigh');

% Specify Discretization
tau = linspace(0,1,501);

% Add a new Phase
phase = problem.addNewPhase(@source_model, x_vec, tau, 0, 4.5);
phase.addNewControlGrid(u_vec, tau);
phase.Model.setModelOutputs(falcon.Output('control_constr'));

% Add path constraint
pathconstraints = falcon.Constraint('c_constr', -inf, 0);
phase.addNewPathConstraint(@source_path, pathconstraints, tau);

% Set Boundary Condition
phase.setInitialBoundaries([-5;-5;0]);
%phase.setFinalBoundaries([-inf;5;45;0], [inf;5;45;0]);

% Add Cost Function
problem.addNewLinearPointCost(x_vec(end));

% Solve Problem
% problem.Solve();
problem.Bake();
solver = falcon.solver.ipopt();
solver.setProblem(problem);
solver.Options.MajorIterLimit = 2000;
solver.Options.MajorFeasTol = 1e-10;
solver.Options.MajorOptTol  = 1e-10;

[z_opt, F_opt, status, lambda, mu, zl, zu] = solver.Solve();

% Calculate the control multipliers
h = phase.RealTime(2) - phase.RealTime(1);
% mu_c = mu(problem.Phases(1).ControlGrids(1).Index)' / h;
mu_c = lambda(problem.Phases(1).PathConstraintFunctions(1).OutputGrid.Index-1)' / h;

% Calculate the control multiplier analytically for comparison
mu_c_ana = -2*phase.ControlGrids(1).Values-4*phase.CostateGrid.Values(2,:);

%% Plot
try
    figure('Name', 'States and Costates');
    names = {'y1', 'y2', 'Lagrange Cost'};
    limits = [-12,2; -8,1; 0, 1.5];
    for ii=1:3
        subplot(2,3,ii); grid on; hold on; xlabel('time'); ylabel(names{ii});
        plot(phase.RealTime, phase.StateGrid.Values(ii,:), 'x-');
        
        subplot(2,3,3+ii); grid on; hold on; xlabel('time'); ylabel(['Costate ',names{ii}]);
        plot(phase.RealTime, phase.CostateGrid.Values(ii,:), 'r-');
        ylim(limits(ii,:));
    end
    
    figure('Name', 'Controls');
    subplot(2,1,1); grid on; hold on; xlabel('time'); ylabel('Control');
    plot(phase.RealTime, phase.ControlGrids(1).Values, 'x-');
    subplot(2,1,2); grid on; hold on; xlabel('time'); ylabel('Control adjoint');
    plot(phase.RealTime, mu_c, 'r-');
    plot(phase.RealTime, mu_c_ana, 'g-');
catch
    % plotting is optional and depending on Matlab version
end
