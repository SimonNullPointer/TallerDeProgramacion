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
public class Director extends Persona{
    private int antiguedad;

    public Director(int antiguedad, int dni, int edad, String nombre) {
        super(dni, edad, nombre);
        setAntiguedad(antiguedad);
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        return aux + "Director{" + "antiguedad=" + antiguedad + '}';
    }
    
    
}
