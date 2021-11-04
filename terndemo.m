

clear all; 

%% Simple two-d plot (data points and a model fit)

dataA = linspace(0.1, 0.7, 20);
dataB = -dataA.^2 + dataA + (rand(size(dataA)) - 0.5)/7;
dataC = 1 - dataA - dataB;

A = linspace(0, 1, 100);
B = -A.^2+A;

figure;
set(gcf,'defaultaxesfontsize',18);
hdata = ternplot(dataA,dataB,dataC, 'majors', 10, 'r.', 'markersize',20);
hold on;
hmodel = ternplot(A,B,(1-A-B),'linewidth',3);
ternlabel('A', 'B', 'C')
% vertexlabel('A', 'B', 'C'); % check usual vertex labeling
legend([hdata, hmodel], {'data','model'});


%% surface plots (for continuous data)

clear all;

experimental = [...
    1.000	0.000	0.000
    0.000	1.000	0.000
    0.000	0.000	1.000
    0.500	0.500	0.000
    0.500	0.000	0.500
    0.000	0.500	0.500
    0.333	0.333	0.333
    0.750	0.250	0.000
    0.250	0.750	0.000
    0.750	0.000	0.250
    0.250	0.000	0.750
    0.000	0.750	0.250
    0.000	0.250	0.750
    0.667	0.167	0.167
    0.167	0.667	0.167
    0.167	0.167	0.667
    0.000	0.900	0.100];
data = [...
    0.139
    0.373
    0.089
    0.151
    0.056
    0.679
    0.095
    0.153
    0.178
    0.084
    0.040
    0.463
    0.163
    0.111
    0.170
    0.072
    0.333];

A = experimental(:, 1)';
B = experimental(:, 2)';
C = 1 - (A + B);

figure; 
set(gcf,'defaultaxesfontsize',18);
ternscatter(A, B, C, data); 
ternlabel('A', 'B', 'C')
colorbar;

figure; 
set(gcf,'defaultaxesfontsize',18);
ternpcolor(A, B, data); shading interp
ternlabel('A', 'B', 'C')
colorbar;

figure; 
set(gcf,'defaultaxesfontsize',18);
ternpcolor(A, B, C, data, 10); shading interp
ternlabel('A', 'B', 'C')

figure; 
set(gcf,'defaultaxesfontsize',18);
terncontour(A, B, data); 
ternlabel('A', 'B', 'C')
    
