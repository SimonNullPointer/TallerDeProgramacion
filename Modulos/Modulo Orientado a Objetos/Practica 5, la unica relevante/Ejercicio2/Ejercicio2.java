/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author estudiante
 */
public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento("Estacionamiento Central", "Calle Falsa 123");

        
        estacionamiento.registrarAuto(new Autos("Juan Perez", "ABC123"), 0, 0);
        estacionamiento.registrarAuto(new Autos("Maria Lopez", "XYZ456"), 0, 1);
        estacionamiento.registrarAuto(new Autos("Pedro Garcia", "JKL789"), 1, 2);
        estacionamiento.registrarAuto(new Autos("Laura Torres", "MNO321"), 2, 0);
        estacionamiento.registrarAuto(new Autos("Sofia Martinez", "DEF654"), 2, 1);
        estacionamiento.registrarAuto(new Autos("Diego Ramirez", "GHI987"), 2, 2);

        System.out.println(estacionamiento.representarEstacionamiento());

        int cantidadPlaza1 = estacionamiento.retornarCantidades(0);
        System.out.println("Cantidad de autos en la plaza 1: " + cantidadPlaza1);

  
        String resultado = estacionamiento.retornarAuto("MNO321");
        System.out.println(resultado);
        
    }
}
