function R = lynxhare_resid(b,tvec,yvec)
 
% This function numerically evaluates
%
% X(t) = [X1(t);X2(t)]
%
% which satisfies the predator-prey equation.
%
%  dX1/dt =  p(1)*X1 - p(2)*X1*X2
%  dX2/dt = -p(4)*X2 + p(3)*X1*X2
%  X1(0) = bp5), X2(0) = p(6).
% 
 
%tvec = tvec(1:length(tvec)/2);
[tvec,Xsoln] = ode45(@lynxhare_rhs,tvec,[b(5); b(6)],[],b(1:4));
R = yvec-Xsoln(:);

