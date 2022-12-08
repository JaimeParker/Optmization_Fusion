% States
states = [  falcon.State('x',     -inf,  inf, 1e-3);
            falcon.State('z',    -12e3, -304, 1e-3);
            falcon.State('V',       60,  200, 1e-2);
            falcon.State('gamma',-0.15, 0.15, 1)];

% Controls
controls = [falcon.Control('C_T',   0,   1  , 10);
            falcon.Control('C_L', -.5,   1.5, 1e+0)];

% Create the final time parameter
tf = falcon.Parameter('Final_Time', 1000, 20, 4e3, 1e-3);

%% Create Model
mdl = falcon.SimulationModelBuilder('aircraft', states, controls, [], @source_aircraft);
mdl.Build();

%% Create the problem
problem = falcon.Problem('AC_Approach');

% Specify Discretization
tau = linspace(0,1,1001);

% Add a new Phase
phase = problem.addNewPhase(@aircraft, states, tau, 0, tf);
phase.addNewControlGrid(controls);

% Set Boundary Condition
phase.setInitialBoundaries([-250e3; -10e3; 200; 0]);
phase.setFinalBoundaries([0; -304; 80; -0.05], [0; -304; 100; -0.05]);

% Add Cost Function
cost = phase.addNewQuadraticPathCost(controls(1));

% Solve Problem
problem.setMajorIterLimit(1000);
problem.setMajorFeasTol(1e-5);
problem.setMajorOptTol(1e-5);
problem.Solve();

%% Simulate the problem
% The following command triggers a simulation of the problem using the
% initial state and the optimized control history; this feature can be used
% to check the validity of the optimization results and the chosen
% discretization
[states,outputs,simTime,statesDot] = problem.Simulate();
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseODETimeStep',true);
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseODETimeStep',true,'DoVisualization',true);
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseODETimeStep',true,'SplitIntervals',2);
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseODETimeStep',true,'SplitIntervals',2,'DoVisualization',true);
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseODETimeStep',true,'SplitIntervals',2,'DoVisualization',true);
% % [states,outputs,simTime,statesDot] = problem.Simulate('useRealTime',false,'DoVisualization',true);
% % [states,outputs,simTime,statesDot] = problem.Simulate('UseBackwardInt',false,'DoVisualization',true);

%% Plot the results
% Here you can compare optimized as well as simulated results
try
    falcon.gui.plot.show(problem,'AskSaveOnClose',false);
catch
    fprintf('Please check your graphics driver and Java setting for the FALCON.m plot GUI to work.\n');
end