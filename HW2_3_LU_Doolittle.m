clear
clc

tic
n = 5;
A = diag(4*ones(n,1),0) + ...
    diag(-1*ones(n-1,1),1) + ...
    diag(-1*ones(n-1,1),-1) ;
b = ones(n,1) ;

[m,n]=size(A);
L = zeros(size(A));
U = zeros(size(A));
U(1,:) = A(1,:);
L(:,1) = A(:,1)/U(1,1);
L(1,1) = 1;
for k=2:m
for i=2:m
    for j=i:m
        U(i,j) = A(i,j) - dot(L(i,1:i-1),U(1:i-1,j));
    end
    L(i,k) = (A(i,k) - dot(L(i,1:k-1),U(1:k-1,k)))/U(k,k);
end
end

y = L\b;
x = U\y;
L
U
disp(x)
toc
