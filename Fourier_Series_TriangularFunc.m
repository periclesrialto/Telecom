function triang = triangular(x)
    %define os limites e perido da função
    lim_min = 0;
    lim_max = 2*pi;
    periodo = 2*pi;
    
    %cria um vetor de zeros do tamanho do vetor de entrada
    f = zeros([1 length(x)]);
    
    for t = 1:length(x)
        t_normalizado = x(t);
        
        %Corrige multiplo do período
        while t_normalizado < lim_min
            t_normalizado = t_normalizado + periodo;
        end
        while t_normalizado > lim_max
            t_normalizado = t_normalizado - periodo;
        end
        
        %função triangular
        if t_normalizado > 0 && t_normalizado < pi/2            
            f(t) = -20*t_normalizado + 10*pi;
        elseif t_normalizado > pi/2 && t_normalizado < 3*pi/2
            f(t) = 0;
        else
            f(t) = 20*t_normalizado - 30*pi;
        end    
    end
    %retorna o vetor f
    triang = f;
end