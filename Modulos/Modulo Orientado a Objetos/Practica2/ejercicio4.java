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
public class ejercicio4 {
    public static void main(String[] args) {
        int cantPersonas = 8;
        Persona[][] casting = new Persona[5][cantPersonas];

        int[] cantidades = new int[cantPersonas];
        for (int i = 0; i < cantPersonas; i++) {
            cantidades[i] = 0;
        }
        int cant = 0;
        String nombre = GeneradorAleatorio.generarString(10);//String nombre = Lector.leerString();
        while (cant < 40 && !nombre.equals("zzz")) {
            int dia = GeneradorAleatorio.generarInt(5);//int dia = Lector.leerInt();
            if (cantidades[dia] < cantPersonas) {
                Persona p = new Persona();
                p.setDNI(GeneradorAleatorio.generarInt(20000));
                p.setEdad(GeneradorAleatorio.generarInt(90));
                p.setNombre(nombre);
                casting[dia][cantidades[dia]] = p;
                cantidades[dia]++;
                cant++;
            } else {
                System.out.println("no hay mas cupos");
            }
            nombre = Lector.leerString();
        }
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
