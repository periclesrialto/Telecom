%QPSK
function qpsk = f_qpsk(x)
    qpsk = zeros([1 (length(x)/2)]);
    p=1;
    for i=1:1:((length(x)/2)-1)
       if x(p)==1 && x(p+1)==1
           qpsk(i) = (sqrt(2)/2)+(1i*sqrt(2)/2);
       elseif x(p)==1 && x(p+1)==0
           qpsk(i) = (-sqrt(2)/2)+(1i*sqrt(2)/2);
       elseif x(p)==0 && x(p+1)==0    
           qpsk(i) = (-sqrt(2)/2)+(-1i*sqrt(2)/2);
       elseif x(p)==0 && x(p+1)==1 
           qpsk(i) = (sqrt(2)/2)+(-1i*sqrt(2)/2);   
       end   
       p=p+2;
    end
end