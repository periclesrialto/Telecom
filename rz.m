%Função RZ
function rz = rz(sinal)
sinald=zeros([1 2*length(sinal)]);
ponteiro=1;
for p1 = 1:1:length(sinald)
    if mod(p1,2) == 1 && ponteiro<=16
       sinald(p1)= sinal(ponteiro);
       ponteiro = ponteiro + 1;
    end
end
rz = zeros([1 length(sinald)]);
for p2 = 1:1:length(sinald)
    if mod(p2,2) == 1 
        if sinald(p2)==1
            rz(p2)=1;
        else
            rz(p2)=-1;
        end
    else
       rz(p2)=0;
    end
end
end