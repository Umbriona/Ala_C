clc
a=[1; 2; 3; 4; 5]

b=zeros(length(a),1);
b(1,:)=a(length(a));
for i=1:length(a)-1
    b(i+1,:)=a(length(a)-i);
end
b
%%
f=@(x) x;
I=[0 1];
ua=0;
h=0.01;
k=8;
min_primitiv(f,I,ua,h,k);