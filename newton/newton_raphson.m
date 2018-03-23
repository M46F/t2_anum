function [res, iter] = newton_raphson(func, dfunc, x0, tol, iter)
  res = x0;
  iter = 0;
  while abs(func(res)) > tol
    iter = iter + 1;
    if abs(dfunc(res)) == 0 || iter >= 10000
      isconv = "dfunc is zero";
      iter = -1;
    break
    end
    res = res - func(res)/dfunc(res);
  end
end