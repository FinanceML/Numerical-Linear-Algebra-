clear
clc

n = 3000 ;

AA = hilb(n);
A = AA + (10e-6)*ones(n);

b = ones(n,1) ;


%--------------------------------------------------------

   for j=1:n-1
    for k=2:n
        if A(j,j)==0
            t=A(j,:);
            A(j,:)=A(k,:);
            A(k,:)=t;
        end
    end
    for i=j+1:n
        A(i,:)=A(i,:)-A(j,:)*(A(i,j)/A(j,j));
    end
   end


 
 