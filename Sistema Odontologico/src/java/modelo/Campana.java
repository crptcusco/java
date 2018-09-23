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
public class Campana {

    private String codigo;
    private String nombre;
    private String contacto;
    private String fecha;
    private String lugar;
    private String estado;

    public Campana(String codigo, String nombre, String contacto, String fecha, String lugar, String estado) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.contacto = contacto;
        this.fecha = fecha;
        this.lugar = lugar;
        this.estado = estado;
    }

    public Campana(String nombre, String contacto, String fecha, String lugar, String estado) {
        this.nombre = nombre;
        this.contacto = contacto;
        this.fecha = fecha;
        this.lugar = lugar;
        this.estado = estado;
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

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void insertar() {
        String consultaSQL = "insert into t_campana (c_nombre,c_contacto,c_fecha,c_lugar,c_estado) values ";
        consultaSQL += "('" + this.nombre + "','" + this.contacto + "','" + this.fecha + "','" + this.lugar + "','" + this.estado + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_campana where id_campana='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
        public void cerrar() {
        String consultaSQL = "UPDATE `t_campana` SET `c_estado`='F' WHERE `id_campana`=" + this.codigo;
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
    
         public void abrir() {
        String consultaSQL = "UPDATE `t_campana` SET `c_estado`='P' WHERE `id_campana`=" + this.codigo;
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }   
    public void modificar() {
        String consultaSQL = "update t_campana set c_nombre='"+ this.nombre+
                "',c_contacto='"+ this.contacto+
                "',c_fecha='"+ this.fecha+
                "',c_lugar='"+ this.lugar+
                "',c_estado='"+ this.estado+
                "' where id_campana='"+ this.codigo+"'";
        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    /**
     *
     * @return
     */
    public static List<Campana> buscarTodos() {
        String consultaSQL = "select id_campana,c_nombre,c_contacto,c_fecha,c_lugar,c_estado from t_campana order by id_campana desc";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Campana> listaDeCampana = new ArrayList<Campana>();
        try {
            while (rs.next()) {
                listaDeCampana.add(new Campana(rs.getString("id_campana"),
                        rs.getString("c_nombre"), 
                        rs.getString("c_contacto"),
                        rs.getString("c_fecha"),
                        rs.getString("c_lugar"),
                        rs.getString("c_estado")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeCampana;
    }

    public static Campana buscarPorCodigo(String codigo) {
        String consultaSQL = "select id_campana,c_nombre,c_contacto,c_fecha,c_lugar,c_estado from t_campana where  id_campana=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Campana> listaDeCampana = new ArrayList<Campana>();
        try {
            while (rs.next()) {
                listaDeCampana.add(new Campana(rs.getString("id_campana"),
                        rs.getString("c_nombre"), 
                        rs.getString("c_contacto"),
                        rs.getString("c_fecha"),
                        rs.getString("c_lugar"),
                        rs.getString("c_estado")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(consultaSQL);
        helper.cerrarConeccion();
        helper.cerrarConeccion();
        return listaDeCampana.get(0);
    }
    
    public static List<Atencion> buscarAtenciones(String codigo) {
        String consultaSQL = "select * from t_atencion where id_campana='" + codigo + "'";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Atencion> listaDeAtencion = new ArrayList<Atencion>();
        try {
            while (rs.next()) {
                listaDeAtencion.add(new Atencion(rs.getString("id_atencion"),
                        rs.getString("id_paciente"), 
                        rs.getString("id_personal"),
                        rs.getString("id_campana"),
                        rs.getString("c_observaciones")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeAtencion;
    }    

    public static List<CampanaRecurso> buscarRecursos(String codigo) {
        String consultaSQL = "select * from t_campana_recurso where id_campana=" + codigo + "";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<CampanaRecurso> listaDeRecursos = new ArrayList<CampanaRecurso>();
        try {
            while (rs.next()) {
                listaDeRecursos.add(new CampanaRecurso(rs.getString("id_campana"),
                        rs.getString("id_recurso"), 
                        rs.getString("c_cantidad"),
                        rs.getString("c_costo_unitario")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeRecursos;
    }    
    
   public static List<CampanaPersonal> buscarPersonal(String codigo) {
        String consultaSQL = "select * from t_campana_personal where id_campana=" + codigo + "";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<CampanaPersonal> listaDePersonal = new ArrayList<CampanaPersonal>();
        try {
            while (rs.next()) {
                listaDePersonal.add(new CampanaPersonal(rs.getString("id_campana"),
                        rs.getString("id_personal")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDePersonal;
    }    
}

