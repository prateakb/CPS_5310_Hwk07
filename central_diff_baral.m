%central difference method to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------
years = 0:2:48
H=[.3 .85 1.48 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3];
L=[.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1];

%problem 1

for i = 1:(length(H)-2)
    y(i)=1/L(i+1)*.5*(L(i+2)-L(i));
    x(i)=H(i+1);
end

%Fitting a line for prey
fit = polyfit(x,y,1);
Ln1 = fit(1)*x+fit(2);
plot(x,y,'o', x, Ln1, 'b-')
a=fit(2)
b = fit(1)


%Fitting a line for predator
for i = 1:(length(H)-2)
    y(i)=1/H(i+1)*.5*(H(i+2)-H(i));
    x(i)=L(i+1);
end
fit = polyfit(x,y,1);
Ln1 = fit(1)*x+fit(2);
plot(x,y,'o', x, Ln1, 'b-')
r = 1*fit(2)
c = fit(1)

fprintf('The parameters using central difference approximation are:\n')
fprintf(' a = %f\n b = %f\n r = %f\n c = %f\n',a,b,r,c)



