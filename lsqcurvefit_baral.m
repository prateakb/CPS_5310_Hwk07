
% Least square curve fit to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------

clear all, close all

 H = [ 3 0.85 1.48 0.6 0.9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 0.5 1 0.5 5.8 3.6 2.3 3]';
 L = [ 3 1.8 4.3 6.2 1 0.8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 0.8 1 2 5.8 4 1]';
 
  H = 10*H;
  L=10*L;
 
% 
yvec=[H;L]; 
% tvec=zeros(size(yvec)); tvec(1:25)=1:2:50;
% tvec=1:2:length(H)*2;
tvec = 1:length(H);
nlin_fn = @lynxhare_resid;
p_0 = [1.181; 0.04; 1; 1; 3; 3]; %last two parameters are initial populations
nparams = length(p_0);
%npts = length(yvec);
 
%using lsq fit
lb = []; % lower bound for parameters
ub = []; % upper bound for parameters
options = optimset('Algorithm','levenberg-marquardt','Display','off');
p_opt = lsqnonlin(nlin_fn,p_0,lb,ub,options,tvec,yvec);
 
 
% Compute the optimal fit and plotting.
[tvec,model_opt] = ode45(@lynxhare_rhs,tvec,[p_opt(5); p_opt(6)],[],p_opt(1:4));
H_opt = model_opt(:,1);
L_opt = model_opt(:,2);
figure(1)
  subplot(211)
    plot(tvec,H,'o',tvec,H_opt,'k')
    title('Data and Model Fit: Hare')
  subplot(212)
    plot(tvec,L,'o',tvec,L_opt,'k')
    title('Data and Model Fit: Linx')
    


