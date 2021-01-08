% Funkcja wyznacza watość n!
function[wynik]=fact(n)
wynik=1;
for i=1:n
 wynik=wynik*i;
end