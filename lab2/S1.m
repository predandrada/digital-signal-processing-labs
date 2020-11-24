function[res] = S1(y, e)
    res = y;
    if e > 10
        res = y + 10;
    elseif e > 0
        res = y + 1;
    elseif e == 0
        res = y;
    end
end