%Funckja generująca macierz B(u, v)

function[B]=generate_B(N)
B = zeros(N + 1, N + 1);


for i = 1:N+1
    for j = 1:N+1
        if i == 1 && j == 1
            e = generate_e(N, divide_interval(N), i);
            fun_u = @(x) e(2, 1)*x + e(2, 2);
            fun_v = @(x) e(2, 1)*x + e(2, 2);
            fun_uv = @(x) ( e(2, 1)* e(2, 1) * x.^2 + e(2, 1) * e(2, 2) * x + e(2, 2) * e(2, 1) * x + e(2, 2) * e(2, 2));
            fun_dudv = @(x)(e(2, 1)) * (e(2, 1) * x.^0);
            a = e(2, 3);
            b = e(2, 4);
            B(i, j) = integral(fun_dudv, a, b) - integral(fun_uv, a, b);
            
        elseif i == N + 1 && j == N + 1
            e = generate_e(N, divide_interval(N), i);
            fun_u = @(x) e(1, 1)*x + e(1, 2);
            fun_v = @(x) e(1, 1)*x + e(1, 2);
            fun_uv = @(x) ( e(1, 1)* e(1, 1) * x.^2 + e(1, 1) * e(1, 2) * x + e(1, 2) * e(1, 1) * x + e(1, 2) * e(1, 2));
            fun_dudv = @(x)(e(1, 1)) * (e(1, 1) * x.^0);
            a = e(1, 3);
            b = e(1, 4);
            B(i, j) = integral(fun_dudv, a, b) - integral(fun_uv, a, b);
            B(i, j) = B(i, j) - fun_u(2)*fun_v(2);
            
        elseif i == j
            e = generate_e(N, divide_interval(N), i);
            fun_uv1 = @(x) ( e(1, 1)* e(1, 1) * x.^2 + e(1, 1) * e(1, 2) * x + e(1, 2) * e(1, 1) * x + e(1, 2) * e(1, 2));
            fun_uv2 = @(x) ( e(2, 1)* e(2, 1) * x.^2 + e(2, 1) * e(2, 2) * x + e(2, 2) * e(2, 1) * x + e(2, 2) * e(2, 2));
            fun_dudv1 = @(x)(e(1, 1)) * (e(1, 1) * x.^0);
            fun_dudv2 = @(x)(e(2, 1)) * (e(2, 1) * x.^0);
            a1 = e(1, 3);
            b1 = e(1, 4);
            a2 = e(2, 3);
            b2 = e(2, 4);
            B(i, j) = integral(fun_dudv1, a1, b1) - integral(fun_uv1, a1, b1) + integral(fun_dudv2, a2, b2) - integral(fun_uv2, a2, b2);% - fun_u(2)*fun_v(2);

        elseif i == j - 1
            e1 = generate_e(N, divide_interval(N), i);
            e2 = generate_e(N, divide_interval(N), j);
            fun_u = @(x) e1(2, 1)*x + e(2, 2);
            fun_v = @(x) e2(1, 1)*x + e(1, 2);
            fun_uv = @(x) ( e1(2, 1)* e2(1, 1) * x.^2 + e1(2, 1) * e2(1, 2) * x + e1(2, 2) * e2(1, 1) * x + e1(2, 2) * e2(1, 2));
            fun_dudv = @(x)(e1(2, 1)) * (e2(1, 1) * x.^0);
            a = e1(2, 3);
            b = e1(2, 4);
            B(i, j) = integral(fun_dudv, a, b) - integral(fun_uv, a, b);
            
        elseif i == j + 1
            e1 = generate_e(N, divide_interval(N), i);
            e2 = generate_e(N, divide_interval(N), j);
            fun_u = @(x) e1(1, 1)*x + e2(1, 2);
            fun_v = @(x) e2(2, 1)*x + e2(2, 2);
            fun_uv = @(x) ( e1(1, 1)* e2(2, 1) * x.^2 + e1(1, 1) * e2(2, 2) * x + e1(1, 2) * e2(2, 1) * x + e1(1, 2) * e2(2, 2));
            fun_dudv = @(x)(e1(1, 1)) * (e2(2, 1) * x.^0);
            a = e2(2, 3);
            b = e2(2, 4);
            B(i, j) = integral(fun_dudv, a, b) - integral(fun_uv, a, b);% - fun_u(2)*fun_v(2);
        end
    end
end




