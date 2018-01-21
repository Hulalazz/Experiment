function SDwithNM(n,tol)
%The cost function is (1/2)x'*H*x+b'*x
%n is the size of H
%tol is the tolerence of iteration
  xopt=ones(n,1);
  H=hilb(n);
  c=-H*xopt;
  x=c; stopc=1;k=0;%%The initial iteration
  x1=c;
  v=zeros(n,1);
  alpha=0.2; gamma=0.8;%convex combination of historyb gradient and current gradient
 
while (stopc>tol)                                               %% Beginning of an iteration
    
    if mod(k,1000)==0 fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc);end;
    
    x0=x;k=k+1;  % the initial value
    v0=v;
    x_t = x0 - alpha*v0;
    vt = gamma*v0 + (H*(x_t)+c);  %The momentum                  
    xt = x0 - alpha*vt;                       %reduced step
    stopc = norm(H*xt+c)/norm(H*x1+c);
    x=xt;
    v=vt;
end                                     % end of an iteration
fprintf( 'k=%4d  epsm=%9.3e  \n',k,stopc);