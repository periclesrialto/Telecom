%Função NRZ-L
function nrzl = nrzl(sinal)
nrzl = zeros([1 length(sinal)]);
for p = 1:1:length(sinal)
    if p==1
        if sinal(p)==0
            nrzl(p)=1;
        else
            nrzl(p)=-1;
        end
    else
        if sinal(p)~=sinal(p-1)
            if nrzl(p-1)==1
                nrzl(p)=-1;
            elseif nrzl(p-1)==-1
                nrzl(p)=1;
            end
        else
            nrzl(p)=nrzl(p-1);
        end
    end
end
end