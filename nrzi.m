%Função NRZ-I
function nrzi = nrzi(sinal)
nrzi = zeros([1 length(sinal)]);
for p = 1:1:length(sinal)
    if p==1
        if sinal(p)==0
            nrzi(p)=-1;
        else
            nrzi(p)=1;
        end
    else
        if sinal(p)==0
            nrzi(p)=nrzi(p-1);
        else
            if nrzi(p-1)==1
                nrzi(p)=-1;
            elseif nrzi(p-1)==-1
                nrzi(p)=1;
            end
        end
    end
end
end


















