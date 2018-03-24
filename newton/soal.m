function [res, iter, err] = soal(A, tol, iter)
  [x, len] = size(A);
  err = [0,0,0,0,0];
  "Soal A"
  func = @(x) x.^3 + (2 * x.^2) + (10*x) - 20;
  dfunc = @(x) (3* x.^2) + (4*x) + 10;
  for i=1:len
    [res, iter] = newton_raphson(func, A(i), tol, iter)
  end
  err(1) = abs(func(res)-0);
  "Soal B"
  func = @(x) x.^x - 2;
  dfunc = @(x) x.^x * (1 + log(x));
  for i=1:len
    [res, iter] = newton_raphson(func, A(i), tol, iter)
  end
  err(2) = abs(func(res)-0);
  "Soal C"
  func = @(x) 10*exp(-x) * sin(2* pi * x) - 2;
  dfunc = @(x) 20*exp(-x)*pi*cos(2 *pi*x)- (10*exp(-x)*sin(2*pi*x));
  for i=1:len
    [res, iter] = newton_raphson(func, A(i), tol, iter)
  end
  err(3) = abs(func(res)-0);
  "Soal D"
  func = @(x) x.^4 - (6*x.^3) + (12*x.^2) - (10*x) + 3;
  dfunc = @(x)  (4*x.^3) - (18*x.^2) + (24*x) - 10;
  for i=1:len
    [res, iter] = newton_raphson(func, A(i), tol, iter)
  end
  err(4) = abs(func(res)-0);
  "Soal E"
  func = @(x) x.^2 - cos(pi * x);
  dfunc = @(x)  (2*x) + (pi*sin(pi*x));
  for i=1:len
    [res, iter] = newton_raphson(func, A(i), tol, iter)
  end
  err(5) = abs(func(res)-0);
  err
end