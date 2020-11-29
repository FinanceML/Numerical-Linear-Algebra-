clear
clc
tic
n = 5;
A = diag(4*ones(n,1),0) + ...
    diag(-1*ones(n-1,1),1) + ...
    diag(-1*ones(n-1,1),-1) ;
b = ones(n,1) ;
[m, n]=size(A);
U=zeros(size(A));
L=zeros(size(A));
L(:,1)=A(:,1);
U(1,:)=A(1,:)/L(1,1);
U(1,1)=1;
for k=2:m
for j=2:m
    for i=j:m
        L(i,j)=A(i,j)-dot(L(i,1:j-1),U(1:j-1,j));
    end
    U(k,j)=(A(k,j)-dot(L(k,1:k-1),U(1:k-1,j)))/L(k,k);
end
end
y = L\b;
x = U\y;
L
U
disp(x)
toc
