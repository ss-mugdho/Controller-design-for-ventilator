clc;
clearvars;
Rlung = 5/1000;
Clung = 20;
Rleak = 60/1000;
Rhose = 4.5/1000;

Ah = -((1/Rhose)+(1/Rleak))/(Rlung*Clung*((1/Rlung)+(1/Rhose)+(1/Rleak)))
Bh = (1/Rhose)/(Rlung*Clung*((1/Rlung)+(1/Rhose)+(1/Rleak)))
Ch = [(1/Rlung)/((1/Rlung)+(1/Rhose)+(1/Rleak));...
      -((1/Rhose)+(1/Rleak))/(Rlung*((1/Rlung)+(1/Rhose)+(1/Rleak)))]
Dh = [(1/Rhose)/((1/Rlung)+(1/Rhose)+(1/Rleak));...
      (1/Rhose)/(Rlung*((1/Rlung)+(1/Rhose)+(1/Rleak)))]
s = tf('s');
Hs = Ch*inv((s*eye(1) - Ah))*Bh + Dh
