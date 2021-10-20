clc;
clearvars;

ki = [0 0.4 10];
wn = 2*3.1416*30;
zeta = 1;
s = tf('s');
Hs = [(0.5063*s + 5.063)/(s + 5.443);...
      (101.3*s + 1.137e-13)/(s + 5.443)];
Bs = (wn^2)/(s^2+(2*zeta*wn*s)+wn^2);
Ps = Hs.*Bs;
% Cs = ki/s;
% Geq_Paw = (Cs*Ps(1)+Ps(1));
% Closed_Paw = feedback(Geq_Paw,1);
% Closed_Paw = (Ps(1)+(Cs*Ps(1)))/(1+(Cs*Ps(1)));
% Closed_Qpat = (Closed_Paw/Hs(1))*Hs(2);
t = 0:0.01:10;
in = 5*ones(1,length(t));
in(101:501) = 20;
% plot(t,in)
clrs = ['r' 'g' 'b'];
for i = 1:length(ki)
    Cs(i) = ki(i)/s;
    Closed_Paw(i) = (Ps(1)+(Cs(i)*Ps(1)))/(1+(Cs(i)*Ps(1)));
    Closed_Qpat(i) = (Ps(2)+(Cs(i)*Ps(2)))/(1+(Cs(i)*Ps(1)));
    figure(1)
    lsim(Closed_Paw(i),clrs(i),in,t)
    hold on
    figure(2)
    lsim(Closed_Qpat(i),clrs(i),in,t)
    hold on
end