function g = gaussfilt(var, size, cond)
    
% arguments
%         var {mustBePositive, mustBeNumeric}
%         size {mustBePositive, mustBeInteger}
%         str {mustBeMember(str,{'combined', 'separable'})}
% end

    g = zeros(size, 1);
    
    x0 = (size+1)/2;
    for x = 1:(size) 
        g(x) = exp(-((x-x0)^2)/(2*var));
    end
    
    if(strcmp(cond,'seperable') ~= 1)
        g = g'.*g;
    end
    
    total = sum(g);
    total = sum(total);
    g = g/total;
    
end