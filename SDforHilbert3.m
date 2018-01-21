function SD(n,tol)
%The cost function is (1/2)x'*H*x+b'*x
%n is the size of H
%tol is the tolerence of iteration
  xopt=ones(n,1);
  H=hilb(n);
  c=-H*xopt;
  x=c; stopc=1;k=0;%%The initial iteration
  x1=c;
while (stopc>tol)                                               %% Beginning of an iteration
    
    if mod(k,1000)==0 fprintf('The number of ieration :%4d epsm=%9.3e\n', k, stopc);end;
    
    x0=x;k=k+1;  % the initial value
    step = ((H*x0+c)'*(H*x0+c))/((H*x0+c)'*(H*(H*x0+c)));  %The step of stepest descent
    xt = x0 - 1.2*step*(H*x0+c);%increasing step
    stopc = norm(H*xt+c)/norm(H*x1+c);
    x=xt;
end   % end of an iteration

fprintf( 'k=%4d  epsm=%9.3e  \n',k,stopc);



