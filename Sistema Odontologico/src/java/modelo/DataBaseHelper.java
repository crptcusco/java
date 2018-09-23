/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Carlos
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBaseHelper {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost/db_sistema_odontologico";
    private static final String USUARIO = "root";
    private static final String CLAVE = "";
    Connection conexion = null;
    Statement sentencia = null;
    

    public int modificarRegistro(String consultaSQL) {
        
        int filasAfectadas = 0;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL,
                    USUARIO, CLAVE);
            sentencia = conexion.createStatement();
            filasAfectadas = sentencia.executeUpdate(consultaSQL);
        } catch (ClassNotFoundException e) {
            System.out.println("Error driver" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error de SQL" + e.getMessage());
        } finally {
//            if (sentencia != null) {
//                try {
//                    sentencia.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (conexion != null) {
//                try {
//                    conexion.close();
//                } catch (SQLException e) {
//                }
//            }
        }
        return filasAfectadas;
    }

    public ResultSet seleccionarRegistros(String consultaSQL) {
        
        ResultSet filas = null;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL,
                    USUARIO, CLAVE);
            sentencia = conexion.createStatement();
            filas = sentencia.executeQuery(consultaSQL);
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error Driver" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error de SQL " + e.getMessage());
        }
        return filas;
        
    }
    
    public void cerrarConeccion(){

                try {
                    sentencia.close();
                } catch (SQLException e) {
                }


                try {
                    conexion.close();
                } catch (SQLException e) {
                }

    }
    
}
