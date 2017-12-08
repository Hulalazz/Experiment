function SDregression2(A,b,tol)
%% The aim is to solve linear regression by gradient descent.
% The cost function is min ||Ax-b||^2
  
num=size(b);%size(b)=n 1
s = rng;
x = zeros(num);
x1 = x;
stopc = 1;
k=0;
while (stopc>tol && k<1e+7)                                                          %% Beginning of an iteration
    if mod(k,1000)==0 fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc);end; 
    x0 = x;k = k+1;  % the initial value
   
    %The kth gradient of the cost function ||Ax-b||^2
    gk = 2*A'*(A*x0 - b);%The gradient
    step = ((A*gk)'*(A*x0-b))/(2*norm(A*gk)^2);%the step of steepest descent
    
    xk = x0 - step*gk;% update the parameters
    stopc = norm(A.'*(A*xk-b))/norm(A.'*(A*x1-b));% compute the stop condition
    x = xk;
end   % end of an iteration