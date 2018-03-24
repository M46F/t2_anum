function [X] = x_randomizer(X, dgx)
  ct = 0;
  done = 0;
  while done == 0
    x = randi([-100 100],1,1);
    ct = ct + 1;
    if (abs(dgx(x)) < 1)
      X = [X x];
      break
    end
    if (ct == 1000)
      X = [X -36.36363636]
      break
    end
  end
end