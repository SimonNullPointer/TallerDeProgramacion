/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package taller.practica1;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author estudiante
 */
public class ejercicio4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int pisos = 8;
        int oficinas = 4;
        int cantidadEventos = 20; //test

        int tabla[][] = new int[pisos][oficinas];

        // Inicializar la matriz
        for (int i = 0; i < pisos; i++) {
            for (int j = 0; j < oficinas; j++) {
                tabla[i][j] = 0;
            }
        }

        int cant = 0;
        int piso = GeneradorAleatorio.generarInt(pisos);
        while (cant != cantidadEventos) {
            int ofi = GeneradorAleatorio.generarInt(oficinas);
            tabla[piso][ofi]++;
            piso = GeneradorAleatorio.generarInt(pisos);
            cant++;
        }

        // Imprimir la matriz con mejor visibilidad
        System.out.println("\tOficina 1\tOficina 2\tOficina 3\tOficina 4");
        System.out.println("------------------------------------------------------------");
        for (int i = 0; i < pisos; i++) {
            System.out.print("Piso " + (i + 1) + "\t");
            for (int j = 0; j < oficinas; j++) {
                System.out.print(tabla[i][j] + "\t\t"); 
            }
            System.out.println(); 
            System.out.println("------------------------------------------------------------"); 
        }
    }
}
