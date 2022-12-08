%% Summary
%
% This example demonstrates some new interfaces added in FALCON.m v1.27.


%% Dynamics
%
% We create a model that includes two decoupled dynamic systems.
%
% Here, we use the subsystem mode of the model builder framework and
% demonstrate that model variables and subsystems can be defined in arbitrary
% order, which was not possible in earlier FALCON.m versions.

builder = falcon.SimulationModelBuilder( ...
    'multiModel', ...
    [], [], [] ... states/controls/parameters will be added later
    );

% Define the first part of the model.

builder.addState('x12', 'x12_dot');  % add an ODE: d(x12)/d(t) = x12_dot
builder.addSubsystem( ...
    @(x, x_dot, b, u, w, z) w^2 * (b * u - x) - 2 * z * w * x_dot, ...
    ... Note: x11, b1, u1, w1, z1 have not been defined at this point!
    'Inputs', {'x11', 'x12', 'b1', 'u1', 'w1', 'z1'}, ...
    'Outputs', {'x12_dot'});
builder.addState('x11', 'x12');  % add another ODE: d(x11)/d(t) = x12
builder.addControl('u1');
builder.addConstantInput('z1', [1, 1]);
builder.addConstantInput('w1', [1, 1]);
builder.addConstantInput('b1', [1, 1]);

% Define the second part of the model.

builder.addState('x21', 'x21_dot');
builder.addSubsystem( ...
    @(x, u, T) (u - x) / T, ...
    'Inputs', {'x21', 'u2', 'T2'}, ...
    'Outputs', {'x21_dot'})
builder.addControl('u2');
builder.addConstantInput('T2', [1, 1]);

% Compile.

builder.Build( ...
    'EvaluationProvider', falcon.core.builder.DerivativeCoderConfiguration());

%% Define a Problem

% Define the model constants in a struct -- no need to remember the order of
% definition.
constants = struct();
constants.b1 = 5;
constants.w1 = 5;
constants.z1 = 0.7;
constants.T2 = 1;

% Create a ModelWrapper instance for convenience.  Note that this is a
% handle/reference object, i.e., you need to create copies in order to specify
% different constants in different phases.
model = falcon.ModelWrapper(@multiModel).specialize();
model.setConstants(constants);
[varsByType, varList] = model.createVariables();
stateList     = varsByType.States;
controlList   = varsByType.Controls;
parameterList = varsByType.Parameters;
outputList    = varsByType.Outputs;

states = stateList.byName();   % byName() returns a struct with handles
states.x11.setBounds(-3, 3);   % setBounds(lb, ub) sets both bounds at once
states.x12.setRange([-2, 2]);  % setRange([lb, ub]) accepts a vector argument

controls = controlList.byName();
controls.u1.setBounds(-1, 1);
controls.u2.setBounds(-5, 5);

% First phase -----------------------------------------------------------------

problem = falcon.Problem('demo');

phase = problem.addNewPhase(@model.evaluate, stateList, 100, 0, 10);
phase.addNewControlGrid(controlList);
phase.Model.setModelOutputs(outputList);  % This is still required!
% Do not call phase.Model.addModelConstants(...)!

% Do not rely on the states to be defined in a specific order!
phase.setInitialBoundaries([states.x11, states.x12, states.x21]', [0, 0, 0]');

% Add some time-dependent state bounds:
tau = linspace(0, 1, 100);
phase.StateGrid.setDistributedUpperBounds( ...
    states.x11, tau, +1 + 100 * (tau - 0.5).^2);
phase.StateGrid.setDistributedLowerBounds( ...
    states.x21, tau, -1 - 100 * (tau - 0.5).^2);

% Maximize the integral over the difference between x11 and x21, i.e., minimize
% integral(x21 - x11):
phase.addNewLinearPathCost([states.x11, states.x21]', 'Weight', [-1, 1]');

% Second phase ----------------------------------------------------------------

phase = problem.addNewPhase( ...
    @model.evaluate, stateList, 100, ...
    problem.Phases(end).FinalTime.Value, ...
    problem.Phases(end).FinalTime.Value + 5);
phase.addNewControlGrid(controlList);
phase.Model.setModelOutputs(outputList);

% Minimize the squared difference between x11 and x21 at the phase midpoint:
problem.addNewQuadraticPointCost( ...
    [states.x11, states.x21]', phase, 0.5, 'WeightMatrix', [1, -1; -1, 1]);

% Reward x11 approaching 3 and x21 approaching 2 at the phase end:
problem.addNewQuadraticPointCost( ...
    [states.x11, states.x21]', phase, 1, ...
    'WeightMatrix', diag([5, 5]), 'Offset', [3, 2]');

% Third phase ------------------------------------------------------------------

% Find a tradeoff between time and control effort to drive all states to zero.

t_f = falcon.Parameter('t_f', problem.Phases(end).FinalTime.Value + 5);

phase = problem.addNewPhase( ...
    @model.evaluate, stateList, 100, problem.Phases(end).FinalTime.Value, t_f);
phase.addNewControlGrid(controlList);
phase.Model.setModelOutputs(outputList);

phase.setFinalBoundaries(zeros(numel(stateList), 1));

problem.addNewLinearPointCost(t_f, phase);
phase.addNewQuadraticPathCost(controlList);

% Finalize --------------------------------------------------------------------

problem.ConnectAllPhases();

%% Solve

problem.Bake();
solver = falcon.solver.ipopt(problem);
solver.Solve();

%% Visualize

% Again, do not rely on indices.  Instead, get a struct for name-based access.
stateValues = stateList.extractValuesStructFrom(problem);
time = problem.RealTime;

figure();
hold('on');

plot(time, stateValues.x11, 'DisplayName', 'x11');
plot(time, stateValues.x12, 'DisplayName', 'x12');
plot(time, stateValues.x21, 'DisplayName', 'x21');

if ~falcon.auxiliary.matlabReleaseLessThan('R2018b')
    for phase = problem.Phases(:).'
        line = xline(phase.FinalTime.Value);
        line.Annotation.LegendInformation.IconDisplayStyle = 'off';
    end
end

xlabel('time');
ylabel('states');
leg = legend('show');
leg.Location = 'eastoutside';
