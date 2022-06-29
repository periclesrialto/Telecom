%Fun��o Manchester IEEE
function manchesterIEEE = manchesterIEEE(sinal)
sinald=zeros([1 2*length(sinal)]);
ponteiro=1;
for p1 = 1:1:length(sinal)
    if sinal(p1)==1
       sinald(ponteiro)=1;
       sinald(ponteiro+1)=1;
       ponteiro=ponteiro+2;
    else
       sinald(ponteiro)=0;
       sinald(ponteiro+1)=0;
       ponteiro=ponteiro+2;
    end
end
manchesterIEEE = zeros([1 length(sinald)]);
for p2 = 1:2:length(sinald)
    if p2<length(sinald)
        if sinald(p2)==1 && sinald(p2+1)==1
            manchesterIEEE(p2)=-1;
            manchesterIEEE(p2+1)=1;
        elseif sinald(p2)==0 && sinald(p2+1)==0
            manchesterIEEE(p2)=1;
            manchesterIEEE(p2+1)=-1;
        end
    end
end