% This example has been taken from Betts, Practical Methods for Optimal Control and Estimation, p. 178

%% Define States Controls and Parameter
x_vec = [falcon.State('x',       -100,    100,    0.1);...
    falcon.State('y',       -100,    100,    0.1);...
    falcon.State('x_dot',   -100,    100,    0.1);...
    falcon.State('y_dot',   -100,    100,    0.1)];

u_vec = falcon.Control('u'  ,   -2*pi,    2*pi, 1);

tf = falcon.Parameter('FinalTime', 1, 0, 10, 1);

%% Define Optimal Control Problem
% Create new Problem Instance (Main Instance)
problem = falcon.Problem('Tangent');

% Specify Discretization
tau = linspace(0,1,501);

% Add a new Phase
phase = problem.addNewPhase(@source_tangent, x_vec, tau, 0, tf);
phase.addNewControlGrid(u_vec, tau);

% Set Boundary Condition
phase.setInitialBoundaries([0;0;0;0]);
phase.setFinalBoundaries([-inf;5;45;0], [inf;5;45;0]);

% Add Cost Function
problem.addNewLinearPointCost(tf);

% Solve Problem
% problem.Solve();
problem.Bake();
solver = falcon.solver.ipopt();
solver.setProblem(problem);
solver.Options.MajorIterLimit = 2000;
solver.Options.MajorFeasTol = 1e-10;
solver.Options.MajorOptTol  = 1e-10;

[z_opt, F_opt, status, lambda, mu, zl, zu] = solver.Solve();

% Calculate the costates by different means
% [f,g] = problem.SingleCallOptiFunc();
% gsp   = sparse(problem.iGfun,problem.jGvar,g,problem.fLength,problem.zLength);
% dVdz  = [1;lambda]'*gsp+mu';
% dVdx  = dVdz(phase.StateGrid.Index);

%% Plot
try
    figure
    subplot(2,4,[1,2,5,6]); grid on; hold on; xlabel('xpos'); ylabel('ypos'); title('Trajectory');
    plot(phase.StateGrid.Values(1,:), phase.StateGrid.Values(2,:), 'x-');
    
    subplot(2,4,3); grid on; hold on; xlabel('time'); ylabel('y1');
    plot(phase.RealTime, phase.StateGrid.Values(1,:), 'x-');
    subplot(2,4,4); grid on; hold on; xlabel('time'); ylabel('y2');
    plot(phase.RealTime, phase.StateGrid.Values(2,:), 'x-');
    subplot(2,4,7); grid on; hold on; xlabel('time'); ylabel('y3');
    plot(phase.RealTime, phase.StateGrid.Values(3,:), 'x-');
    subplot(2,4,8); grid on; hold on; xlabel('time'); ylabel('y4');
    plot(phase.RealTime, phase.StateGrid.Values(4,:), 'x-');
    
    figure('Name', 'Costates');
    limits = [-1e-4, 1e-4; -4e-2, 0; -8e-3, 0; -0.01, 0.01];
    for ii=1:4
        subplot(2,2,ii); grid on; hold on; xlabel('time'); ylabel(['Costate y', num2str(ii)]);
        plot(phase.RealTime, phase.CostateGrid.Values(ii,:), 'r-');
        ylim(limits(ii,:));
        %plot(phase.RealTime, dVdx(ii,:), 'g-');
    end
catch
    % plotting is optional and depending on Matlab version
end