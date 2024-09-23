/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author estudiante
 */
public class ejercicio3 {
        public static void main(String[] args) {
  
    Persona[][] casting = new Persona[5][8];
        int a = 0;
        int b;
        String nombre = Lector.leerString();
        while (a < 5 && !nombre.equals("zzz")) {
            b = 0;
            while (b < 8 && !nombre.equals("zzz")) {
                Persona p = new Persona();
                p.setDNI(GeneradorAleatorio.generarInt(20000));
                p.setEdad(GeneradorAleatorio.generarInt(90));
                p.setNombre(nombre);
                casting[a][b] = p;
                b++;
                nombre = Lector.leerString();
            }
            a++;
        }

        // Imprime los datos de las personas en la matriz
        for (int dia = 0; dia < 5; dia++) {
    System.out.println("Día " + (dia + 1) + ":");
    for (int turno = 0; turno < 8; turno++) {
        if (casting[dia][turno] != null) {
            System.out.println("  Turno " + (turno + 1) + ": " + casting[dia][turno].getNombre());
        } else {
            System.out.println("  Turno " + (turno + 1) + ": Vacante");
        }
    }
}
}
}