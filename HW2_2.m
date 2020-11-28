clear
clc
tic
n=1024;
% Hilbert Matrix
for i=1:n
    for j=1:n
    A(i,j)=1/(i+j-1);
    end
end
% A = A+.10^-6;
b=ones(n,1);
x = zeros(n,1);      
for i = 1:n-1
    m = -A(i+1:n,i)/A(i,i); 4
    A(i+1:n,:) = A(i+1:n,:) + m*A(i,:);
    b(i+1:n,:) = b(i+1:n,:) + m*b(i,:);
end

x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
 disp(x)

toc