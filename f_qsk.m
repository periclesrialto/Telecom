%%BPSK
function bpsk = b_qpsk(x)
    bpsk = zeros([1 length(x)]);
    for i=1:length(x)
        if x>0
            bpsk(i) = 1;
        else
            bpsk(i) = -1;
        end
    end
end

