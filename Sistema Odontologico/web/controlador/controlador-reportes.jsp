<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>

<%
    Connection conn = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        System.out.println("MySQL JDBC Driver not found.");
        System.exit(1);
    }
    //Para iniciar el Logger.
    //inicializaLogger();
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost/db_sistema_odotologico", "root", "");
        conn.setAutoCommit(false);
    } catch (SQLException e) {
        System.out.println("Error de conexión: " + e.getMessage());
        System.exit(4);
    }

    try {
        String archivo = "reporte" + request.getParameter("item");
        //Borrando el Archivo si existe     
        File fichero = new File("C:\\Users\\Carlos\\Desktop\\SGCO - Sistema Odontologico\\5.-Fuentes\\Sistema Odontologico\\web\\pdf\\" + archivo + ".pdf");
        if (fichero.delete()) {
            System.out.println("El fichero ha sido borrado satisfactoriamente");
        } else {
            System.out.println("El fichero no puede ser borrado");
        }
        Map parameters = new HashMap();
        JasperReport report = JasperCompileManager.compileReport(
                "C:\\Users\\Carlos\\Desktop\\SGCO - Sistema Odontologico\\5.-Fuentes\\Sistema Odontologico\\web\\reportes\\" + archivo + ".jrxml");
        JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);
        // Exporta el informe a PDF
        JasperExportManager.exportReportToPdfFile(print,
                "C:\\Users\\Carlos\\Desktop\\SGCO - Sistema Odontologico\\5.-Fuentes\\Sistema Odontologico\\web\\pdf\\" + archivo + ".pdf");
        
        //Para visualizar el pdf directamente desde java
        //JasperViewer.viewReport(print, false);
        response.sendRedirect("../pdf/" + archivo + ".pdf");
        //response.sendRedirect("../administrador/reportes.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        /*
         * Cleanup antes de salir
         */
        try {
            if (conn != null) {
                conn.rollback();
                System.out.println("ROLLBACK EJECUTADO");
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
