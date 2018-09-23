<%  
    HttpSession sesionOk = request.getSession(true);
    sesionOk.invalidate();
    response.sendRedirect("../index.jsp");
    %>