%funkcja genrująca i-ty element
%element jest postaci 
% [a1, b1, p1, k1] => y = a1 * x + b, p1 <= x <= k1
% [a2, b2, p2, k2] => y = a2 * x + b, p2 <= x <= k2
% funkcja wykorzystuje metode Galerkina

function[e]=generate_e(N, intervals, i)
if i == 1
    e(1, 1) = 0;
    e(1, 2) = 0;
    e(1, 3) = 0;
    e(1, 4) = 0;
else
    e(1, 1) = 1 / (intervals(i) - intervals(i - 1));
    e(1, 2) = -intervals(i - 1) / (intervals(i) - intervals(i - 1));
    e(1, 3) = intervals(i - 1);
    e(1, 4) = intervals(i);
end
    
if i == N + 1
    e(2, 1) = 0;
    e(2, 2) = 0;
    e(2, 3) = 0;
    e(2, 4) = 0;
else
    e(2, 1) = -1 / (intervals(i + 1) - intervals(i));
    e(2, 2) = intervals(i + 1) / (intervals(i + 1) - intervals(i));
    e(2, 3) = intervals(i);
    e(2, 4) = intervals(i + 1);
end

end