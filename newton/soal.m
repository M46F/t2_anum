function [res, iter] = soal(A, tol, iter)
  "Soal A"
  func = @(x) x.^3 + (2 * x.^2) + (10*x) - 20;
  dfunc = @(x) (3* x.^2) + (4*x) + 10;
  for i=1:5
    [res, iter] = newton_raphson(func, dfunc, A(i), tol, iter)
  end
  "Soal B"
  func = @(x) x.^x - 2;
  dfunc = @(x) x.^x * (1 + log(x));
  for i=1:5
    [res, iter] = newton_raphson(func, dfunc, A(i), tol, iter)
  end
  "Soal C"
  func = @(x) 10*exp(-x) * sin(2* pi * x) - 2;
  dfunc = @(x) 20*exp(-x)*pi*cos(2 *pi*x)- (10*exp(-x)*sin(2*pi*x));
  for i=1:5
    [res, iter] = newton_raphson(func, dfunc, A(i), tol, iter)
  end
  "Soal D"
  func = @(x) x.^4 - (6*x.^3) + (12*x.^2) - (10*x) + 3;
  dfunc = @(x)  (4*x.^3) - (18*x.^2) + (24*x) - 10;
  for i=1:5
    [res, iter] = newton_raphson(func, dfunc, A(i), tol, iter)
  end
  "Soal E"
  func = @(x) x.^2 - cos(pi * x);
  dfunc = @(x)  (2*x) + (pi*sin(pi*x));
  for i=1:5
    [res, iter] = newton_raphson(func, dfunc, A(i), tol, iter)
  end
end