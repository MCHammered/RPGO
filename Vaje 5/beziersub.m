function BS = beziersub(B,t,k)
% Opis:
% beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija:
% BS = beziersub(B,t)
%
% Vhodni podatki:
% B matrika kontrolnih točk Bezierjeve krivulje, v kateri
% vsaka vrstica predstavlja eno kontrolno točko,
% t parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
% BS celica, ki vsebuje kontrolne točke dveh krivulj, ki jih
% dobimo s subdivizijo prvotne Bezierjeve krivulje

n = size(B,1);

% celica
BS{1} = B;
for j=1:k
    C = cell(1,2*length(BS));
    for i=1:length(BS)
        % izvedemo deCasteljaujev algoritem na danem parametru
        X = decasteljau(BS{i}(:,1),t);
        Y = decasteljau(BS{i}(:,2),t);

        % levi del
        cL = [X(1,:)' Y(1,:)'];

        % desni del
        cD = NaN(n,2);
        for r=1:n
            cD(r,:) = [X(r,n+1-r) Y(r,n+1-r)];
        end

        C{2*i-1} = cL;
        C{2*i} = cD;
    end
    BS = C;
end

end
