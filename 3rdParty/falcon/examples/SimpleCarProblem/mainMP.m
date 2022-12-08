%% Define States Controls and Parameter
x_vec = [...
    falcon.State('x',       0,    200, 0.01);...
    falcon.State('y',       0,    200, 0.01);...
    falcon.State('V',       0,      5,    1);...
    falcon.State('chi', -2*pi,   2*pi,    1)];

u_vec = [...
    falcon.Control('Vdot'  ,   -0.1,    0.1, 1);...
    falcon.Control('chidot',-pi/8,+pi/8, 1)];

tfint = falcon.Parameter('IntermediateTime', 20, 0, 40, 0.1); % Intermediate time = final time of phase 1
tf = falcon.Parameter('FinalTime', 40, 0, 80, 0.1); % Final time = final time of phase 2

%% Define Optimal Control Problem
% Create new Problem Instance (Main Instance)
problem = falcon.Problem('Car');

% Specify Discretization
tau = linspace(0,1,101);

% Add a new Phase
phase = problem.addNewPhase(@source_car, x_vec, tau, 0, tfint);
phase.addNewControlGrid(u_vec, tau);
phase.Model.setModelOutputs([falcon.Output('dummyout'); falcon.Output('dummy1')]);

% Set Boundary Condition
phase.setInitialBoundaries([0;0;5;0]);
phase.setFinalBoundaries([100;100;5;0]);

% Path Constraint
pathconstraints = [...
    falcon.Constraint('turnlb', -inf, 0);...
    falcon.Constraint('turnub', -inf, 0)];
phase.addNewPathConstraint(@source_path, pathconstraints,tau);

% Add a second phase Phase
phase2 = problem.addNewPhase(@source_car, x_vec, tau, tfint, tf);
phase2.addNewControlGrid(u_vec, tau);
phase2.Model.setModelOutputs([falcon.Output('dummyout'); falcon.Output('dummy1')]);

% Set final Boundary Condition
phase2.setFinalBoundaries([200;0;5;0]);

% Path Constraint
phase2.addNewPathConstraint(@source_path, pathconstraints, tau);

% Add Cost Function
problem.addNewLinearPointCost(tf);

% Connect the phases
% % problem.ConnectAllPhases();

% Point constraint builder% Connect the phases by the point constraint builder
pconObj = falcon.PointConstraintBuilder('ConnectPhases');

% Add the phase inputs (i.e., the states) that are required for one time
% step in each phase
pconObj.addPhaseInput(0,x_vec,0,1); % This is the first phase
pconObj.addPhaseInput(0,x_vec,0,1); % This is the second phase (that could also have another input structure)

% Now use an anonymous function handle to build the constraint
% Remember that the phase inputs are automatically split up into grids
% (_g*)
pconObj.addSubsystem(@(x,y) x - y,...
    {'states_g1', 'states_g2'},...
    {'phaseDefect'});

% Split the vector in single constraints
pconObj.SplitVariable('phaseDefect',{'x_PhaseDefect';
    'y_PhaseDefect'; 'V_PhaseDefect';'chi_PhaseDefect'});

% Constraint value names
pconObj.setConstraintValueNames({'x_PhaseDefect';
    'y_PhaseDefect';'V_PhaseDefect';'chi_PhaseDefect'});

% Build the constraint
pconObj.Build;

% Define the constraint data types (all must be zero)
connectConstraints = [falcon.Constraint('x_PhaseDefect',0,0,1,0,true);
    falcon.Constraint('y_PhaseDefect',0,0,1,0,true);
    falcon.Constraint('V_PhaseDefect',0,0,1,0,true);
    falcon.Constraint('chi_PhaseDefect',0,0,1,0,true)];

% Add the point constraint to the problem
% Within the first phase the last normalized time step (tau = 1) must be
% added, while we have the first normalized time step (tau = 0) in the
% second phase
problem.addNewPointConstraint(@ConnectPhases,connectConstraints,...
    problem.Phases(1),1,problem.Phases(2),0);

% Prepare problem for solving
problem.Bake();

% Solve problem
solver = falcon.solver.ipopt(problem);
solver.Options.MajorIterLimit = 500;
solver.Options.MajorFeasTol   = 1e-5;
solver.Options.MajorOptTol    = 1e-5;

solver.Solve();

%% Plot
try
    figure
    subplot(2,4,[1,2,5,6]); grid on; hold on; xlabel('xpos'); ylabel('ypos'); title('Trajectory');
    plot(problem.StateValues(1,:), problem.StateValues(2,:), 'x-');
    
    subplot(2,4,3); grid on; hold on; xlabel('time'); ylabel('speed');
    plot(problem.RealTime, problem.StateValues(3,:), 'x-');
    subplot(2,4,4); grid on; hold on; xlabel('time'); ylabel('Direction [deg]');
    plot(problem.RealTime, problem.StateValues(4,:)*180/pi, 'x-');
    
    subplot(2,4,7); grid on; hold on; xlabel('time'); ylabel('speed dot cmd');
    plot(problem.RealTime, problem.ControlValues(1,:), 'x-');
    subplot(2,4,8); grid on; hold on; xlabel('time'); ylabel('Direction dot cmd [deg/s]');
    plot(problem.RealTime, problem.ControlValues(2,:)*180/pi, 'x-');
catch
    % plotting is optional and depending on Matlab version
end

%% Open the plot gui
try
    falcon.gui.plot.show(problem,'AskSaveOnClose',false);
catch
    fprintf('Please check your graphics driver and Java setting for the FALCON.m plot GUI to work.\n');
end
