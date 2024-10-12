package ejercicio3;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author estudiante
 */
public abstract class Recital {
    private String nombre;
    private String[] listaTemas;
    private int dimL = 0;
    
    public Recital(String nombre,int cantTemas){
        setNombre(nombre);
        listaTemas = new String[cantTemas];
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }
    
    public void agregarTema(String unTema){
        listaTemas[dimL] = unTema;
        dimL++;
    }
    
    public void actuar(){
        for (int i=0;i<dimL;i++){  
            System.out.println("y ahora tocaremos: " + listaTemas[i]);
        }
    }
    public abstract double calcularCosto();
}