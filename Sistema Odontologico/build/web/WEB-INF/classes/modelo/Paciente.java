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
public class Paciente {
    private String codigo;
    private String nombre;
    private String apellido;
    private String fecha;
    private String dni;
    private String sexo;

    public Paciente(String nombre, String apellido, String fecha, String dni, String sexo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.sexo = sexo;
    }

    public Paciente(String codigo, String nombre, String apellido, String fecha, String dni, String sexo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
        this.dni = dni;
        this.sexo = sexo;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    public void insertar() {
        String consultaSQL = "insert into t_paciente (c_nombres,c_apellidos,c_fecha_nac,c_dni,"
                + "c_sexo) values ";
        consultaSQL += "('" + this.nombre + "','" + this.apellido + "','" + this.fecha + "','" + this.dni + "','" + this.sexo + "')";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
        
        DataBaseHelper helper2 = new DataBaseHelper();
        String consultaSQL2 = "select * from t_paciente order by id_paciente desc limit 1";
        ResultSet rs = helper2.seleccionarRegistros(consultaSQL2);
        List<Paciente> listaDePaciente = new ArrayList<Paciente>();
        try {
            while (rs.next()) {
                listaDePaciente.add(new Paciente(rs.getString("id_paciente"),
                        rs.getString("c_nombres"), rs.getString("c_apellidos"),
                        rs.getString("c_fecha_nac"),
                        rs.getString("c_dni") , rs.getString("c_sexo")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        for (Paciente paciente : listaDePaciente) {
        this.codigo=paciente.codigo;
        }
    }
    
    public void eliminar() {
        String consultaSQL = "DELETE FROM t_paciente where id_paciente='"+ this.codigo+"'";
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }
    
    public void modificar() {
        String consultaSQL = "update t_paciente set c_nombres='"+ this.nombre+
                "',c_apellidos='"+ this.apellido+
                "',c_fecha_nac='"+ this.fecha+
                "',c_dni='"+ this.dni+
                "',c_sexo='"+ this.sexo+ 
                "' where id_paciente='"+ this.codigo+"'";
        
        DataBaseHelper helper = new DataBaseHelper();
        helper.modificarRegistro(consultaSQL);
    }

    /**
     *
     * @return
     */
    public static List<Paciente> buscarTodos() {
        String consultaSQL = "select id_paciente,c_nombres,c_apellidos,c_fecha_nac,c_dni,c_sexo from t_paciente";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Paciente> listaDePaciente = new ArrayList<Paciente>();
        try {
            while (rs.next()) {
                listaDePaciente.add(new Paciente(rs.getString("id_paciente"),
                        rs.getString("c_nombres"), rs.getString("c_apellidos"),
                        rs.getString("c_fecha_nac"),
                        rs.getString("c_dni") , rs.getString("c_sexo")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDePaciente;
    }
    
    public static List<Paciente> buscarPorNombre(String nombre) {
        String consultaSQL = "select id_paciente,c_nombres,c_apellidos,c_fecha_nac,"
                + "c_dni,c_sexo from t_paciente WHERE c_nombres LIKE '%"+nombre+"%' || c_apellidos LIKE '%"+ nombre +"%';";
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Paciente> listaDePaciente = new ArrayList<Paciente>();
        try {
            while (rs.next()) {
                listaDePaciente.add(new Paciente(rs.getString("id_paciente"),
                        rs.getString("c_nombres"), rs.getString("c_apellidos"),
                        rs.getString("c_fecha_nac"),
                        rs.getString("c_dni") , rs.getString("c_sexo")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDePaciente;
    }

    public static Paciente buscarPorCodigo(String codigo) {
         String consultaSQL = "select id_paciente,c_nombres,c_apellidos,c_fecha_nac,c_dni,c_sexo from t_paciente where  id_paciente=" + codigo;
        DataBaseHelper helper = new DataBaseHelper();
        ResultSet rs = helper.seleccionarRegistros(consultaSQL);
        List<Paciente> listaDePaciente = new ArrayList<Paciente>();
        try {
            while (rs.next()) {
                listaDePaciente.add(new Paciente(rs.getString("id_paciente"),
                        rs.getString("c_nombres"), rs.getString("c_apellidos"),
                        rs.getString("c_fecha_nac"),
                        rs.getString("c_dni"), rs.getString("c_sexo")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaDePaciente.get(0);
    }

}
