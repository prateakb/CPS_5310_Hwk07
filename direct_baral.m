
% Direct Method to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------
function tempvar = direct_baral

%Enter the data and the initial guess.

t_vec = [1:25];
hare=[.3 .85 1.48 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3];
lynx=[.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1];
hare = 10*hare;
lynx = 10*lynx;
p = [0.3 0.3 0.346 0.00970 0.07600 0.0022000];

[p,fval,tempvar] = fminsearch(@leastcomp,p,[],t_vec,hare,lynx);
p
disp(['The parameter values using Direct_Method are:'])
fprintf('a=%f\n', p(3))

fprintf('b=%f\n', p(4))

fprintf('r=%f\n', p(5))

fprintf('c=%f\n', p(6))
fval

function J = leastcomp(p,tdata,xdata,ydata)
%Create the least squares error function to be minimized.
n1 = length(tdata);
[t,y] = ode23(@lotvol,tdata,[p(1),p(2)],[],p(3),p(4),p(5),p(6)); 
errx = y(:,1)-xdata(1:n1)';
erry = y(:,2)-ydata(1:n1)';
J = errx'*errx + erry'*erry;

function dydt = lotvol(t,y,a1,a2,b1,b2)
% Predator and Prey Model 
tmp1 = a1*y(1) - a2*y(1)*y(2);
tmp2 = -b1*y(2) + b2*y(1)*y(2);
dydt = [tmp1; tmp2]