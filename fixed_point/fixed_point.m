function [x, n, is_converge, err] = fixed_point(gx, tol, x)
  n = 0;
  err = 9999; err_old = 9999;
  x_old = x;
  is_converge = 1;
  max_iter = 10000;
  while err > tol
    err_old = err;
    x = gx(x_old);
    err = abs(x-x_old);
    x_old = x;
    n += 1;
    if n >= max_iter 
       is_converge = 0;
       break 
    end
  end
end
