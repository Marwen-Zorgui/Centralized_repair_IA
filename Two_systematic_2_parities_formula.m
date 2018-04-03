clc
clear
%% Constructing the matrix for 4 erasures: l1=1, l2=2, m1=1, m2=2
% the vector of unknows is  
% s=[r12  s11  s12  r21  s21  s22  r12_  s11_  s12_  r21_   s21_  s22_ ]
%     1    2    3    4    5    6    7     8     9     10     11    12 
% underscore denotes the prime notation Pij_ = (P^(-1)^t)ij= P^(-1)ij
syms P11 P11_  P12 P12_ P21 P21_ P22 P22_  k  
e=4;N=e*(e-1);
%% Constructing the matrix A: A is 12 by 12

%%%%%% Information from by systematic node 1
A(1,4)=-k;
A(1,8)=k* P21_;
A(1,11)=k* P22_;

A(2,4)= -P21;  
A(2,8)=  1-(k*P11*P11_)/(1+k) ;
A(2,11)= (-k/(k+1))*P11 *P12_ ;

A(3,4)= -P22;  
A(3,8)=  (-k/(k+1))*P12 *P11_ ;
A(3,11)= 1-(k*P12*P12_)/(1+k) ;
%%%%%% Information from by systematic node 2
A(4,1)= -k;  
A(4,9)=  k*P11_ ;
A(4,12)= k*P12_  ;

A(5,1)= -P11;  
A(5,9)=  1-(k*P21*P21_)/(1+k);
A(5,12)=  (-k/(k+1))*P21 *P22_ ;

A(6,1)= -P12 ;  
A(6,9)=  (-k/(k+1))*P22 *P21_  ;
A(6,12)=   1-(k*P22*P22_)/(1+k) ;

%%%%%% Information from by parity node 1
A(7,2)= ((1-k^2)/k)*P12;
A(7,5)=((1-k^2)/k)*P22;
A(7,10)= k ;

A(8,2)= 1-k^2+ k*(1+k)*P11*P11_ ;  
A(8,5)=  k*(k+1)*P11_*P21 ;  
A(8,10)=  k^2*P12_ ;

A(9,2)=  k*(k+1)*P21_*P11 ;  
A(9,5)=  1-k^2+ k*(1+k)*P21*P21_ ;
A(9,10)= k^2*P22_ ;
%%%%%% Information from by parity node 2
A(10,3)= ((1-k^2)/k)*P11;
A(10,6)=  ((1-k^2)/k)*P21  ;
A(10,7)= k ;

A(11,3)=  1-k^2+ k*(1+k)*P12*P12_ ;
A(11,6)= k*(k+1)*P12_*P22;
A(11,7)=  k^2*P11_;

A(12,3)=  k*(k+1)*P22_*P12; 
A(12,6)= 1-k^2+ k*(1+k)*P22*P22_; 
A(12,7)= k^2*P21_ ;
%%%%%% 
for i=1:N
    A(i,i)=-1;
end
A
%%
y=det(A)
y=factor( y )
y(13)
