function B = beziercubspline(u,D)
% Opis:
% beziercubspline izračuna sestavljeno Bezierjevo krivuljo stopnje 3,
% ki je dvakrat zvezno odvedljiva v stikih
%
% Definicija:
% B = beziercubspline(u,D)
%
% Vhodna podatka:
% u seznam parametrov delitve dolžine m+1,
% D matrika, v kateri vsaka izmed m+3 vrstic predstavlja eno
% kontrolno točko sestavljene krivulje
%
% Izhodni podatek:
% B celični seznam dolžine m, v kateri je vsak element matrika
% s štirimi vrsticami, ki določajo kontrolne točke kosa
% sestavljene krivulje

d = size(D,2); % dimenzija
m = length(u)-1;
B = cell(m,1);

diffu = diff(u);

% levi rob razen i=3
B{1} = NaN(4,d);
B{1}(1,:) = D(1,:);
B{1}(2,:) = D(2,:);
B{1}(3,:) = diffu(2)/(diffu(1)+diffu(2)).*D(2,:)+diffu(1)/(diffu(1) + diffu(2)).*D(3,:);

% desni rob razen i=0
B{m} = NaN(4,d);
B{m}(4,:) = D(m+3,:);
B{m}(3,:) = D(m+2,:);
B{m}(2,:) = diffu(m)/(diffu(m-1)+diffu(m)).*D(m+1,:)+diffu(m-1)/(diffu(m-1)+diffu(m)).*D(m+2,:);

% notranje točke v vsakem odseku
for i=1:m-2
    B{i+1} = NaN(4,d);
    l1 = (diffu(i+1)+diffu(i+2))/(diffu(i)+diffu(i+1)+diffu(i+2));
    d1 = diffu(i)/(diffu(i)+diffu(i+1)+diffu(i+2));
    B{i+1}(2,:) = l1.*D(i+2,:) + d1.*D(i+3,:);

    l2 = diffu(i+2)/(diffu(i)+diffu(i+1)+diffu(i+2));
    d2 = (diffu(i+1)+diffu(i))/(diffu(i)+diffu(i+1)+diffu(i+2));
    B{i+1}(3,:) = l2.*D(i+2,:) + d2.*D(i+3,:);
end


% stične točke na sosednjih odsekih
for i=1:m-1
    l3 = diffu(i+1)/(diffu(i)+diffu(i+1));
    d3 = diffu(i)/(diffu(i)+diffu(i+1));
    B{i}(4,:) = l3.*B{i}(3,:) + d3.*B{i+1}(2,:);
    B{i+1}(1,:) = B{i}(4,:);
end

end
