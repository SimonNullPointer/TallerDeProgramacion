package taller.practica1;

import PaqueteLectura.GeneradorAleatorio;

public class ejercicio5 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int rangoClientes = 5;
        int calificaciones = 4;
        int[][] clientes = new int[rangoClientes][calificaciones];

        // Generar calificaciones aleatorias
        for (int i = 0; i < rangoClientes; i++) {
            for (int j = 0; j < calificaciones; j++) {
                int calificacion = GeneradorAleatorio.generarInt(10);
                clientes[i][j] = calificacion;
            }
        }

        System.out.println("\tAtención al cliente\tCalidad de la comida\t     Precio\t\tAmbiente");

        // Mostrar las calificaciones de los clientes
        for (int i = 0; i < rangoClientes; i++) {
            System.out.print("Cliente " + (i + 1) + ":\t");
            for (int j = 0; j < calificaciones; j++) {
                System.out.print(clientes[i][j] + "\t\t       ");
            }
            System.out.println();
        }

        // Calcular promedios por aspecto
        double[] vectorAspectos = new double[calificaciones];
        for (int j = 0; j < calificaciones; j++) {
            int sumaColumna = 0;
            for (int i = 0; i < rangoClientes; i++) {  
                sumaColumna += clientes[i][j]; 
            }
            vectorAspectos[j] = (double) sumaColumna / rangoClientes;  
        }

        // Mostrar promedios
        System.out.println("\nPromedios por aspecto:");
        for (int i = 0; i < calificaciones; i++) {
            System.out.println("Aspecto " + (i + 1) + ": " + vectorAspectos[i]);
        }
    }
}