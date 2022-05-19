% NOTAS:
%    - Aqui usaremos j para índice em x e i para índice em y
%    - A indexação será feita por row-wise
%
%

m_x = 5;
m_y = 5;

% Condições de Dirichilet
U_a = 1;    
U_b = 0;

A = zeros(m_x*(m_y-2),m_x*(m_y-2));
F = zeros(m_x*(m_y-2),1);

A = build_helm_system(m_x,m_y,A,F,U_b,U_a);

A