clear
close all

%% Create States
x = [falcon.State('x1',     -inf,   inf,    1.0);...
    falcon.State('x2',     -inf,   inf,    1.0)];

%% Create Control
u = falcon.Control('u', -1, 1, 1.0, 'Fixed',true);

%% Create Outputs
y = [falcon.Output('y1', -inf, inf, 1.0);...
    falcon.Output('y2', -inf, inf, 1.0)];

%% Create Parameters
p = [falcon.Parameter('D'         ,1            ,0.001      ,10         ,1.0);...
    falcon.Parameter('omega_0'   ,1.5          ,0.001      ,10         ,1.0);...
    falcon.Parameter('k_s'       ,1            ,0.001      ,10         ,1.0)];

%% Build model
if ~exist(['pt2.', mexext()], 'file')
    % create the simulation model object
    mdl_build = falcon.SimulationModelBuilder('pt2', x, u, p, @Model_PT2);
    % set the outputs
    mdl_build.setOutputs( y );
    % build the model
    mdl_build.Build();
end

%% Build least squares cost
if ~exist(['LSCost.', mexext()], 'file')
    % create the path constraint model object
    lc_build = falcon.PathConstraintBuilder('LSCost',y);
    % add scalar scaling
    lc_build.addConstantInput('Scaling',[1 1]);
    % add weighting matrix
    lc_build.addConstantInput('OutputWeighting',[2 2]);
    % add measurements
    lc_build.addConstantInput('Measurements',[2,1],'MultipleTimeEval',true);
    % add least squares cost function
    lc_build.addSubsystem(@Cost_LeastSquare,...
        'Inputs',{{y(:).Name}.','Scaling', 'OutputWeighting', 'Measurements'},...
        'Outputs',{'Cost'});
    % set cost function value
    lc_build.setConstraintValueNames('Cost');
    % build model
    lc_build.Build();
end

%% Load meassurement data
load Pt2Data.mat

%% Setup parameter estimation problem
Scaling         = 1;
OutputWeighting = eye(2);

% Create Problem
Problem = falcon.Problem('pt2');

% Create Phases in a for loop
nPhases = numel(t_data);

for iPhase = 1:nPhases
    % StateGrid
    tau = linspace(0, 1, size(t_data{iPhase},2));
    phase(iPhase) = Problem.addNewPhase(@pt2,  x, tau, t_data{iPhase}(1), t_data{iPhase}(end));
    
    % fix initial conditions at zero
    phase(iPhase).setInitialBoundaries(x, [0;0])
    
    % ControlGrid
    controlgrid = phase(iPhase).addNewControlGrid(u);
    controlgrid.setValues(tau, u_data{iPhase});
    
    % Set the parameters required in the model
    phase(iPhase).Model.setModelParameters(p);
    
    % set the outputs required in the model
    phase(iPhase).Model.setModelOutputs( y );
    
    % add the Cost as Lagrange Cost
    phase(iPhase).addNewLagrangeCost(@LSCost,falcon.Cost('Cost'));
    
    % add scaling factor, weight matrix and measurements
    phase(iPhase).LagrangeCostFunctions.addConstants(Scaling,OutputWeighting,z_data{iPhase});
end

%% Prepare and solve the problem
Problem.Bake();
solver = falcon.solver.ipopt();
solver.setProblem(Problem);
solver.Solve();

%% Visualize
try
    CreatePlots();
catch
    % plotting is optional and depending on Matlab version
end