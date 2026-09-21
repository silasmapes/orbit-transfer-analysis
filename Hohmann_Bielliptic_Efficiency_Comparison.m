%%% ======= Hohmann v. Bielliptic Efficiency ======= %%%

clear; clc; close all

ho = struct();      % Hohmann Variables
bi = struct();      % Bielliptic Variables

mu = 398600;        % Earth's Graviational Parameter [km^3/s^2]

rA = 7000;
rB = 7500;
rC = 8000;



%%% ----- Hohmann Transfer Calculations ----- %%%

ho.a = (rA + rB)/2;

ho.vA_1 = sqrt(mu/rA);
ho.vA_2 = sqrt(mu*(2/rA - 1/ho.a));
ho.dvA = abs(ho.vA_2 - ho.vA_1);

ho.vB_2 = sqrt(mu*(2/rB - 1/ho.a));
ho.vB_3 = sqrt(mu/rB);
ho.dvB = abs(ho.vB_3 - ho.vB_2);

ho.dv = ho.dvA + ho.dvB;



%%% ----- Bielliptic Transfer Calculations ----- %%%

bi.a2 = (rA + rB)/2;
bi.a3 = (rB + rC)/2;

bi.vA_1 = sqrt(mu/rA);
bi.vA_2 = sqrt(mu*(2/rA - 1/bi.a2));
bi.dvA = abs(bi.vA_2 - bi.vA_1);

bi.vB_2 = sqrt(mu*(2/rB - 1/bi.a2));
bi.vB_3 = sqrt(mu*(2/rB - 1/bi.a3));
bi.dvB = abs(bi.vB_3 - bi.vB_2);

bi.vC_3 = sqrt(mu*(2/rC - 1/bi.a3));
bi.vC_4 = sqrt(mu/rC);
bi.dvC = abs(bi.vC_4 - bi.vC_3);

bi.dv = bi.dvA + bi.dvB + bi.dvC;

dv = bi.dv - ho.dv;


