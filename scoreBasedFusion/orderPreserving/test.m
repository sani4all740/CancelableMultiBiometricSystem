[G1,I1,G2,I2]=testScore();
G=merge(G1,G2);
I=merge(I1,I2);
mus=nanmean(G);
mud=nanmean(I);
vars=nanvar(G);
vard=nanvar(I);
di=abs(mus-mud)/sqrt((vars+vard)/2);
[EER,~,~,~,~]=EER_DET_conf(G,I,0.1,10000);