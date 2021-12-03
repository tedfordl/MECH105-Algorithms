function [I] = Simpson(x, y)
if length(x)~=length(y)
    error('input vectors must be same length')
end
for i = 2:length(x)-1
    if (x(2)-x(1)) ~= (x(i+1)-x(i))
        error('x values must be equally spaced')
    end
end
prevInt = 0;
for j = 1:2:length(x)-1
    if j+2 <= length(x)
    I = prevInt + (((x(j+2)-x(j))/2)/3)*(y(j)+4*y(j+1)+y(j+2));
    prevInt = I;
    disp(I)
    elseif j+2 > length(x)
    I = prevInt + (x(j+1)-x(j))*(((y(j+1)+y(j)))/2)
    end
end
    