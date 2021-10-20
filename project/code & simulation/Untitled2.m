clc;
close;

ah = [-5.443];
bh = [5.063];
ch = [0.4557;-108.86];
dh = [0.5063;101.266];

[nh,dh] = ss2tf(ah,bh,ch,dh);

ab = [-376.9920 -3.5531e+04;1 0];
bb = [1;0];
cb = [0 3.5531e+04];
db = 0;

[nb,db] = ss2tf(ab,bb,cb,db);

ap = [-376.9920 -3.5531e+04 2;1 0 0;0 1.7989e+05 -5.443];
bp = [1;0;0];
cp = [0 1.7989e+04 0.45557;0 3.5981e+06 -108.86];

s = tf('s');
inverse = inv((s.*eye(3)) - ap);
temp = inverse * bp;
ps = cp * temp