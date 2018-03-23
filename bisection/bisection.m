function c = bisection(fun, a, b, tol)
   NMAX = 10000;
   
   n =  1;
   while n < NMAX
    c = (a + b)/2;
     if abs(fun(c)) < tol
      return
     endif
   
     if sign(fun(c)) == sign(fun(a))
      a = c;
     else
      b = c;
     endif
     n += 1;
    endwhile
  error("Solution not found");
endfunction