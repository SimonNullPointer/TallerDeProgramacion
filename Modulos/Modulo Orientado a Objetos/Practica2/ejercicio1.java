/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;

/**
 *
 * @author estudiante
 */
public class ejercicio1 {
        public static void main(String[] args) {
        Persona p1; 
        p1 = new Persona();
        
        
        p1.setDNI(Lector.leerInt());
        p1.setEdad(Lector.leerInt());
        p1.setNombre(Lector.leerString());
        
        System.out.println(p1.toString());
  
    }

}
