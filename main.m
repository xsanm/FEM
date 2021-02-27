clear all; close all; clc

N = 5;


% showing result
disp("B(u, v): ");
disp(generate_B(N));
disp("L(v): ");
disp(generate_L(N));
disp("U :");
disp(linsolve(generate_B(N), generate_L(N)));


% solving equations
res = linsolve(generate_B(N), generate_L(N));



X = [0:0.001:2];
Y = zeros(length(X));

% counting result
for i = 1:length(X)
    for j = 1:N + 1
       e1 = generate_e(N, divide_interval(N), j);
       if X(i) >= e1(1, 3) && X(i) <= e1(1, 4)
           Y(i) =  Y(i) + (e1(1,1) * X(i) + e1(1,2)) * res(j);
       end
       if X(i) >= e1(2, 3) && X(i) <= e1(2, 4)
           Y(i) =  Y(i) + (e1(2,1) * X(i) + e1(2,2)) * res(j);
       end
    end
end

% drawing plot
plot(X,Y);
