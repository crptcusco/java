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
public class AtencionAccion {

    private String codigoAtencion;
    private String codigoAccion;

    public AtencionAccion(String codigoAtencion, String codigoAccion) {
        this.codigoAtencion = codigoAtencion;
        this.codigoAccion = codigoAccion;
    }

    public AtencionAccion() {
    }

    public void insertar() {
        String consultaSQL = "insert into t_atencion_accion (id_atencion,id_accion) values ";
        consultaSQL += "('" + this.codigoAtencion + "','" + this.codigoAccion + "')";
        System.out.println(consultaSQL);
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
        public void modificar() {
        String consultaSQL = "update t_atencion_accion set id_atencion='"+ this.codigoAtencion+
                "',id_accion='"+ this.codigoAccion + "';"; 
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public static void eliminar(String codigoAtencion) {
        String consultaSQL = "DELETE FROM t_atencion_accion where id_atencion="+ codigoAtencion;
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    

    public static AtencionAccion buscarPorAtencion(String codigoAtencion) {
         String consultaSQL = "select * from t_atencion_accion where  id_atencion=" + codigoAtencion;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<AtencionAccion> listaDeAtencionAccion = new ArrayList<AtencionAccion>();
        try {
            while (rs.next()) {
                listaDeAtencionAccion.add(new AtencionAccion(rs.getString("id_atencion"),
                         rs.getString("c_accion")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeAtencionAccion.get(0);
    }

    public String getCodigoAtencion() {
        return codigoAtencion;
    }

    public void setCodigoAtencion(String codigoAtencion) {
        this.codigoAtencion = codigoAtencion;
    }

    public String getCodigoAccion() {
        return codigoAccion;
    }

    public void setCodigoAccion(String codigoAccion) {
        this.codigoAccion = codigoAccion;
    }

    


}

