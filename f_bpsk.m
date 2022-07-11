%%BPSK
function bpsk = f_bpsk(x)
    bpsk = zeros([1 length(x)]);
    for i=1:length(x)
        if x(i)>0
            bpsk(i) = 1;
        else
            bpsk(i) = -1;
        end
    end
end

