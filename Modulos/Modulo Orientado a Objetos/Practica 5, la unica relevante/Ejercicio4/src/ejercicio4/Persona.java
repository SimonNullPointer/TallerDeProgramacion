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
public abstract class Persona {

    private int dni;
    private int edad;
    private String nombre;

    public Persona(int dni, int edad, String nombre) {
        setDni(dni);
        setEdad(edad);
        setNombre(nombre);
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int DNI) {
        this.dni = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    @Override
    public String toString() {
        return "dni=" + dni + ", edad=" + edad + ", nombre=" + nombre;
    }
    
}
