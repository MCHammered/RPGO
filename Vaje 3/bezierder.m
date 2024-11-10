function [d1b, d1B] = bezierder(B,r,t)
% Opis:
% bezierder vrne točke na krivulji, ki predstavlja odvod dane
% Bezierjeve krivulje
%
% Definicija:
% db = bezierder(B,r,t)
%
% Vhodni podatki:
% B matrika kontrolnih točk Bezierjeve krivulje, v kateri vsaka
% vrstica predstavlja eno kontrolno točko,
% r stopnja odvoda, ki ga računamo,
% t seznam parameterov, pri katerih računamo odvod
%
% Izhodni podatek:
% db matrika, v kateri vsaka vrstica predstavlja točko r-tega
% odvoda pri istoležnem parametru iz seznama t

n = size(B,1); % n+1

% 1. pristop
db1 = NaN(length(t),2);
for i=1:length(t)
    X = decasteljau(B(:,1),t(i));
    Y = decasteljau(B(:,2),t(i));
    faktor = factorial(n-1)/factorial(n-1-r);
    db1(i,:) = faktor.*[diff(X(1:r+1,n-r),r) diff(Y(1:r+1,n-r),r)];
end

% 2. pristop
db2 = NaN(length(t),2);
d1B = [diff(B(:,1),r) diff(B(:,2),r)];
for i=1:length(t)
    dX = decasteljau(d1B(:,1),t(i));
    dY = decasteljau(d1B(:,2), t(i));
    faktor = factorial(n-1)/factorial(n-1-r);
    db2(i,:) = faktor.*[dX(1,n-r) dY(1,n-r)];
end

d1b = db2;

end
