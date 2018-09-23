/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema.educativo;

import java.util.Vector;
import javax.swing.JOptionPane;
import vista.JFNiveles;
import vista.nivel1.JFN1Juego1;
import vista.nivel1.JFN1Juego2;
import vista.nivel2.JFN2Juego1;
import vista.nivel2.JFN2Juego2;
import vista.nivel3.JFN3Juego1;
import vista.nivel3.JFN3Juego2;
import vista.nivel4.JFN4Juego1;
import vista.nivel4.JFN4Juego2;

/**
 *
 * @author carlo
 */
public class Controlador {

    public static void manejador(int puntaje, String juego, Vector data) {
        if (puntaje >= 3) {
            JOptionPane.showMessageDialog(null, "Felicidades lo Hiciste Muy bien");
            siguiente(juego, data);
        } else {
            if (repeticiones(data)) {
                JOptionPane.showMessageDialog(null, "Animo Puedes Hacerlo Mejor!!!");
                repetir(juego, data);
            } else {
                JOptionPane.showMessageDialog(null, "Felicidades lo Hiciste Muy bien");
                siguiente(juego, data);
            }
        }
    }

    static private void siguiente(String juego, Vector data) {
        switch (juego) {
            case "1,1":
                JFN1Juego2 oJFN1Juego2 = new JFN1Juego2(data);
                oJFN1Juego2.setVisible(true);
                break;
            case "1,2":
                JFNiveles oJFNiveles2 = new JFNiveles("Nivel2", data);
                oJFNiveles2.setVisible(true);
                break;
            case "2,1":
                JFN2Juego2 oJFN2Juego2 = new JFN2Juego2(data);
                oJFN2Juego2.setVisible(true);
                break;
            case "2,2":
                JFNiveles oJFNiveles3 = new JFNiveles("Nivel3", data);
                oJFNiveles3.setVisible(true);
                break;
            case "3,1":
                JFN3Juego2 oJFN3Juego2 = new JFN3Juego2(data);
                oJFN3Juego2.setVisible(true);
                break;
            case "3,2":
                JFNiveles oJFNiveles4 = new JFNiveles("Nivel4", data);
                oJFNiveles4.setVisible(true);
                break;
            case "4,1":
                JFN4Juego2 oJFN4Juego2 = new JFN4Juego2(data);
                oJFN4Juego2.setVisible(true);
                break;
            case "4,2":
                JFNiveles oJFNivelesF = new JFNiveles("Resultados", data);
                oJFNivelesF.setVisible(true);
                break;
        }

    }

    static private void repetir(String juego, Vector data) {
        switch (juego) {
            case "1,1":
                JFN1Juego1 oJFN1Juego1 = new JFN1Juego1(data);
                oJFN1Juego1.setVisible(true);
                break;
            case "1,2":
                JFN1Juego2 oJFN1Juego2 = new JFN1Juego2(data);
                oJFN1Juego2.setVisible(true);
                break;
            case "2,1":
                JFN2Juego1 oJFN2Juego1 = new JFN2Juego1(data);
                oJFN2Juego1.setVisible(true);
                break;
            case "2,2":
                JFN2Juego2 oJFN2Juego2 = new JFN2Juego2(data);
                oJFN2Juego2.setVisible(true);
                break;
            case "3,1":
                JFN3Juego1 oJFN3Juego1 = new JFN3Juego1(data);
                oJFN3Juego1.setVisible(true);
                break;
            case "3,2":
                JFN3Juego2 oJFN3Juego2 = new JFN3Juego2(data);
                oJFN3Juego2.setVisible(true);
                break;
            case "4,1":
                JFN4Juego1 oJFN4Juego1 = new JFN4Juego1(data);
                oJFN4Juego1.setVisible(true);
                break;
            case "4,2":
                JFN4Juego2 oJFN4Juego2 = new JFN4Juego2(data);
                oJFN4Juego2.setVisible(true);
                break;
        }

    }

    private static boolean repeticiones(Vector data) {
        int numeroDeJuego = (int) data.get(data.size() - 1);
        int repeticion = ((Juego) data.get(numeroDeJuego)).getIntento();
        if (repeticion < 3) {
            //actualizar juego
            Juego nJuego = (Juego) data.get(numeroDeJuego);
            nJuego.setIntento(repeticion + 1);
            System.out.println("Numero de Juego : " + numeroDeJuego);
            System.out.println("Numero de Intento :" + nJuego.getIntento());
            data.set(numeroDeJuego, nJuego);
            return true;
        } else {
            return false;
        }

    }
}
