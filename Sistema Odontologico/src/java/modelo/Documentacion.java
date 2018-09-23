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
public class Documentacion {

    private String codigo;
    private String nombre;
    private String ruta;
   

    public Documentacion(String nombre, String ruta) {
        this.nombre = nombre;
        this.ruta = ruta;
        
    }

    public Documentacion(String codigo, String nombre, String ruta) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.ruta = ruta;
    }

    public void insertar() {
        String consultaSQL = "insert into t_documentacion (c_nombre,c_ruta) values ";
        consultaSQL += "('" + this.nombre + "','" + this.ruta + "')";
        System.out.println(consultaSQL);
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_documentacion where id_documentacion='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void modificar() {
        String consultaSQL = "update t_documentacion set c_nombre='"+ this.nombre+
                "',c_ruta='"+ this.ruta+
                "' where id_documentacion='"+ this.codigo+"'";
        System.out.println(consultaSQL);
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }

    /**
     *
     * @return
     */
    public static List<Documentacion> buscarTodos() {
        String consultaSQL = "select id_documentacion,c_nombre,c_ruta from t_documentacion";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Documentacion> listaDeDocumentacion = new ArrayList<Documentacion>();
        try {
            while (rs.next()) {
                listaDeDocumentacion.add(new Documentacion(rs.getString("id_documentacion"),
                        rs.getString("c_nombre"), rs.getString("c_ruta")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeDocumentacion;
    }

    public static Documentacion buscarPorCodigo(String codigo) {
         String consultaSQL = "select id_documentacion,c_nombre,c_ruta from t_documentacion where  id_documentacion=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Documentacion> listaDeDocumentacion = new ArrayList<Documentacion>();
        try {
            while (rs.next()) {
                listaDeDocumentacion.add(new Documentacion(rs.getString("id_documentacion"),
                        rs.getString("c_nombre"), rs.getString("c_ruta")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeDocumentacion.get(0);
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

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }


}
