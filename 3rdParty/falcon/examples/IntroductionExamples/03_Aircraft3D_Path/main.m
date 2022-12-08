% States
states = [falcon.State('x'    , -inf,  inf, 1e-3);
    falcon.State('y'    , -inf,  inf, 1e-3);
    falcon.State('z'    ,-12e3,  800, 1e-3);
    falcon.State('V'    ,   60,  300, 1e-2);
    falcon.State('chi'  ,-2*pi, 2*pi,    1);
    falcon.State('gamma',-0.15, 0.15,    1)];

% Controls
controls = [falcon.Control('C_T', 0, 1, 10);
    falcon.Control('C_L',          0,          1,    1);
    falcon.Control('mu' , -30*pi/180, +30*pi/180,    1)];

% Parameters
parameters = falcon.Parameter('m', 5e3, 4e3,5.5e3, 1e-3); % kg

% Create the final time parameter
tf = falcon.Parameter('Final_Time', 1000, 0, 4e3, 1e-3);

% NEW
modeloutputs = [falcon.Output('L');
    falcon.Output('C_D')];
% END NEW

%% Create Model
mdl = falcon.SimulationModelBuilder('aircraft', states, controls, parameters);
mdl.addConstant('S',123); % m^2
rho = 1.225;
g   = 9.81;

% Create a Subsystem with Inputs and Outputs
mdl.addSubsystem(@sysPositionPropagation,...
    {'V', 'chi', 'gamma'},...       % Inputs
    {'x_dot', 'y_dot', 'z_dot'});   % Outputs

% Call Lookup Table Subsystem which calculates its own derivatives using
% finite differences
mdl.addDerivativeSubsystem(@sysDragCoefficient,...
    {'C_L'},...                     % Specify Inputs
    {'C_D'},...                     % Specify Outputs
    'OutputSizes', {[1,1]},...      % Specify Output Sizes
    'OutputJacobianSparsity', {1}); % Specify Jacobian Sparsity

% Combine both aerodynamic coefficients to the a single !column! variable
mdl.CombineVariables('Coeffs', {'C_L'; 'C_D'});

% Calculate Lift and Drag of the aircraft using a subsystem call. The air
% density rho enters the subsystem as a numeric constant!
mdl.addSubsystem(@sysAero,...
    {'Coeffs', 'V', 'S', rho},...
    {'L', 'D'});

% Calculate thrust:
mdl.addSubsystem(@(C_T) 2e5 * C_T, {'C_T'}, {'T'});

% Calculate the Weight of the aircraft using an anonymous function
mdl.addSubsystem(@(m)m*g,...
    {'m'}, {'W'});

% Calculate the Speed and Angle derivatives
mdl.addSubsystem(@sysTranslationPropagation,...
    {'T','D','L','W','m','V','gamma','mu'},...
    {'kinematics_dot'});

% Split the kinmatic_dot varibale into its elements
mdl.SplitVariable('kinematics_dot', {'V_dot', 'chi_dot', 'gamma_dot'}.')

% Set the variable names of the derivatives to tell FALCON the correct
% outputs
mdl.setStateDerivativeNames('x_dot', 'y_dot', 'z_dot', 'V_dot', 'chi_dot', 'gamma_dot');

% NEW
mdl.setOutputs(modeloutputs);
% END NEW

% Build the Model evaluates the subsystem chain
mdl.Build();

% NEW
%% CREATE PATH FUNCTION
path = falcon.PathConstraintBuilder('pathconstraint', modeloutputs(1), 0, 0, parameters, @source_path);
path.addConstantInput('g', [1,1]);
path.Build();
% END NEW

%% Create the problem
problem = falcon.Problem('AC_Approach');

% Specify Discretization
tau = linspace(0,1,1001);

% Add a new Phase
phase = problem.addNewPhase(@aircraft, states, tau, 0, tf);
phase.addNewControlGrid(controls, tau);

phase.Model.setModelParameters(parameters);
phase.Model.setModelOutputs(modeloutputs);

pathc = phase.addNewPathConstraint(@pathconstraint, falcon.Constraint('Load', 0.95, 1.05, 4));
pathc.addConstants(g);
pathc.setParameters(parameters);

% Set Boundary Condition
phase.setInitialBoundaries(states(1:3), zeros(3,1));
phase.setFinalBoundaries(states(1:3), [20000; 4000; 0], [20000; 8000; 0]);

% Add Cost Function
problem.addNewLinearPointCost(tf);

% Solve Problem
problem.Solve();