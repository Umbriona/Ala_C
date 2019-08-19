function [t,U]=min_ode(f,I,ua,h,k)
N=(I(:,2)-I(:,1))/h;
a=I(:,1);
t=zeros(1,N);
U=zeros(1,N);
t(1)=a;
U(1)=ua;
 
 
for i=1:N
t(i+1)=t(i)+h;
if k<1
U(i+1)=U(i)+h*f(t(i),U(i));
else
U(i+1)=U(i)+(h/2)*(f(t(i),U(i))+f(t(i+1),U(i+1))); 
end
end
 
disp('t')
disp(t)
 
disp('U')
disp(U)
 
plot (t,U)
end
