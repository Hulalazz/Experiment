function NMRegression(A,b,tol)
%% The aim is to solve linear regression by gradient descent.
% The cost function is min ||Ax-b||^2
  
num=size(b);
x = zeros(num);
v = zeros(num);
x1 = x;
stopc = 1;
k=0;
alpha=0.1;
gamma=0.999;
while (stopc>tol && k<1e+7)                                                          %% Beginning of an iteration
    if mod(k,1000)==0 fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc);end; 
    x0 = x;k = k+1;v0=v;  % the initial value
   
    %The kth gradient of the cost function ||Ax-b||^2
    gk = 2*A'*(A*x0 - b);
    v_k = x0 - alpha*v0;
    g_k = 2*A'*(A*v_k - b);
    vk = gamma*v0 + g_k;
    xk = x0 - alpha*vk;
    stopc = norm((norm(A*xk-b))^2-(norm(A*x0-b))^2,1);
    x=xk;
    v=vk;
end   % end of an iteration
fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc)
