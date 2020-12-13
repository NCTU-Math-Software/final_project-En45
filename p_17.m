function p_17(n)

A = zeros(n);
center = ceil(n/2);

A(center,center) = 1;
entry = 2;

x = center;
y = center;
ii = 1;
if n == 1
    A
    sum_diagonal = 1
    return;
end

d = 1;
while d
    %right
    for kk = 1:ii
        x = x + 1;
        A(y,x) = entry;
        entry = entry + 1;
        if entry > n*n
            d = 0;
            break;
        end
    end
    if ~d
        break;
    end
    %down
    for kk = 1:ii
        y = y + 1;
        A(y,x) = entry;
        entry = entry + 1;
        if entry > n*n
            d = 0;
            break;
        end
    end
    if ~d
        break;
    end
    %left
    ii = ii + 1;
    for kk = 1:ii
        x = x - 1;
        A(y,x) = entry;
        entry = entry + 1;
        if entry > n*n
            d = 0;
            break;
        end
    end
    if ~d
        break;
    end
    %up
    for kk = 1:ii
        y = y - 1;
        A(y,x) = entry;
        entry = entry + 1;
        if entry > n*n
            d = 0;
            break;
        end
    end
    ii = ii + 1;
end
A
sum_diagonal = 1;
kk = 2;
pre = 1;
c = 1;
while c < n*n
    for aa = 1:4
        c = pre + kk;
        sum_diagonal = sum_diagonal + c;
        pre = c;
    end
    kk = kk + 2;
end
if ceil(n/2) == n/2     %n is even
    sum_diagonal = sum_diagonal - 2*n^2 - 3*n - 1;
end
sum_diagonal
end