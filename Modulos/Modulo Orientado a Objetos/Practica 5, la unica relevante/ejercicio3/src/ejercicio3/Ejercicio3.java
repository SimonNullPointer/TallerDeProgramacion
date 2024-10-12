/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author estudiante
 */
public class Ejercicio3 {
    public static void main(String[] args) {
      
        Evento eventoOcasional = new Evento("show privado", "Juan Pérez", 15, "Concierto de Iron Maiden", 3);
        eventoOcasional.agregarTema("The Trooper");
        eventoOcasional.agregarTema("Fear of the Dark");
        eventoOcasional.agregarTema("Hallowed Be Thy Name");

        
        System.out.println("Costo del evento ocasional: " + eventoOcasional.calcularCosto());

        // Actuar en el evento ocasional
        eventoOcasional.actuar();

        // Crear una gira
        Gira gira = new Gira("Gira Mundial", "Concierto de Black Sabbath", 3, 2);
        gira.agregarFecha(new Fecha("Buenos Aires", 15));
        gira.agregarFecha(new Fecha("Santiago", 20));
        gira.agregarTema("Paranoid");
        gira.agregarTema("Iron Man");
        gira.agregarTema("War Pigs");

        System.out.println("Costo de la gira: " + gira.calcularCosto());

        // Actuar en la gira
        gira.actuar(); // Actua en Buenos Aires
        gira.actuar(); // Actua en Santiago
    }
}
