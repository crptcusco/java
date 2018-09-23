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
public class Atencion {
    private String codigo;
    private String paciente;
    private String personal;
    private String campana;
    private String observaciones;

    public Atencion(String codigo, String paciente, String personal, String campana, String observaciones) {
        this.codigo = codigo;
        this.paciente = paciente;
        this.personal = personal;
        this.campana = campana;
        this.observaciones = observaciones;
    }

    public Atencion(String paciente, String personal, String campana, String observaciones) {
        this.paciente = paciente;
        this.personal = personal;
        this.campana = campana;
        this.observaciones = observaciones;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getPaciente() {
        return paciente;
    }

    public void setPaciente(String paciente) {
        this.paciente = paciente;
    }

    public String getPersonal() {
        return personal;
    }

    public void setPersonal(String personal) {
        this.personal = personal;
    }

    public String getCampana() {
        return campana;
    }

    public void setCampana(String campana) {
        this.campana = campana;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public void insertar() {
        String consultaSQL = "insert into t_atencion (id_paciente,id_personal,id_campana,c_observaciones) values ";
        consultaSQL += "('" + this.paciente + "','" + this.personal + "','" + this.campana + "','" +  this.observaciones + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        System.out.println(consultaSQL);
        helper.cerrarConeccion();
    }
    
    public void eliminar() {
        String consultaSQL = " DELETE FROM t_atencion where id_atencion= "+ this.codigo;
        System.out.println(consultaSQL);
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }
       
    public void modificar() {
        String consultaSQL = "update t_atencion set id_paciente='"+ this.paciente+
                "',id_personal='"+ this.personal+
                "',id_campana='"+ this.campana+
                "',c_observaciones='"+ this.observaciones+
                "' where id_atencion='"+ this.codigo+"'";
        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    /**
     *
     * @return
     */
    public static List<Atencion> buscarTodos() {
        String consultaSQL = "select * from t_atencion;";
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

    public static Atencion buscarPorCodigo(String codigo) {
         String consultaSQL = "select * from t_atencion  where id_atencion=" + codigo;
         System.out.println(consultaSQL);
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
        return listaDeAtencion.get(0);
    }
    
     public static List<AtencionAccion> buscarAcciones(String codigo) {
        String consultaSQL = "select * from t_atencion_accion where id_atencion='" + codigo + "'";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<AtencionAccion> listaDeAtencionAccion = new ArrayList<AtencionAccion>();
        
        try {
            while (rs.next()) {
                listaDeAtencionAccion.add(new AtencionAccion(rs.getString("id_atencion"),
                        rs.getString("id_accion")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeAtencionAccion;
    }  
     
        public static List<AtencionProblema> buscarProblemas(String codigo) {
        String consultaSQL = "select * from t_atencion_problema where id_atencion='" + codigo + "'";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<AtencionProblema> listaDeAtencionProblema = new ArrayList<AtencionProblema>();
        
        try {
            while (rs.next()) {
                listaDeAtencionProblema.add(new AtencionProblema(rs.getString("id_atencion"),
                        rs.getString("id_problema")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return listaDeAtencionProblema;
    }
        public String getUltimoCodigo(){
            String consultaSQL = "select * from t_atencion  order by id_atencion desc limit 0,1";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        Atencion atencion = null;
        try {
            while (rs.next()) {
                atencion = new Atencion(rs.getString("id_atencion"),
                        rs.getString("id_paciente"), 
                        rs.getString("id_personal"),
                        rs.getString("id_campana"),
                        rs.getString("c_observaciones"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        helper.cerrarConeccion();
        return atencion.getCodigo();
        }
}