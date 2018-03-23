function [res] = newton_raphson(func, dfunc, x0, tol)
  res = x0;
  while abs(func(res)) > tol
    func(res)
    res = res - func(res)/dfunc(res);
  end
end