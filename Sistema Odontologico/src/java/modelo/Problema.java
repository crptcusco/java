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
public class Problema {
    
    private String codigo;
    private String nombre;

    public Problema(String codigo, String nombre) {
        this.codigo = codigo;
        this.nombre = nombre;
    }

    public Problema(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void insertar() {
        String consultaSQL = "insert into t_problema (c_nombre) values ";
        consultaSQL += "('" +  this.nombre + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_problema where id_problema='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void modificar() {
        String consultaSQL = "update t_problema set c_nombre='"+ this.nombre+
                "' where id_problema='"+ this.codigo+"'";        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    /**
     *
     * @return
     */
    public static List<Problema> buscarTodos() {
        String consultaSQL = "select id_problema,c_nombre from t_problema";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Problema> listaDeProblema = new ArrayList<Problema>();
        try {
            while (rs.next()) {
                listaDeProblema.add(new Problema(rs.getString("id_problema"),
                        rs.getString("c_nombre")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeProblema;
        
    }

    public static Problema buscarPorCodigo(String codigo) {
         String consultaSQL = "select id_problema,c_nombre from t_problema where  id_problema=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Problema> listaDeProblema = new ArrayList<Problema>();
        try {
            while (rs.next()) {
                listaDeProblema.add(new Problema(rs.getString("id_problema"),
                        rs.getString("c_nombre")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeProblema.get(0);
    }
            
}
