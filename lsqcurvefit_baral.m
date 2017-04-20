
% Least square curve fit to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------


H = [0.3 .85 1.48 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3]';
L = [0.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1]';


yvec=[H;L]; 
tvec=1:25;
nlin_fn = @lynxhare_resid;
b_0 = [.34; .09; .07; .02; .3; .3]; 
nparams = length(b_0);

lb = []; % lower bound for parameters
ub = []; % upper bound for parameters
options = optimset('Algorithm','levenberg-marquardt','Display','off');
b_opt = lsqnonlin(nlin_fn,b_0,lb,ub,options,tvec,yvec);
fprintf('The parameters using LSQ Method are: \n');
fprintf('a = %f\n', b_opt(1));
fprintf('b = %f\n', b_opt(2));
fprintf('r = %f\n', b_opt(3));
fprintf('c = %f\n', b_opt(4));
[tvec,model_opt] = ode45(@lynxhare_rhs,tvec,[b_opt(5); b_opt(6)],[],b_opt(1:4));
H_opt = model_opt(:,1);
L_opt = model_opt(:,2);
figure(1)
  subplot(211)
    plot(tvec,H,'o',tvec,H_opt,'k')
    title('Data and Model Fit: Hare')
  subplot(212)
    plot(tvec,L,'o',tvec,L_opt,'k')
    title('Data and Model Fit: Linx')
