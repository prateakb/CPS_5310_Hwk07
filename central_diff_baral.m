%central difference method to approximate the parameters of Lotka Votkerra Models for

% Hare and Lynx Data given by Hudson Bay

% Part of Course of Dr. Sharma- UTEP, Spring '17

% submitted by Pratik Baral

%-------------------------------------------------------------------------------------


years = 1:25
H=[.3 .85 1.48 .6 .9 2.5 5 9 7 1 1.1 4.2 13 5 1.8 4 7.8 3.5 .5 1 .5 5.8 3.6 2.3 3];
L=[.3 1.8 4.3 6.2 1 .8 3 4.7 4.2 1.2 1.3 3.5 7.2 3 2.2 1.5 4 3.6 2.3 .8 1 2 5.8 4 1];

for k=1:23
Y(k)=(1/L(k+1))*(L(k+2)-L(k))/4; 
X(k)=H(k+1);

X1(k)=(1/H(k+1))*(H(k+2)-H(k))/4;
Y1(k)=L(k+1);
end

line1=polyfit(X,Y,1);
line2=polyfit(Y1,X1,1);
disp(['The parameter values using Central Difference Approximation Method are:'])
disp(['a=' num2str(abs(line2(2)))])

disp(['b=' num2str(abs(line2(1)))])

disp(['r=' num2str(abs(line1(2)))])

disp(['c=' num2str(abs(line1(1)))])