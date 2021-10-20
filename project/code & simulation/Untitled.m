clc;
clear;

s = tf('s');
g1 = 10/((s+4)*(s+8));
g2 = 5/((s+6)*(s+13));
[nc1,dc1] = tfdata(g1);
n1 = cell2mat(nc1);
d1 = cell2mat(dc1);

[nc2,dc2] = tfdata(g2);
n2 = cell2mat(nc2);
d2 = cell2mat(dc2);
[a1,b1,c1,d1] = tf2ss(n1,d1)
[a2,b2,c2,d2] = tf2ss(n2,d2)

g = series(g1,g2);
[nc,dc] = tfdata(g);
n = cell2mat(nc);
d = cell2mat(dc);

[a,b,c,d] = tf2ss(n,d)