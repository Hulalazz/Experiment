function SDregression3(A,b,tol)
%% The aim is to solve linear regression by gradient descent.
% The cost function is min ||Ax-b||^2
  
num=size(b);
x = zeros(num);
x1 = x;
stopc = 1;
k=0;
while (stopc>tol && k<1e+7)   %% Beginning of an iteration 
    if mod(k,1000)==0 fprintf('The number of ieration :%4d  epsm=%9.3e \n', k,  stopc);end;
    x0 = x;k = k+1;  % the initial value
    %The kth gradient of the cost function ||Ax-b||^2
    gk = 2*A'*(A*x0 - b);
    step = (gk'*(A*x0-b))/(norm(gk)^2); %Step of steepest gradient descent
    xk = x0 - step*gk;
    stopc = norm((norm(A*xk-b))^2-(norm(A*x0-b))^2,1);
    x=xk;
    
end   % end of an iteration

