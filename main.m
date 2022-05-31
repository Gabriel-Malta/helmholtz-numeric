% NOTAS:
%    - Aqui usaremos j para índice em x e i para índice em y
%    - A indexação será feita por row-wise
%    - A solução de referência será dado com h = 2/50
% FUNCTIONS:
%    - [A,F] = build_helm_system (m_x, m_y, A_matrix, F_matrix, upper_bound, bottom_bound)
%    - k = define_index(j,i,m_x)
%    - U = ref_solution(lower_boundary, upper_boundary)
%    - E = erro_helm(numeric_solution, solution)
%

% Condições de Dirichilet
U_a = 1;    
U_b = 0;

m_x = 20;
m_y = 20;

U_bound_a = U_a*ones(m_x, 1);
U_bound_b = U_b*ones(m_y, 1);
% ---------------------------

% Quantidade de pontos escolhidos
m_x = [4,8,16,32,64];
m_y = m_x .+ 2;
% ---------------------------

% Espaçamentos correspondentes
h_x = 2./m_x;
h_y = 2./m_y;
n = h_x.^2 + h_y.^2;
% ---------------------------

% Solução de Referência
U_ref = ref_solution(U_a, U_b);
% ---------------------------

error_modules = zeros(length(m_x), 1);

% Solução dos Erros, com base na quantidade de pontos
for i = 1:length(m_x)
    A = zeros(m_x(i)*(m_y(i)-2),m_x(i)*(m_y(i)-2));
    F = zeros(m_x(i)*(m_y(i)-2),1);
    [An,Fn] = build_helm_system(m_x(i), m_y(i), A, F, U_b, U_a);
    U = An\Fn;
    E = erro_helm(U, U_ref);
    error_modules(i) = norm(E);
endfor

plot(log(n),log(error_modules));