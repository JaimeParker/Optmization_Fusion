function [ kinematic_dot ] = sysTranslationPropagation( T, D, L, W, m, V, gamma, mu )
%SYSTRANSLATIONPROPAGATION Summary of this function goes here
%   Detailed explanation goes here

vel_K_abs_dot = (T-D-W*sin(gamma)) ./  m;
chi_K_dot     = (L * sin(mu)) ./ (m .* V .* cos(gamma));
gamma_K_dot   = (L * cos(mu) - W * cos(gamma)) ./ (m .* V);

kinematic_dot = [vel_K_abs_dot; chi_K_dot; gamma_K_dot];

end

