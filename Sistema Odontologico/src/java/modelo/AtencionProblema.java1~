/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carlos
 */
public class AtencionProblema {

    private String codigoAtencion;
    private String codigoProblema;

    public AtencionProblema(String codigoAtencion, String codigoProblema) {
        this.codigoAtencion = codigoAtencion;
        this.codigoProblema = codigoProblema;
    }

    public AtencionProblema() {
    }

    public void insertar() {
        String consultaSQL = "insert into t_atencion_problema (id_atencion,id_problema) values ";
        consultaSQL += "('" + this.codigoAtencion + "','" + this.codigoProblema + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void modificar() {
        String consultaSQL = "update t_atencion_problema set id_atencion='"+ this.codigoAtencion+
                "',id_problema='"+ this.codigoProblema + "';"; 
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public static void eliminar(String codigoAtencion) {
        String consultaSQL = "DELETE FROM t_atencion_problema where id_atencion="+ codigoAtencion;
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    

    public static AtencionProblema buscarPorAtencion(String codigoAtencion) {
         String consultaSQL = "select * from t_atencion_problema where  id_atencion=" + codigoAtencion;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<AtencionProblema> listaDeAtencionProblema = new ArrayList<AtencionProblema>();
        try {
            while (rs.next()) {
                listaDeAtencionProblema.add(new AtencionProblema(rs.getString("id_atencion"),
                         rs.getString("c_accion")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeAtencionProblema.get(0);
    }

    public String getCodigoAtencion() {
        return codigoAtencion;
    }

    public void setCodigoAtencion(String codigoAtencion) {
        this.codigoAtencion = codigoAtencion;
    }

    public String getCodigoProblema() {
        return codigoProblema;
    }

    public void setCodigoProblema(String codigoProblema) {
        this.codigoProblema = codigoProblema;
    }

    


}

