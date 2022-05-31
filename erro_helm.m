function E = erro_helm(numeric_solution, solution)
    resto = rem(length(solution),length(numeric_solution));
    if(resto != 0)
        printf('A diferença entre as dimensões dos vetores nao permite o calculo do erro');
        E = -1000000;
        return;
    endif

    index_step = length(solution)/length(numeric_solution);
    j = 1;
    E = zeros(length(numeric_solution),1);

    for i = 1:index_step:length(solution)
        E(j) = solution(i) - numeric_solution(j);
        j = j + 1;
    endfor
endfunction