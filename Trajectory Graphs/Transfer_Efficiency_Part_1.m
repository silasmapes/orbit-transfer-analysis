%%% ======= Transfer Efficiency Example 1 ======= %%%

clear; clc; close all

dv = struct();

% Given orbit radii ratios
[dv.ho1, dv.bi1] = transfer(10,40);
[dv.ho2, dv.bi2] = transfer(25,40);
[dv.ho3, dv.bi3] = transfer(25,20);

[dv.ho4, dv.bi4] = transfer(5,3);
[dv.ho5, dv.bi5] = transfer(5,7);
[dv.ho6, dv.bi6] = transfer(15.58,13);
[dv.ho7, dv.bi7] = transfer(15.58,17);
[dv.ho8, dv.bi8] = transfer(30,25);
[dv.ho9, dv.bi9] = transfer(30,35);

% Function to create plots and determine efficency
function [dv_ho, dv_bi] = transfer(a,b)
    figure;
    hold on

    % Delta V Calcualtions
    dv_ho = 1/sqrt(a) - (sqrt(2)*(1-a))/sqrt(a*(1+a)) - 1;
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

    % Hohmann Orbit (Transfer Orbit)
    th_el = linspace(0,pi,300);
    at = (rA + rC)./2;
    et = (rC - rA)./(rC + rA);
    rt = at.*(1 - et.^2)./(1 + et.*cos(th_el));
    xt = rt.*cos(th_el);
    yt = rt.*sin(th_el);

    plot(xt,yt,'Color','#fb422b','LineWidth',3,'DisplayName','Hohmann Transfer Orbit')

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

    % Hohmann deltaV arrows
    quiver(rA,0,0,1,5,'Color','#fb422b','DisplayName','ΔV: Hohmann 1','LineWidth',2,'MaxHeadSize',1)
    quiver(-rC,0,0,-1,5,'Color','#6cbc1f','DisplayName','ΔV: Hohmann 2','LineWidth',2,'MaxHeadSize',1)
end
