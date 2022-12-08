%% Define States Controls and Parameter
x_vec = [...
    falcon.State('x',       0,    100, 0.01);...
    falcon.State('y',       0,    100, 0.01);...
    falcon.State('V',       0,      5,    1);...
    falcon.State('chi', -2*pi,   2*pi,    1)];

u_vec = [...
    falcon.Control('Vdot'  ,   -0.1,    0.1, 1);...
    falcon.Control('chidot',-pi/8,+pi/8, 1)];

tf = falcon.Parameter('FinalTime', 20, 0, 40, 0.1);

%% Define Optimal Control Problem
% Create new Problem Instance (Main Instance)
problem = falcon.Problem('Car');

% Specify Discretization
tau = linspace(0,1,101);

% Add a new Phase
phase = problem.addNewPhase(@source_car, x_vec, tau, 0, tf);
phase.addNewControlGrid(u_vec, tau);
phase.Model.setModelOutputs([falcon.Output('dummyout'); falcon.Output('dummy1')]);

% Set Boundary Condition
phase.setInitialBoundaries([0;0;5;0]);
phase.setFinalBoundaries([100;100;5;0]);

% Add Cost Function
problem.addNewLinearPointCost(tf);

% Prepare problem for solving
problem.Bake();

% Solve problem
solver = falcon.solver.fmincon_algo(problem);
solver.Options.MajorIterLimit = 500;
solver.Options.MajorFeasTol   = 1e-5;
solver.Options.MajorOptTol    = 1e-3;


fminconAvail       = true;
matlabVer          = ver();
installedToolboxes = {matlabVer(:).Name};
if ~any(strcmp(installedToolboxes, 'Optimization Toolbox'))
    fminconAvail = false;
end
if ~license('test','optimization_toolbox')
    fminconAvail = false;
end
if fminconAvail == true
    solver.Solve();
end

%% Plot
figure
subplot(2,4,[1,2,5,6]); grid on; hold on; xlabel('xpos'); ylabel('ypos'); title('Trajectory');
plot(phase.StateGrid.Values(1,:), phase.StateGrid.Values(2,:), 'x-');

subplot(2,4,3); grid on; hold on; xlabel('time'); ylabel('speed');
plot(phase.RealTime, phase.StateGrid.Values(3,:), 'x-');
subplot(2,4,4); grid on; hold on; xlabel('time'); ylabel('Direction [deg]');
plot(phase.RealTime, phase.StateGrid.Values(4,:)*180/pi, 'x-');

subplot(2,4,7); grid on; hold on; xlabel('time'); ylabel('speed dot cmd');
plot(phase.RealTime, phase.ControlGrids.Values(1,:), 'x-');
subplot(2,4,8); grid on; hold on; xlabel('time'); ylabel('Direction dot cmd [deg/s]');
plot(phase.RealTime, phase.ControlGrids.Values(2,:)*180/pi, 'x-');

%% Open the plot gui
problem.PlotGUI;