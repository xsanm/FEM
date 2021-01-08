%Funckja generująca macierz L(v)

function[L]=generate_L(N)
L = zeros(N + 1);
for i = 1:N+1
    e = generate_e(N, divide_interval(N), i);
    fun1 = @(x) (e(1, 1)*x + e(1, 2));
    fun2 = @(x) (e(2, 1)*x + e(2, 2));
    L(i) = (integral(@(x) sin(x) .*fun1(x), e(1, 3), e(1, 4)) + integral(@(x) sin(x) .*fun2(x), e(2, 3), e(2, 4)));
end
