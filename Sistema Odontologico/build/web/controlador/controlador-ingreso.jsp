<%@page import="modelo.Personal"%>
<%
    Personal personal = null;

        if (Personal.existePorCodigo(request.getParameter("usuario"))) {
            personal = Personal.buscarPorCodigo(request.getParameter("usuario"));
            if (personal.getEstado().equals("A")) {
                if (personal.getContrasena().equals(request.getParameter("contrasena"))) {
                    if (personal.getTipo().equals("Administrador")) {
                        response.sendRedirect("../administrador/principal.jsp");
                    } else if (personal.getTipo().equals("Secretaria")) {
                        response.sendRedirect("../secretaria/principal.jsp");
                    } else {
                        response.sendRedirect("../index.jsp?error=\"No esta Autorizado para ingresar a este Sistema\"");
                    }

                    HttpSession sesionOk = request.getSession(true);
                    sesionOk.setAttribute("nombre", personal.getNombre() + " " + personal.getApellido());
                    sesionOk.setAttribute("codigo", personal.getCodigo());
                    sesionOk.setAttribute("tipo", personal.getTipo());
                } else {
                    response.sendRedirect("../index.jsp?error=2");
                }
            } else {
                response.sendRedirect("../ijijij.jsp?error=\"No esta Autorizado para ingresar a este Sistema\"");
            }
        } else {
            System.out.print(Personal.existePorCodigo(request.getParameter("usuario")));
            response.sendRedirect("../index.jsp?error=1");
        }


%>