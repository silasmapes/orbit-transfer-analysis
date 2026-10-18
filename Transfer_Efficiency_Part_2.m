%%% ======= Transfer Efficiency Example 2 ======= %%%

clear; clc; close all

dv = struct();

%%% ----- Transfer ΔV's ----- %%%
dv.ho1 = hohmann(2,5);
dv.ho2 = hohmann(10,15.58);
dv.ho3 = hohmann(25,30);

dv.bi1 = bielliptic(2,5);
dv.bi2 = bielliptic(10,15.58);
dv.bi3 = bielliptic(40,30);



%%% ----- Hohmann Transfer Function ----- %%%
function [dv_ho] = hohmann(a,b)
    figure;
    hold on

    % Delta V Calcualtions
    dv_ho = 1/sqrt(a) - (sqrt(2)*(1-a))/sqrt(a*(1+a)) - 1;
    
    % Orbit Setup
    rA = 1;
    rB = b.*rA;
    rC = a.*rA;

    % Circular Orbits (Initial & Final Orbits)
    th_cir = linspace(0,2*pi,300);
    x1 = rA.*cos(th_cir);
    y1 = rA.*sin(th_cir);
    x2 = rC.*cos(th_cir);
    y2 = rC.*sin(th_cir);

    plot(x1,y1,'k','LineWidth',3,'DisplayName','Inital Orbit')
    plot(x2,y2,'Color','#91fb2b','LineWidth',3,'DisplayName','Target Orbit')

    % Hohmann Orbit (Transfer Orbit)
    th_el = linspace(0,pi,300);
    at = (rA + rC)./2;
    et = (rC - rA)./(rC + rA);
    rt = at.*(1 - et.^2)./(1 + et.*cos(th_el));
    xt = rt.*cos(th_el);
    yt = rt.*sin(th_el);

    plot(xt,yt,'Color','#fb422b','LineWidth',3,'DisplayName','Hohmann Transfer Orbit')

    % Plot Annotations
    legend;
    axis equal padded
    grid on

    % Hohmann deltaV arrows
    quiver(rA,0,0,1,5,'Color','#fb422b','DisplayName','ΔV: Hohmann 1','LineWidth',2,'MaxHeadSize',1)
    quiver(-rC,0,0,-1,5,'Color','#6cbc1f','DisplayName','ΔV: Hohmann 2','LineWidth',2,'MaxHeadSize',1)
end



%%% ----- Bielliptic Transfer Function ----- %%%
function [dv_bi] = bielliptic(a,b)
    figure;
    hold on

    % Delta V Calcualtions
    dv_bi = abs(sqrt(2*b/(1+b))-1) + abs(sqrt(2*a/(b*(a+b))) - sqrt(2/(b*(1+b)))) + abs(sqrt(2*b/(a*(a+b))) - sqrt(1/a));
    
    % Orbit Setup
    rA = 1;
    rB = b.*rA;
    rC = a.*rA;

    % Circular Orbits (Initial & Final Orbits)
    th_cir = linspace(0,2*pi,300);
    x1 = rA.*cos(th_cir);
    y1 = rA.*sin(th_cir);
    x2 = rC.*cos(th_cir);
    y2 = rC.*sin(th_cir);

    plot(x1,y1,'k','LineWidth',3,'DisplayName','Inital Orbit')
    plot(x2,y2,'Color','#91fb2b','LineWidth',3,'DisplayName','Target Orbit')

    % Bielliptic Orbits (Transfer Orbits)
    th_el1 = linspace(0,pi,300);
    th_el2 = linspace(pi,2*pi,300);

    at1 = (rA + rB)./2;
    at2 = (rB + rC)./2;

    et1 = (rB - rA)./(rB + rA);
    et2 = (rB - rC)./(rC + rB);

    rt1 = at1.*(1 - et1.^2)./(1 + et1.*cos(th_el1));
    rt2 = at2.*(1 - et2.^2)./(1 + et2.*cos(th_el2));

    xt1 = rt1.*cos(th_el1);
    yt1 = rt1.*sin(th_el1);
    xt2 = rt2.*cos(th_el2);
    yt2 = rt2.*sin(th_el2);

    plot(xt1,yt1,'Color','#2ba0fb','LineWidth',3,'DisplayName','Bielliptic Transfer Orbit 1')
    plot(xt2,yt2,'Color','#264fc3','LineWidth',3,'DisplayName','Bielliptic Transfer Orbit 2')

    % Plot Annotations
    legend;
    axis equal padded
    grid on

    % Bielliptic deltaV arrows
    quiver(rA,0,0,1,8,'Color','#2ba0fb','DisplayName','ΔV: Bielliptic 1','LineWidth',2,'MaxHeadSize',1)
    quiver(-rB,0,0,-1,8,'Color','#264fc3','DisplayName','ΔV: Bielliptic 2','LineWidth',2,'MaxHeadSize',1)
    quiver(rC,0,0,-1,8,'Color','#6cbc1f','DisplayName','ΔV: Bielliptic 3','LineWidth',2,'MaxHeadSize',1)
end
