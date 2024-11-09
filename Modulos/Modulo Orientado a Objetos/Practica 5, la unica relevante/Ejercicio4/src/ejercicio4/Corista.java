/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author estudiante
 */
public class Corista extends Persona{
    private int tonalidad;

    public Corista(int tonalidad, int dni, int edad, String nombre) {
        super(dni, edad, nombre);
        setTonalidad(tonalidad);
    }
    
    public int getTonalidad() {
        return tonalidad;
    }

    public void setTonalidad(int tonalidad) {
        this.tonalidad = tonalidad;
    }

    @Override
    public String toString() {
        return  super.toString() + "Corista{" + "tonalidad=" + tonalidad + '}';
    }
    
}
