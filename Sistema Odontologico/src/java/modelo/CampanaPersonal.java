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
public class CampanaPersonal {
    String id_campana;
    String id_personal;

    public CampanaPersonal(String id_campana, String id_personal) {
        this.id_campana = id_campana;
        this.id_personal = id_personal;
    }

    public String getId_campana() {
        return id_campana;
    }

    public void setId_campana(String id_campana) {
        this.id_campana = id_campana;
    }

    public String getId_personal() {
        return id_personal;
    }

    public void setId_personal(String id_personal) {
        this.id_personal = id_personal;
    }

    
 public void insertar() {
        String consultaSQL = "insert into t_campana_personal (id_campana,id_personal) values ";
        consultaSQL += "('" + this.id_campana + "','" + this.id_personal +  "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    public void eliminar() {
        String consultaSQL = "DELETE FROM t_campana_personal where id_campana='" + this.id_campana + "' and id_personal='" + this.id_personal + "';";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        helper.cerrarConeccion();
    }

    public static CampanaPersonal buscarPorCodigo(String campana, String personal) {
        String consultaSQL = "select id_campana,id_personal from t_campana_personal where id_campana=" + campana + " and id_personal=" + personal + ";";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<CampanaPersonal> listaDeCampanaPersonal = new ArrayList<CampanaPersonal>();
        try {
            while (rs.next()) {
                listaDeCampanaPersonal.add(new CampanaPersonal(rs.getString("id_campana"),rs.getString("id_personal")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(consultaSQL);
        helper.cerrarConeccion();
        helper.cerrarConeccion();
        return listaDeCampanaPersonal.get(0);
    }

    public static List<CampanaPersonal> buscarCampanas( String personal) {
        String consultaSQL = "select id_campana,id_personal from t_campana_personal where id_personal=" + personal + ";";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<CampanaPersonal> listaDeCampanaPersonal = new ArrayList<CampanaPersonal>();
        try {
            while (rs.next()) {
                listaDeCampanaPersonal.add(new CampanaPersonal(rs.getString("id_campana"),
                        rs.getString("id_personal")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        System.out.println(consultaSQL);
        helper.cerrarConeccion();
        helper.cerrarConeccion();
        return listaDeCampanaPersonal;
    }
}

