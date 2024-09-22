/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package taller.practica1;
import PaqueteLectura.Lector;
/**
 *
 * @author estudiante
 */
public class ejercicio2 {
    public static void Main(String[] args){
      int i, cant;
      double prom; 
      double tot = 0;
      int dimF = 15;
      double [] alturas = new double[dimF];

      for (i=0;i<dimF;i++){
          alturas[i] = Lector.leerDouble();
          tot = tot + alturas[i];
      }
      prom = tot/dimF;
      System.out.println(prom);
      cant = 0;
        for (i=0;i<dimF;i++){
          if (alturas[i]>prom) {
              cant= cant + 1;
          }
      }
        System.out.println(cant);
    }
    }
