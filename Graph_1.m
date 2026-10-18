%%% ----- Transfer Efficiency Graph 1 ----- %%%

clear; clc, close all

% Creates and formats the graph
figure();
hold on
xlim([0 30])
ylim([0 100])
xlabel("r_C/r_A",'FontSize',20)
ylabel("r_B/r_A",'FontSize',20)
title('Transfer Efficency Comparision: r_B/r_A v. r_C/r_A','FontSize',20)

% Creates bound for B > A in graph
bound = @(a) a;
fplot(bound,[0 30],'k','LineWidth',3)           % Plots line
fill([0 30 30],[0 0 30],'k','FaceAlpha',0.3)    % Fills in grey below the line

% Creates line defining where both transfers have the same deltaV
a = linspace(0,100,500);
b = linspace(1.01,100,500);
[A,B] = meshgrid(a,b);
Z = ((1./sqrt(A)) - (sqrt(2).*(1-A))./sqrt(A.*(1+A)) - 1)./(sqrt((2.*(A+B))./(A.*B)) - (1+sqrt(A))./sqrt(A) - sqrt(2./(B.*(1+B))).*(1-B)) - 1;
Z(B<=A) = NaN;                  % Removes values where b < a

contourf(A,B,Z,[-Inf 0 Inf],'k','LineWidth',3)  % Plots line where the deltaV's are equal and adds colors to each region
colormap([108 188 31; 43 160 251]/255);         % Defines more user-friendly colors

% Adds annotations to communicate what each region and line represents
text(3,60,'Hohmann Transfer','FontSize',20)
text(17,60,'Bielliptic Transfer','FontSize',20)
text(20,15,'\uparrow r_B = r_C','FontSize',20)
text(7.7,80,'ΔV_H_E = ΔV_B_I \rightarrow','FontSize',20)

% Adds lines to define ambigious region between hohmann and bielliptic
% deltaV's
line([11.94 11.94],[11.94 100],'Color','k','LineStyle','--')
line([15.58 15.58],[15.58 100],'Color','k','LineStyle','--')
text(9,25,'11.94 \rightarrow','FontSize',20)
text(15.88,25,'\leftarrow 15.58','FontSize',20)
