function [ Cost ] = Cost_LeastSquare(Outputs, Scaling, OutputWeighting, Measurements)
r       = Measurements - Outputs;
e       = OutputWeighting \ r;
Cost    = Scaling * 0.5 * r.' * e;
end

