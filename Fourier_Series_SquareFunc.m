function quad = quadrado(x)
   %define os limites e o periodo da função
   lim_min = -pi;
   lim_max = 3*pi;
   periodo = 4*pi;

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
        
        %funcao quadrada
        if t_normalizado< pi && t_normalizado>-pi
            f(t) = 30;
        else
            f(t) = 0;
        end
    end
   %retorna o vetor f
   quad = f;
end