clc;
clearvars;

ki = 1;
wn = 2*3.1416*30;
zeta = 1;
s = tf('s');
Hs = [(0.5063*s + 5.063)/(s + 5.443);...
      (101.3*s + 1.137e-13)/(s + 5.443)];
Bs = (wn^2)/(s^2+(2*zeta*wn*s)+wn^2);
Ps = Hs.*Bs;
Cs = ki/s;
% Geq_Paw = (Cs+1)*Ps(1);
% Closed_Paw = feedback(Geq_Paw,1);
Closed_Paw = (Ps(1)+(Cs*Ps(1)))/(1+(Cs*Ps(1)));
% Closed_Qpat = Ps(2)*(1+(Cs*(1-Closed_Paw)));
Closed_Qpat = (Ps(2)+(Cs*Ps(2)))/(1+(Cs*Ps(1)));