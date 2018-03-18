function [X, n] = fixed_point(gx, tol, x)
  n = 0;
  X = [];
  err = 9999;
  x_old = x;
  while err > tol
    X = [X x];
    x = gx(x_old);
    err = abs(x-x_old);
    x_old = x;
    n += 1;
  end
end
