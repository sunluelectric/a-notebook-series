function y = bound(x,xLow,xHigh)
    y = min(max(x, xLow), xHigh);
end