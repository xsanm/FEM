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