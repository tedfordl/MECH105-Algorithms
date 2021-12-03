function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

if nargin<3
    error('not enough input arguments')
end
if nargin < 4|isempty(es)
    es = 0.001
end
if nargin < 5|isempty(maxit)
    maxit = 50
end
root = xl
iter = 0
ea = 100
while (ea>es)
    rootold = root
    root = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu))
    iter = iter + 1
    if root ~= 0
        ea = (abs((root - rootold)/root))*100
    end
    test = func(xl)*func(root)
    if test > 0
        xl = root
    elseif test < 0
        xu = root
    end
    if iter > maxit, break, end
    fx = func(root)
end