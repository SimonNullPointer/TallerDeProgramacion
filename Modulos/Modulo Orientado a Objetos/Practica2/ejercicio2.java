/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author estudiante
 */
public class ejercicio2 {
        public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        int dimF = 15;
        Persona[] gente = new Persona[dimF];

        int dimL = 0;
        int edad = GeneradorAleatorio.generarInt(90);
        while (dimL < dimF && edad != 0) {
            Persona p = new Persona();
            p.setEdad(edad);
            p.setDNI(GeneradorAleatorio.generarInt(100000)); // Assuming DNI needs a larger range
            p.setNombre(GeneradorAleatorio.generarString(10));
            gente[dimL] = p;
            dimL++;
            edad = GeneradorAleatorio.generarInt(90);
        }
        int minEdad = 99;
        Persona personaMenor = new Persona();
        System.out.println("Edades de las personas:");
        for (int i = 0; i < dimL; i++) {
            if (gente[i].getEdad()>65) {
                System.out.println(gente[i].toString());
            }
            if (gente[i].getEdad()<minEdad) {
                personaMenor = gente[i];
                minEdad = gente[i].getEdad();
            }
        }
        System.out.println(personaMenor.toString());
    }
}