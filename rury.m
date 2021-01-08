clear all; close all; clc

N = 3
%disp(divide_interval(N));
%for i = 0:N
%    disp(i);
%    disp(generate_e(N, divide_interval(N), i + 1));
%end


disp(generate_B(N));
disp(generate_L(N));
disp(linsolve(generate_B(N), generate_L(N)));