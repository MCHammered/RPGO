function Be = bezierelv(B,k)
% Opis:
% bezierelv izvede višanje stopnje dane Bezierjeve krivulje
%
% Definicija:
% Be = bezierelv(B,k)
%
% Vhodna podatka:
% B matrika velikosti (n+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krivulje stopnje n,
% k število, ki določa, za koliko želimo zvišati stopnjo
% dane Bezierjeve krivulje
%
% Izhodni podatek:
% Be matrika velikosti (n+k+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krvulje stopnje n+k, ki ustreza dani Bezierjevi krivulji

Be = B;

for j=1:k
    C = NaN(size(Be,1)+1,size(Be,2));
    n = size(Be,1);
    for i=2:n
        C(i,:) = (1-(i-1)/n).*Be(i,:) + (i-1)/n.*Be(i-1,:);
    end
    C(1,:) = Be(1,:);
    C(end,:) = Be(n,:);
    
    Be=C;
end