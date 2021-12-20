function[ciclofor]= para1(orden,n,matriz)
  
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
         
      matriz = cruce1(padre1,padre2,p,matriz)
      
      end
end