function [bit__stream] = Makebin(Decimal,k)
    bit__stream = zeros(1,k);
    for i=1:k
        bit__stream(k-i+1) = mod(Decimal,2);
        Decimal=floor(Decimal/2);
    end
end

