clc
clear all
close all

global v z w

n=100;
poblacion= 0.1*rand(n,3); 

for x=1:n
c(x) = fitness1(poblacion(x,:));
end


poblacion=[c' poblacion];
orden=sortrows(poblacion);%ordeno la poblacion en el primer valor de columna


while i <= 100 && orden(1,1) >= 0.1
    
    
      elite1 = orden(1,:); %siempre elijo el menor 
      elite2 = orden(2,:);
      matriz=zeros(n,4);%creo una matriz de ceros
      matriz(1,:)=elite1;
      matriz(2,:)=elite2;
      %matriz = cruce1(padre1,padre2,p,matriz)
      
      
     for p = 3:2:n %la cantidad al final depende de la poblacion escogida
        
          
      % aqui viene el for para añadir hijos
      a=randi([1,n],1);%elijo valores aleatorios
      b=randi([1,n],1);
      c=randi([1,n],1);
      d=randi([1,n],1);
      if a==b %aseguro que los valores no sean iguales
         b=randi([1,n],1);
      end
      if c==d
         d=randi([1,n],1);
      end

      individuo1=orden(a,:);% los individuos aleatorios
      individuo2=orden(b,:);
      individuo3=orden(c,:);
      individuo4=orden(d,:);
      
      if individuo1(1,1) < individuo2(1,1)%eleccion de primer padre
         padre1=individuo1;
      else
         padre1=individuo2;
      end
      
      if individuo3(1,1) < individuo4(1,1)%eleccion de segundo pandre 
         padre2=individuo3;
      else
         padre2=individuo4;
      end
         
      
      % parte del exito del problema 
      % si sabemos como cambiar de forma correcta los vectores
      % el resultado se va a dar rapido y cercano
      
      if padre1 == padre2; % se verifica que no sean iguales 
         padre1(1,3)=rand;
      end  
         
      matriz = cruce1(padre1,padre2,p,matriz);
      
     end
     
      
      matriz(:,1)=[];% quito columna 1 de la matriz 
      %realizo el proceso de fitness para la nueva matriz y nuevos valores
      for t=1:n
      y(t)=fitness1(matriz(t,:));
      end
      
      %ordeno los nuevos valores 
      matrizf=[y' matriz];
      omatriz=sortrows(matrizf);
      %creo nueva poblacion en la anterior
      orden = omatriz;
      
      i=i+1
      elite1
end

plot(z,v)
hold on
plot(z,w)