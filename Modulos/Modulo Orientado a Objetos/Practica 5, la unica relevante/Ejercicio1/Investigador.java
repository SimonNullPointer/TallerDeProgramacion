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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidios[] cantSubsidios;
    private int dimL = 0;
    
    //constructor
    public Investigador(String nombre, int categoria, String especialidad){
        setNombre(nombre);
        setCategoria(categoria);
        setEspecialidad(especialidad);
        setCantSubsidios(new Subsidios[5]);
    }
    
    //inciso b
    public void agregarSubsidio(Subsidios unSubsidio){
        cantSubsidios[dimL] = unSubsidio;
        cantSubsidios[dimL].setEstado(true);
        dimL++;
    }
    
    //getters and setters

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidios[] getCantSubsidios() {
        return cantSubsidios;
    }

    public void setCantSubsidios(Subsidios[] cantSubsidios) {
        this.cantSubsidios = cantSubsidios;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    public String toString(){
        double total = 0;
        for (int i=0; i<dimL; i++){
            if(cantSubsidios[i].isEstado()){
                total+= cantSubsidios[i].getMonto();
            }
        }
        return "Nombre: " + nombre + "\n" +
           "Categoría: " + categoria + "\n" +
           "Especialidad: " + especialidad + "\n" +
           "Total dinero otorgado en subsidios: " + total + "\n";
    }
}
