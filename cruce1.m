function [matriz]= cruce1(padre1,padre2,p,matriz)

      if rand <= 0.9 % creo primara liena de hijo
         v1=padre1(3:3);
         v2=padre2(3:3);
         padre1(3:3)=v2;
         padre2(3:3)=v1;
         
         padre1(:,1)=[];% quito columna 1 de la matriz 
         padre2(:,1)=[];
         %realizo el proceso de fitness para la nueva matriz y nuevos valores
         for t=1:1
         p1(t)=fitness1(padre1);
         p2(t)=fitness1(padre2);
         end

         %ordeno los nuevos valores 
         padre1=[p1' padre1];
         padre2=[p2' padre2];
         
         

         if rand <= 0.3 %mutacion en los hijos
         if padre1(1,1) <= padre2(1,1);
            padre2(1,2) = padre2(1,2) + padre2(1,2)*0.025;
            matriz(p,:)= padre2;
            matriz(p+1,:)= padre1;
         else
            padre1(1,4) = padre1(1,4) + padre1(1,4)*0.025;
            matriz(p,:)= padre2;
            matriz(p+1,:)= padre1;
         end
         else
           padre1;
           padre2;
           matriz(p,:)= padre1;
           matriz(p+1,:)= padre2;
         end
        
      else
         matriz(p,:)=padre1;
         matriz(p+1,:)=padre2;
      
      end
end