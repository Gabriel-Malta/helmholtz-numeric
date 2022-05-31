function [A,F] = build_helm_system (m_x, m_y, A_matrix, F_matrix, upper_bound, bottom_bound)                   % AU = F
    % Dado que a parte inferior e superior do quadrado são condições de Dirichilet
    count_variables = m_x*(m_y - 2);
    
    h_x = 2/m_x;
    h_y = 2/m_y;
    % Construindo a matriz
    for i = 2 : m_y-1
        for j = 1 : m_x
            k = define_index(j,i,m_x);
        
            A_matrix(k,k) = (-1/h_x/h_x)*(2 + 10*h_x*h_x) - 2/h_y/h_y;

            % Condição de contorno para i = 2
            if k <= m_x
                if k != 1 && k != m_x
                    A_matrix(k,k-1) = 1/h_x/h_x;
                    A_matrix(k,k+1) = 1/h_x/h_x;
                    A_matrix(k,k+m_x) = 1/h_y/h_y;
                elseif k == 1
                    A_matrix(k,k+1) = 2/h_x/h_x;
                    A_matrix(k,k+m_x) = 1/h_y/h_y;
                elseif k == m_x
                    A_matrix(k,k-1) = 2/h_x/h_x;
                    A_matrix(k,k+m_x) = 1/h_y/h_y;
                end
                F_matrix(k) = F_matrix(k) - bottom_bound/h_y/h_y;
            elseif k <= count_variables && k >= count_variables - m_x     % Condição de contorno para i = m_y - 1
                if k != count_variables - m_x && k != count_variables
                    A_matrix(k,k-1) = 1/h_x/h_x;
                    A_matrix(k,k+1) = 1/h_x/h_x;
                    A_matrix(k,k-m_x) = 1/h_y/h_y;
                elseif k == count_variables - m_x
                    A_matrix(k,k+1) = 2/h_x/h_x;
                    A_matrix(k,k-m_x) = 1/h_y/h_y;
                elseif k == count_variables
                    A_matrix(k,k-1) = 2/h_x/h_x;
                    A_matrix(k,k-m_x) = 1/h_y/h_y;
                end
                F_matrix(k) = F_matrix(k) - upper_bound/h_y/h_y;
            elseif mod(k, m_x) == 1                                           % Condição de contorno para x = -1
                A_matrix(k,k+1) = 2/h_x/h_x;
                A_matrix(k,k-m_x) = 1/h_y/h_y;
                A_matrix(k,k+m_x) = 1/h_y/h_y;
            elseif mod(k, m_x) == 0                                           % Condição de contorno para x = 1
                A_matrix(k,k-1) = 2/h_x/h_x;
                A_matrix(k,k-m_x) = 1/h_y/h_y;
                A_matrix(k,k+m_x) = 1/h_y/h_y;
            else
                A_matrix(k,k-1) = 1/h_x/h_x;
                A_matrix(k,k+1) = 1/h_x/h_x;
                A_matrix(k,k-m_x) = 1/h_y/h_y;
                A_matrix(k,k+m_x) = 1/h_y/h_y;
            end
        end
    end
    A = A_matrix;
    F = F_matrix;
endfunction