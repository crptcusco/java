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
public class Recurso {

    private String codigo;
    private String nombre;
    private String medida;
   

    public Recurso(String nombre, String medida ) {
        this.nombre = nombre;
        this.medida = medida;
        
    }

    public Recurso(String codigo, String nombre, String medida) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.medida = medida;
    }

    public void insertar() {
        String consultaSQL = "insert into t_recurso (c_nombre,c_medida) values ";
        consultaSQL += "('" + this.nombre + "','" + this.medida + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_recurso where id_recurso='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void modificar() {
        String consultaSQL = "update t_recurso set c_nombre='"+ this.nombre+
                "',c_medida='"+ this.medida+
                "' where id_recurso='"+ this.codigo+"'";
        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }

    /**
     *
     * @return
     */
    public static List<Recurso> buscarTodos() {
        String consultaSQL = "select id_recurso,c_nombre,c_medida from t_recurso";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Recurso> listaDeRecurso = new ArrayList<Recurso>();
        try {
            while (rs.next()) {
                listaDeRecurso.add(new Recurso(rs.getString("id_recurso"),
                        rs.getString("c_nombre"), rs.getString("c_medida")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeRecurso;
    }

    public static Recurso buscarPorCodigo(String codigo) {
         String consultaSQL = "select id_recurso,c_nombre,c_medida from t_recurso where  id_recurso=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Recurso> listaDeRecurso = new ArrayList<Recurso>();
        try {
            while (rs.next()) {
                listaDeRecurso.add(new Recurso(rs.getString("id_recurso"),
                        rs.getString("c_nombre"), rs.getString("c_medida")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDeRecurso.get(0);
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

    public String getMedida() {
        return medida;
    }

    public void setMedida(String medida) {
        this.medida = medida;
    }


}
