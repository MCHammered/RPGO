function p = bernstein2power(b)
% Opis:
% bernstein2power pretvori polinom, predstavljen s koeficienti v
% bernsteinovi bazi, v polinom, predstavljen v potencni bazi
%
% Definicija:
% p = bernstein2power(b)
%
% Vhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v bernsteinovi bazi od 0-tega do n-tega
% Izhodni podatek:
% p seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v potencni bazi od x^n do 1

m = length(b)-1;
p = zeros(1,m+1);

for i=0:m
    for j=i:m
        p(m-j+1) = p(m-j+1) + b(i+1)*(-1)^(i+j)*nchoosek(m,j)*nchoosek(j,i);
    end
end

end