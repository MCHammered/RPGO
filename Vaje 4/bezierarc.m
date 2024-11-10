function B = bezierarc(fi,m)
% Opis:
% bezierarc izračuna kontrole točke Bezierjeve krivulje, ki
% predstavlja interpolacijo krožnega loka po izbrani metodi
%
% Definicija:
% B = bezierarc(fi,m)
%
% Vhodna podatka:
% fi kot, ki določa krozni lok v območju (-fi,fi),
% m metoda interpolacije:
% 1 = kvadratični G1 interpolant,
% 2 = kubični C1 interpolant,
% 3 = kubični G1 interpolant s C0 interpolacijo v srednji točki
%
% Izhodni podatek:
% B tabela velikosti 3 x 2 ali 4 x 2, v kateri vsaka vrstica
% predstavlja kontrolno točko Bezierjeve krivulje

if m==1
    B = [cos(fi) -sin(fi); 1/cos(fi) 0; cos(fi) sin(fi)];
elseif m==2 % ujemanje z odvodom parametrizacije krivulje => d1=d2=1
    b0 = [cos(fi) -sin(fi)];
    b1 = [(cos(fi) + 1/3*sin(fi)) (-sin(fi) + 1/3*cos(fi))];
    b2 = [(cos(fi) + 1/3*sin(fi)) (sin(fi) -1/3*cos(fi))];
    b3 = [cos(fi) sin(fi)];
    B = [b0; b1; b2; b3];
elseif m==3
    % 1/8*b0 + 3/8*b1 + 3/8*b2 + 1/8*b3 = (1,0)! (pri b3 je 1/8 ne 1/3 kot
    % na pdfju) - dobimo po deCastejau
    b0 = [cos(fi) -sin(fi)];
    b1 = 1/3.*[(4-cos(fi)) (4*cot(fi)-4/sin(fi)+sin(fi))];
    b2 = 1/3.*[(4-cos(fi)) (-4*cot(fi)+4/sin(fi)-sin(fi))];
    b3 = [cos(fi) sin(fi)];
    B = [b0; b1; b2; b3];
end


end
