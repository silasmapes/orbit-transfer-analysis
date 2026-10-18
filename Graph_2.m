%%% ----- Transfer Efficiency Graph 2 ----- %%%

% Creates and formats the graph
figure();
hold on
grid("on")
xlim([0 100]);
ylim([0.2 0.75]);
xlabel('r_C/r_A','FontSize',20)
ylabel('Δv/v_A','FontSize',20)
title('Transfer Efficency Comparision: Δv/v_A v. r_C/r_A','FontSize',20)

% Equation for Hohmann line
dv_ho_vA = @(a) 1/sqrt(a) - (sqrt(2)*(1-a))/sqrt(a*(1+a)) - 1;

% Reference equation for Bielliptic lines
% dv_bi_vA = @(a,b) (sqrt(2*b/(1+b))-1) + (sqrt(2*a/(b*(a+b))) - sqrt(2/(b*(1+b)))) + (sqrt(2*b/(a*(a+b))) - sqrt(1/a));

% Creates Bielliptic equations for each b value
dv_bi_vA_5 = @(a) abs(sqrt(2*5/(1+5))-1) + abs(sqrt(2*a/(5*(a+5))) - sqrt(2/(5*(1+5)))) + abs(sqrt(2*5/(a*(a+5))) - sqrt(1/a));
dv_bi_vA_1194 = @(a) abs(sqrt(2*11.94/(1+11.94))-1) + abs(sqrt(2*a/(11.94*(a+11.94))) - sqrt(2/(11.94*(1+11.94)))) + abs(sqrt(2*11.94/(a*(a+11.94))) - sqrt(1/a));
dv_bi_vA_1558 = @(a) abs(sqrt(2*15.58/(1+15.58))-1) + abs(sqrt(2*a/(15.58*(a+15.58))) - sqrt(2/(15.58*(1+15.58)))) + abs(sqrt(2*15.58/(a*(a+15.58))) - sqrt(1/a));
dv_bi_vA_20 = @(a) abs(sqrt(2*20/(1+20))-1) + abs(sqrt(2*a/(20*(a+20))) - sqrt(2/(20*(1+20)))) + abs(sqrt(2*20/(a*(a+20))) - sqrt(1/a));
dv_bi_vA_30 = @(a) abs(sqrt(2*30/(1+30))-1) + abs(sqrt(2*a/(30*(a+30))) - sqrt(2/(30*(1+30)))) + abs(sqrt(2*30/(a*(a+30))) - sqrt(1/a));
dv_bi_vA_50 = @(a) abs(sqrt(2*50/(1+50))-1) + abs(sqrt(2*a/(50*(a+50))) - sqrt(2/(50*(1+50)))) + abs(sqrt(2*50/(a*(a+50))) - sqrt(1/a));
dv_bi_vA_100 = @(a) abs(sqrt(2*100/(1+100))-1) + abs(sqrt(2*a/(100*(a+100))) - sqrt(2/(100*(1+100)))) + abs(sqrt(2*100/(a*(a+100))) - sqrt(1/a));
dv_bi_vA_inf = @(a) (sqrt(2)-1) + (sqrt(2)-1)*sqrt(1/a);

% Plots teh Hohmann equation and each Bielliptic equation
fplot(dv_ho_vA,'k','LineWidth',3)
fplot(dv_bi_vA_5,'Color','#fb422b')
fplot(dv_bi_vA_1194,'Color','#fb602b')
fplot(dv_bi_vA_1558,'Color','#fbbd2b')
fplot(dv_bi_vA_20,'Color','#91fb2b')
fplot(dv_bi_vA_30,'Color','#2bfbcf')
fplot(dv_bi_vA_50,'Color','#2ba0fb')
fplot(dv_bi_vA_100,'Color','#8d2bfb')
fplot(dv_bi_vA_inf,'Color','#fb422b','LineStyle','--')

% Plots lines to show ambigious region between hohmann and bielliptic
% deltaV's
line([11.94 11.94],[0.2 0.8],'Color','k','LineStyle','--')
line([15.58 15.58],[0.2 0.8],'Color','k','LineStyle','--')

% Text annotations to identify each line on the graph
fontsize = 15;
text(35,0.73,'r_B/r_A = 5','FontSize',fontsize,'Color','#fb422b')
text(55,0.69,'11.94','FontSize',fontsize,'Color','#fb602b')
text(65,0.665,'15.58','FontSize',fontsize,'Color','#fbbd2b')
text(78,0.645,'20','FontSize',fontsize,'Color','#91fb2b')
text(83,0.61,'30','FontSize',fontsize,'Color','#2bfbcf')
text(88,0.56,'50','FontSize',fontsize,'Color','#8d2bfb')
text(93,0.51,'100','FontSize',fontsize,'Color','#8d2bfb')
text(93,0.47,'\infty','FontSize',25,'Color','#fb422b')
text(7,0.35,'Hohmann','FontSize',20,'LineWidth',3,'Rotation',90)
text(10.94,0.25,'11.94','Rotation',90)
text(16.58,0.25,'15.58','Rotation',90)
