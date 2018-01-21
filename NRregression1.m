function NRregression1(A,b,tol)
%% The aim is to solve linear regression by gradient descent.
% The cost function is min ||Ax-b||^2
  
num=size(b);
x = rand(num);
x1 = x;
stopc = 1;
k=0;
while (stopc>tol && k<1e+7)   %% Beginning of an iteration 
    
    if mod(k,1000)==0 fprintf('The number of ieration :%4d  epsm=%9.3e \n', k,  stopc);end;
    x0 = x;k = k+1;  % the initial value
    
    gk = 2*A'*(A*x0 - b);%The kth gradient of the cost function ||Ax-b||^2
    Nk = 2*(A')*A;% The Hessian matrix of cost function
%   step = 1000*(gk'*(A*x0-b))/(1000*norm(gk)^2);
    xk = x0 - inv(Nk)*gk;
    stopc = norm(A'*(A*xk-b))/norm(A'*(A*x1-b));
%     stopc = ((norm(A*xk-b))^2-(norm(A*x0-b))^2)^2;
    x=xk;
end   % end of an iteration

