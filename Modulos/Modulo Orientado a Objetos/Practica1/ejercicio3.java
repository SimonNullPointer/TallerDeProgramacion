/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package taller.practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class ejercicio3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimF = 5;  // Definir tamaño de la matriz

        // Paso 3. Definir la matriz de 5x5 e iniciarla con números aleatorios
        int[][] tabla = new int[dimF][dimF];
        int sumaFila = 0;
        int i, j;

        // Llenar la matriz con números aleatorios
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimF; j++) {
                tabla[i][j] = GeneradorAleatorio.generarInt(30);  // Generar números entre 0 y 30
            }
        }

        // Paso 4. Mostrar el contenido de la matriz en consola
        System.out.println("Contenido de la matriz:");
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimF; j++) {
                System.out.print(tabla[i][j] + "\t");  // Usar tabulación para mayor legibilidad
            }
            System.out.println();
        }

        // Paso 5. Calcular e informar la suma de los elementos de la fila 1 (fila 0 en términos de índice)
        System.out.println("La suma de la primera fila es:");
        for (j = 0; j < dimF; j++) {
            sumaFila += tabla[0][j];  // Acumular los valores de la primera fila
        }
        System.out.println(sumaFila);

        // Paso 6. Calcular la suma de los elementos de cada columna y guardarlos en un vector
        int[] vectorSumaColumnas = new int[dimF];  // Vector para almacenar las sumas de cada columna

        // Recorrer la matriz por columnas
        for (j = 0; j < dimF; j++) {
            int sumaColumna = 0;
            for (i = 0; i < dimF; i++) {
                sumaColumna += tabla[i][j];  // Sumar los elementos de la columna j
            }
            vectorSumaColumnas[j] = sumaColumna;  // Guardar la suma en el vector
        }

        // Mostrar el vector con las sumas de las columnas
        System.out.println("Suma de los elementos de cada columna:");
        for (i = 0; i < dimF; i++) {
            System.out.println("Columna " + (i + 1) + ": " + vectorSumaColumnas[i]);
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("Ingrese numero a buscar:");
        int search = Lector.leerInt();
        boolean flag = false;
        j = 0;
        i = 0;
        while (i < dimF && !flag) {
            while (j < dimF && !flag) {
                if (tabla[i][j] == search) {
                    flag = true;
                    System.out.println("Valor encontrado en la posición: [" + i + ", " + j + "]");
                } else {
                    j++;
                }
            }
            i++;
            j = 0;
        }
        if (!flag) {
            System.out.println("Valor no encontrado en la matriz.");
        }
    }

}
