/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema.educativo;

/**
 *
 * @author carlo
 */
public class Juego {
    private String nombre;
    private int intento;
    private int puntaje;  

    public Juego(String nombre, int intento, int puntaje) {
        this.nombre = nombre;
        this.intento = intento;
    }
   
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIntento() {
        return intento;
    }

    public void setIntento(int intento) {
        this.intento = intento;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
    
}
