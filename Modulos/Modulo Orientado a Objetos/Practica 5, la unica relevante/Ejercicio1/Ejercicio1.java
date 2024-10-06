/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author estudiante
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         Proyecto proyecto = new Proyecto("Proyecto IA", 101, "Dr. Juan Pérez");

        
        Investigador inv1 = new Investigador("Ana Gómez", 3, "Inteligencia Artificial");
        Investigador inv2 = new Investigador("Luis Rodríguez", 2, "Redes Neuronales");
        Investigador inv3 = new Investigador("Carla López", 4, "Procesamiento de Lenguaje Natural");

        
        proyecto.agregarInvestigador(inv1);
        proyecto.agregarInvestigador(inv2);
        proyecto.agregarInvestigador(inv3);

       
        inv1.agregarSubsidio(new Subsidios(10000, "Investigación sobre IA"));
        inv1.agregarSubsidio(new Subsidios(5000, "Desarrollo de algoritmos"));

        inv2.agregarSubsidio(new Subsidios(15000, "Estudio de Redes Neuronales"));
        inv2.agregarSubsidio(new Subsidios(8000, "Optimización de modelos"));
        
        inv3.agregarSubsidio(new Subsidios(12000, "Procesamiento de texto"));
        inv3.agregarSubsidio(new Subsidios(6000, "Nuevas técnicas en PNL"));

        
        proyecto.otorgarTodos("Ana Gómez");

        System.out.println(proyecto.toString());
    }
    
}
