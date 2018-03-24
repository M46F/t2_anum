error_vectors = [1e-4 1e-6 1e-8 1e-10 1e-12];

x1a = []; x1b = []; x1c = []; x1d = []; x1e = [];

%========================f(x) =====================
function s = fax(x)
  s= x^3 + 2*(x^2) + 10*x - 20;
end

function s = fbx(x)
   s = x^x - 2;
end

function s = fcx(x)
  s = 10 * exp(-x) * sin(2*pi*x) - 2;
end

function s = fdx(x)
  s = x^4 - 6*(x^3) + 12*(x^2) - 10*x + 3;
end

function s = fex(x)
  s = x^2 - cos(pi*x);
end


%========================g(x) untuk 1a =====================
function s = g1a_1x(x)
  s = (20 - 2 * x^2 - x^3) / 10;
end

function s = g1a_2x(x)
    s = ( (20 - 10*x - x^3) / 2)^(1/2);
end

function s = g1a_3x(x)
    s = (20 - 2*x^2 - 10*x)^(1/3);
end



%========================g(x) untuk 1b =====================
function s = g1b_1x(x)
    s = 2^(1/x);
end

function s = g1b_2x(x)
    s = 2/((x)^(x-1));
end

function s = g1b_3x(x)
    s = (2/((x)^(x-2)))^(1/2);
end


%========================g(x) untuk 1c =====================
function s = g1c_1x(x)
    s = asin(2/(10*(e^(-x)))) / (2*pi);
end

function s = g1c_2x(x)
  s = -1*(log(2 / (sin(2*pi*x)*10) )/log(e));
end

function s = g1c_3x(x)
  s = (10*exp(-x)*sin(2*pi*x)*x) / 2;
end


%========================g(x) untuk 1d =====================
function s = g1d_1x(x)
  s = (x^4 - 6*x^3 + 12*x^2 + 3)/10;
end

function s = g1d_2x(x)
  s = (( - x^4 + 6*x^3 + 10*x - 3)/12)^(1/2);
end

function s = g1d_3x(x)
  s = ((x^4 + 12*x^2 - 10*x + 3)/6)^(1/3);
end


%========================g(x) untuk 1e =====================
function s = g1e_1x(x)
  s = (cos(pi*x))^(1/2);
end

function s = g1e_2x(x)
  s = cos(pi*x)/x;
end

function s = g1e_3x(x)
  s = acos(x^2)/pi;
end


%========================randomize x untuk 1a =====================
ta1 = dif(@g1a_1x);
ta2 = dif(@g1a_2x);
ta3 = dif(@g1a_3x);

x1a = x_randomizer(x1a, ta1);
x1a = x_randomizer(x1a, ta2);
x1a = x_randomizer(x1a, ta3);
x1a = [x1a rand(1,1) rand(1,1)];
save x1a.mat x1a


%========================randomize x untuk 1b =====================
tb1 = dif(@g1b_1x);
tb2 = dif(@g1b_2x);
tb3 = dif(@g1b_3x);

x1b = x_randomizer(x1b, tb1);
x1b = x_randomizer(x1b, tb2);
x1b = x_randomizer(x1b, tb3);
x1b = [x1b rand(1,1) rand(1,1)];
save x1b.mat x1b


%========================randomize x untuk 1c =====================
tc1 = dif(@g1c_1x);
tc2 = dif(@g1c_2x);
tc3 = dif(@g1c_3x);

x1c = x_randomizer(x1c, tc1);
x1c = x_randomizer(x1c, tc2);
x1c = x_randomizer(x1c, tc3);
x1c = [x1c rand(1,1) rand(1,1)];
save x1c.mat x1c


%========================randomize x untuk 1d =====================
td1 = dif(@g1d_1x);
td2 = dif(@g1d_2x);
td3 = dif(@g1d_3x);

x1d = x_randomizer(x1d, td1);
x1d = x_randomizer(x1d, td2);
x1d = x_randomizer(x1d, td3);
x1d = [x1d rand(1,1) rand(1,1)];
save x1d.mat x1d

%========================randomize x untuk 1e =====================
te1 = dif(@g1d_1x);
te2 = dif(@g1d_2x);
te3 = dif(@g1d_3x);

x1e = x_randomizer(x1e, te1);
x1e = x_randomizer(x1e, te2);
x1e = x_randomizer(x1e, te3);
x1e = [x1e rand(1,1) rand(1,1)];
save x1e.mat x1e

Result = [];

% fx, gx, x, jumlah iterasi, tolerance apakah converge, error, elapsed time
fx_ct = 1;
gx_ct = 1;
for xt=x1a
  for tol=error_vectors
    inside_gx = gx_ct;
    tic;
    [x, n, is_converge, err] = fixed_point(@g1a_1x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;
    
    tic;
    [x, n, is_converge, err] = fixed_point(@g1a_2x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;

    tic;
    [x, n, is_converge, err] = fixed_point(@g1a_3x,tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
  end
end

fx_ct += 1;
gx_ct += 3;
for xt=x1b
  for tol=error_vectors
    inside_gx = gx_ct;
    tic;
    [x, n, is_converge, err] = fixed_point(@g1b_1x, tol, xt);
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;
    
    tic;
    [x, n, is_converge, err] = fixed_point(@g1b_2x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;

    tic;
    [x, n, is_converge, err] = fixed_point(@g1b_3x,tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
  end
end

fx_ct += 1;
gx_ct += 3;
for xt=x1c
  for tol=error_vectors
    inside_gx = gx_ct;
    tic;
    [x, n, is_converge, err] = fixed_point(@g1c_1x, tol, xt);
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;
    
    tic;
    [x, n, is_converge, err] = fixed_point(@g1c_2x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;

    tic;
    [x, n, is_converge, err] = fixed_point(@g1c_3x,tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
  end
end

fx_ct += 1;
gx_ct += 3;
for xt=x1d
  for tol=error_vectors
    inside_gx = gx_ct;
    tic;
    [x, n, is_converge, err] = fixed_point(@g1d_1x, tol, xt);
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;
    
    tic;
    [x, n, is_converge, err] = fixed_point(@g1d_2x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;

    tic;
    [x, n, is_converge, err] = fixed_point(@g1d_3x,tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
  end
end


fx_ct += 1;
gx_ct += 3;
for xt=x1e
  for tol=error_vectors
    inside_gx = gx_ct;
    tic;
    [x, n, is_converge, err] = fixed_point(@g1e_1x, tol, xt);
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;
    
    tic;
    [x, n, is_converge, err] = fixed_point(@g1e_2x, tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
    inside_gx += 1;

    tic;
    [x, n, is_converge, err] = fixed_point(@g1e_3x,tol, xt);    
    elapsed = toc;
    Result = [Result; [fx_ct inside_gx x n tol is_converge err elapsed] ];
  end
end

save hasil.mat Result;
csvwrite("hasil.csv",Result);