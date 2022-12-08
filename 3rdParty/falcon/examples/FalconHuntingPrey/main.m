%% Create States
x = [falcon.State('V',             0.01,          100,  0.1);...
    falcon.State('gamma', deg2rad(-90),  deg2rad(90),  1.0);...
    falcon.State('h',                0,          inf,  0.1);...
    falcon.State('s',                0,          inf,  0.1)];

%% Create Controls
u = [falcon.Control('P',              0,           1,  1.0);...
    falcon.Control('C_L',          -10,           10,  1.0)];

%% Create Phase Times
Times = [falcon.Parameter('Connect12', 10,      0,      100,      1);...
    falcon.Parameter('Connect23', 20,      0,      100,      1);...
    falcon.Parameter('Finish',    30,      0,      100,      1)];


%% Create the overall problem
myProblem = falcon.Problem('Falcon_hunting_prey');

% Normalized time
tau = linspace(0, 1, 300);

%% Create phases
% --------Phase 1---------
iP = 1;
FinalTime = Times(iP);

% Phase
phase = myProblem.addNewPhase(@FalconModel, x, tau, 0, FinalTime);
phase.StateGrid.setValues([15; 0; 30; 0], [5; 0; 0; 30]);
% phase.StateGrid.setSpecificValues(x([2,4]),[0;0],[0;30])

% Control Grid
controlgrid = phase.addNewControlGrid(u, tau);
controlgrid.setValues([0;0], [1;1]);
% controlgrid.setSpecificValues(u(2),[0], [1]);
% controlgrid.setSpecificValues(u(2),[0]);

% Initial and final boundaries
phase.setInitialBoundaries([15, 0, 30, 0]', [15, 0, 30, 0]');
phase.setFinalBoundaries(x([3,4]), [ 0,30]', [ 0,30]');

%% --------Phase 2---------
iP = 2;
StartTime = Times(iP-1);
FinalTime = Times(iP);

% Phase
phase = myProblem.addNewPhase(@FalconModel, x, tau, StartTime, FinalTime);
phase.StateGrid.setValues([10; 0; 0; 30], [10; 0; 40; 90]);

% Control Grid
controlgrid = phase.addNewControlGrid(u, tau);
controlgrid.setValues([0;0], [1;1]);

% Initial and final boundaries
phase.setFinalBoundaries([1, deg2rad(-70), 39, 90]', [inf, deg2rad(-30), 45, 90]');

% PathContraints
PCon = falcon.Constraint('PCon_h_s'         ,  -inf      , 0     , 1 );
phase.addNewPathConstraint(@HeightConstraint, PCon);

%% --------Phase 3---------
iP = 3;
StartTime = Times(iP-1);
FinalTime = Times(iP);


% Phase
phase = myProblem.addNewPhase(@FalconModel, x, tau, StartTime, FinalTime);
phase.StateGrid.setValues([2; 0; 40; 90], [10; 0; 30; 140]);

% Control Grid
% u(1).setLowerBound(0);
% u(1).setUpperBound(1);
controlgrid = phase.addNewControlGrid(u, tau);
controlgrid.setValues([1;0], [0;1]);

% Initial and final boundaries
phase.setFinalBoundaries([15, deg2rad(0), 30, 140]',    [15, deg2rad(0), 30, 140]');

% PathContraints
PCon = falcon.Constraint('PCon_h_s'         ,  -inf      , 0     , 1 );
phase.addNewPathConstraint(@HeightConstraint, PCon);

%% Connect phases
myProblem.ConnectAllPhases();

%% Costfunction
myProblem.addNewLinearPointCost(Times(end));

%% Set up problem
myProblem.Solve();

%% Plot Results
try
    CreatePlot;
catch
    % plotting is optional and depending on Matlab version
end