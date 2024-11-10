function p = plotbezier(B,t,c)
% Opis:
% plotbezier nariše Bezierjevo krivuljo za dane kontrolne točke in
% seznam parametrov
%
% Definicija:
% p = plotbezier(B,t,c)
%
% Vhodni podatki:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bezierjeve krivulje,
% c opcijski parameter, ki določa barvo krivulje
%
% Izhodni podatek:
% p grafični objekt, ki določa krivuljo

% plot(B(:,1),B(:,2), '.b', 'MarkerSize',20)
% hold on
% plot(B(:,1), B(:,2), 'k')
% hold on
% b = bezier(B,t);
% plot(b(:,1), b(:,2), '-r')

d = size(B,2);
b = bezier(B,t);
if d == 2
    figure('Name', '2-D');
    hold on
    tocke = scatter(B(:,1),B(:,2));
    polyg = plot(B(:,1), B(:,2));
    krivulja = plot(b(:,1), b(:,2));
elseif d == 3
    figure('Name', '3-D');
    hold on
    tocke = scatter3(B(:,1),B(:,2),B(:,3));
    polyg = plot3(B(:,1),B(:,2),B(:,3));
    krivulja = plot3(b(:,1), b(:,2), b(:,3));
end

set(tocke, 'Color', 'k');
set(polyg, 'MarkerFaceColor', c);
set(polyg, 'MarkerEdgeColor', c);
set(krivulja, 'Color', c);
set(krivulja, 'LineWidth', 1.5);



end
