function dX = lynxhare_rhs(t,X,b)
% lynxhare_rhs.m
% This function provides the RHS vector valued function for the Lotka
% Volterra system of ODEs
% dx/dt = ax - bxy;
% dy/dt = -ry + cxy;
%with parameters b=(a,b,r,c)’.
% X= (x,y)= (X(1),X(2))
 
 
dX   =[b(1)*X(1)-b(2)*X(1)*X(2);
      -b(4)*X(2)+b(3)*X(1)*X(2)];
 

