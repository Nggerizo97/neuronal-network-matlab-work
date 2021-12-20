function [fitness] = fitness1(genotipo)
global v z w
num=[10];
de=[1 1 1];

sys2=tf(num,de);

num1=[0.09206 0.2095 0.1192];
den=[1 0];

sys1=tf(num1,den);

sys=series(sys1,sys2);
cloop=feedback(sys,1);

[v,z]=step(cloop,0:0.1:20);


fitness=0;

num22=[10];
de22=[1 1 1];
sys22=tf(num22,de22);
%funcion de transferencia

num11=[genotipo];%genero valores para kd kp ki
den=[1 0];
sys11=tf(num11,den);
%se genera una funcionde trasferencia kd kp ki aleatoria

sys1=series(sys11,sys22);
cloop1=feedback(sys1,1);

[w,z]=step(cloop1,0:0.1:20);%pasos de 0.1 hasta 20

valor= abs(v-w);% V es el deseado y W valor generado por secuencia

fitness=sum(valor);
end