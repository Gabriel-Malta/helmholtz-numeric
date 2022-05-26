function U = ref_solution(lower_boundary, upper_boundary)
    m_x_ref = 160;
    m_y_ref = 160;

    A_ref = zeros(m_x_ref*(m_y_ref-2),m_x_ref*(m_y_ref-2));
    F_ref = zeros(m_x_ref*(m_y_ref-2),1);

    [A_ref,F_ref] = build_helm_system(m_x_ref,m_y_ref,A_ref,F_ref,upper_boundary,lower_boundary);
    U = A_ref\F_ref;
endfunction