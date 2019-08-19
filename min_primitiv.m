function [x,U]=min_primitiv(f,I,ua,h,k)
% min_primitiv l�ser begynelsev�rdesproblem
%f�r att anvenda Eulers fram�t metod s� skall k<1
%f�r att ist�llet anv�nda trapetsmetoden akall k>1
clf
clc

if length(I)>2 | length(I)<2 %#ok<*OR2>
   disp(' Men hur fan t�nkte du nu...')
   disp('I �r det intervallet som som du vill intergrera mellan')
   disp(' I M�STE allts� vara en 1x2 matris d�r I(:,1) �r starten och I(:,2) �r sluter')
   
else

    if length(ua)>1 | length(ua)<1
        disp(' Men hur fan t�nkte du nu...')
        disp('ua �r begynnelse v�rdet') 
        disp('allts� vilket v�rde som funktionen skall anta d� x=0')
    else
        N=(I(:,2)-I(:,1))/h;
        x=zeros(1,N)'; 
        U=zeros(1,N)';
        x(1)=I(:,1);
        U(1)=ua;
 
        for i=1:N;
            x(i+1)=x(i)+h ;
            if k<1; 
                U(i+1)=U(i)+h*f(x(i));
            else 
                U(i+1)=U(i)+(h/2)*(f(x(i))+f(x(i+1)));
            end
        end
        if k<100
            if h<=0.5
                disp('Sm� steg ger m�nga v�rden')
                disp('detta kan vara sv�r �versk�dligt')
                disp('men om du vill skriva ut alla dessa v�lj k>100')
                disp('.')
                plot(x,U)
            
            else
                disp('x')
                disp(x)
                disp('U')
                disp(U)
                plot(x,U)
            end
        else
                disp('x')
                disp(x)
                disp('U')
                disp(U)
                plot(x,U)
        end
        y=linspace(I(:,1)-1,I(:,2)+1,30);
        F=0;
        hold on
        plot(y,F,'r')
        e=linspace(0,U(1),30);
        a=linspace(0,U((I(2)-I(1))/h+1),30);
        plot(I(1),e,'g')
        plot(I(2),a,'g')
        hold off
        
        m1=zeros(length(e),1);
        m1(1)=I(1);
        for i=1:length(e)-1
            m1(i+1,:)=m1(i,:);
        end
        
        m2=zeros(length(a),1);
        m2(1)=I(2);
        for i=1:length(a)-1
            m2(i+1,:)=m2(i,:);
        end
        
        na=zeros(1,length(a));
        na(:,1)=a(length(a));
        for i=1:length(a)-1
            na(:,i+1)=a(length(a)-i);
        end
       
        
  
m=[m1; x; m2; I(2); I(1)];        
n=[e'; U; na'; 0; 0];

k=length(m);
A=0;
for i=1:k-1
A=A+(m(i+1)+m(i))...
    *(n(i+1)-n(i));
end
A=abs(A)/2;
disp('Arean under intergralen') 
disp(A)
fill(m,n,'m')
    end
    
end
end



