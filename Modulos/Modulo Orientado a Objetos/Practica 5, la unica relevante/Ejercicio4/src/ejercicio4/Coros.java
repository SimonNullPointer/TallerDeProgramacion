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
public abstract class Coros {
    private String nombre;
    private Director unDirector;
    private int dimF;

    public Coros(String nombre, Director unDirector,int dimF) {
        setNombre(nombre);
        setUnDirector(unDirector);
        setDimF(dimF);
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getUnDirector() {
        return unDirector;
    }

    public void setUnDirector(Director unDirector) {
        this.unDirector = unDirector;
    }
    public boolean ordenado(int[] vectorCoro) {
        for (int i = 0; i < dimF - 1; i++) {  
            if (vectorCoro[i] <= vectorCoro[i + 1]) {
                return false;  
            }
        }
        return true; 
    }
    //agregar override;
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean estaLleno();
    public abstract boolean bienFormado();

    @Override
     public String toString() {
         String aux= "";
        String director = getUnDirector().toString();
        aux += director + "\n";
        String nombreCoro = getNombre();
        aux+= nombreCoro + "\n";
        return aux;
    }
    
    
    
}
    