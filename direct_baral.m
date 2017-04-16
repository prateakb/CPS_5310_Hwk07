
% Direct Method to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------

function tempvar = direct_baral
 
%Enter the data and the initial guess.
 
t_vector = [1:25];
hare = [3 0.85 1.48 0.6 0.9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 0.5 1 0.5 5.8 3.6 2.3 3];
lynx = [ 3 1.8 4.3 6.2 1 0.8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 0.8 1 2 5.8 4 1];
p = [.85 1.8 .1 .100 .100 .01000]; %first two parameters are intitial population growth
% we use the fminsearch as follows:
 
[p,fval,tempvar] = fminsearch(@leastcomp,p,[],t_vector,hare,lynx);
p
a = p(3);
b = p(4);
r = p(5);
c = p(6);
fprintf('The parameters using direct method are:\n')
fprintf(' a = %f\n b = %f\n r = %f\n c = %f\n',a,b,r,c)
fval
 
function evalt = leastcomp(p,tvec,xdata,ydata)
%Create the least squares error function to be minimized.
n1 = length(tvec);
[t,y] = ode23(@lv_rhs,tvec,[p(1),p(2)],[],p(3),p(4),p(5),p(6)); 
errx = y(:,1)-xdata(1:n1)';
erry = y(:,2)-ydata(1:n1)';
evalt = errx'*errx + erry'*erry;
 
function vale = lv_rhs(t,y,a1,a2,b1,b2)
% Predator and Prey Model 
tmp1 = a1*y(1) - a2*y(1)*y(2);
tmp2 = -b1*y(2) + b2*y(1)*y(2);
vale = [tmp1; tmp2]
 
 
 


