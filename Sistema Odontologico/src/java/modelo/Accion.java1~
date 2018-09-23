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
public class Accion {
    
    private String codigo;
    private String nombre;

    public Accion(String codigo, String nombre) {
        this.codigo = codigo;
        this.nombre = nombre;
    }

    public Accion(String nombre) {
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
        String consultaSQL = "insert into t_accion (c_nombre) values ";
        consultaSQL += "('" +  this.nombre + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_accion where id_accion='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void modificar() {
        String consultaSQL = "update t_accion set c_nombre='"+ this.nombre+
                "' where id_accion='"+ this.codigo+"'";        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    /**
     *
     * @return
     */
    public static List<Accion> buscarTodos() {
        String consultaSQL = "select id_accion,c_nombre from t_accion";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Accion> listaDeAccion = new ArrayList<Accion>();
        try {
            while (rs.next()) {
                listaDeAccion.add(new Accion(rs.getString("id_accion"),
                        rs.getString("c_nombre")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeAccion;
    }

    public static Accion buscarPorCodigo(String codigo) {
         String consultaSQL = "select id_accion,c_nombre from t_accion where  id_accion=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Accion> listaDeAccion = new ArrayList<Accion>();
        try {
            while (rs.next()) {
                listaDeAccion.add(new Accion(rs.getString("id_accion"),
                        rs.getString("c_nombre")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeAccion.get(0);
    }
            
}
