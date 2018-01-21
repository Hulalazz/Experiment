function SDregression2(A,b,tol)
%% The aim is to solve linear regression by gradient descent.
% The cost function is min 0.5*||Ax-b||^2 A=H
  
num=size(b);%size(b) = n 1
x = rand(num);
x1 = x;
stopc = 1;
k=0;
while (stopc>tol && k<1e+6)                                                 %% Beginning of an iteration
    
    if mod(k,10000)==0 fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc);end;
    
    x0 = x;k = k+1;                                                         % the initial value
    %The kth gradient of the cost function ||Ax-b||^2
    gk = A'*(A*x0 - b);                                                     %The gradient 
    step = (gk'*(A*x0-b))/(norm(gk)^2);                                     %The reduced step of steepest descent
    xk = x0 - 0.8*step*gk;                                                  % Update the parameters with contracting step
    stopc = norm((norm(A*xk-b))^2-(norm(A*x0-b))^2,1);;                          % Compute the stop condition
    x = xk;
end   % end of an iteration
fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc)
