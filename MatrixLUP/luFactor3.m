function [L, U, P] = luFactor3(A)
U = A;
if length(U) ~= height(U)
    error('Error: Matrix must have same number of rows and columns')
end
P = eye(length(U));
L = eye(length(U));
for a = 1:length(U)-1;
    magnitude = abs(U);
    if max(magnitude(a:length(U), a) > magnitude(a,a))
        Ui = U;
        Pi = P;
        Li = L;
        [I, ~] = find(U == max(max(U(a:length(U), a))));
        U(a,:) = U(I,:);
        U(I,:) = Ui(a,:);
        P(a,:) = P(I,:);
        P(I,:) = Pi(a,:);
        L(a,:) = L(I,:);
        L(I,:) = Li(a,:);
        L(a,a) = 1; L(a+1,a+1) = 1;
        for b = a+1:length(L);
            L(a,b) = 0;
        end    
    end
    for i = a+1:length(U);
        r = U(i,a)/U(a,a);
        U(i,:) = U(i,:) - ((U(a,:))*r);
        L(i,a) = r;
    end
end
disp(L)
disp(U)
disp(P)
end