clear
clc

n = 4 ;

A = hilb(n) ;

b = ones(n,1) ;
% w = 1 ;
x0 = zeros(n,1) ;
epsilon1 = 10e-4 ;
epsilon2 = 10e-6 ;
k = 0 ;
X = [];
n = length(b);
x1 = zeros(n,1) ;
y = zeros(n,1) ;
%--------------------------------------------------------
D = diag(diag(A)) ;
U = triu(A) - D ;
L = tril(A) - D ;
%--------------------------------------------------------
MJ = -inv(D)*(L + U) ;
EMJ = eig(MJ) ;
ROMJ = max(abs(EMJ));
w = 2 / (1+sqrt(1 - (ROMJ)^2));
%--------------------------------------------------------
x1 = -inv(D + w*L)*((w-1)*D + w*U)*x0 + w*inv(D + w*L)*b ;
   k = k + 1 ;
   X = [X  x0  x1];
%--------------------------------------------------------
while(norm(x1 - x0,inf)) > epsilon1
    y = -inv(D + w*L)*((w-1)*D + w*U)*x1 + w*inv(D + w*L)*b ;
    x0 = x1 ;
    x1 = y ;
    k = k + 1 ;
    X = [X  y];

end
 
 X ;
 x1
 k
 w