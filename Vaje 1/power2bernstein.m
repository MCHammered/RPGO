function b = power2bernstein(p)
% Opis:
% power2bernstein pretvori polinom, predstavljen s koeficienti v
% potenčni bazi, v polinom, predstavljen v Bernsteinovi bazi
%
% Definicija:
% b = power2bernstein(p)
%
% Vhodni podatek:
% p seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v potenčni bazi od x^n do 1
%
% Izhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v Bernsteinovi bazi od 0-tega do n-tega
% Bernsteinovega baznega polinoma

m = length(p)-1; % dolzina koeficientov
b = zeros(1,m+1);

for i=0:m
    for j=i:m
        b(j+1) = b(j+1) + p(m-i+1)*nchoosek(j,i)/nchoosek(m,i);
    end
end

end