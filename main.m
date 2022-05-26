% NOTAS:
%    - Aqui usaremos j para índice em x e i para índice em y
%    - A indexação será feita por row-wise
%    - A solução de referência será dado com h = 2/50
%

% Condições de Dirichilet
U_a = 1;    
U_b = 0;

m_x = 20;
m_y = 20;

U_bound_a = U_a*ones(m_x, 1);
U_bound_b = U_b*ones(m_y, 1);
% ---------------------------

% Quantidade de pontos escolhidos, no caso de m_x = m_y
m = [5,10,20,40,80];
% ---------------------------

% Solução de Referência
U_ref = ref_solution(U_a, U_b);
% ---------------------------


