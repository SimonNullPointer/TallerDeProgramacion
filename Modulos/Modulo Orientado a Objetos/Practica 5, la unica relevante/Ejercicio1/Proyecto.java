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
public class Proyecto {
    //v i
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[] investigadores;
    private int dimL = 0;
    
    //constructor
    public Proyecto(String nombre, int codigo, String director){
        setNombre(nombre);
        setCodigo(codigo);
        setDirector(director);
        setInvestigadores(new Investigador[50]);
    }
    
    
    
    //inciso a
    
    public void agregarInvestigador(Investigador unInvestigador){
        investigadores[dimL] = unInvestigador;
        dimL++;
    }
    
    //inciso c
    
    public double dineroTotalOtorgado(){
        double aux=0;
        for(int i= 0; i<dimL;i++){
            for (int j= 0; j<investigadores[i].getDimL();j++){
                if (investigadores[i].getCantSubsidios()[j].isEstado()){
                    aux+= investigadores[i].getCantSubsidios()[j].getMonto();
                }   
            }
        }
        return aux;
    }
    
    public void otorgarTodos(String nombre_completo){
        int i = 0;
        while (i<dimL && !investigadores[i].getNombre().equals(nombre_completo)){
            i++;
        }
        if (i<dimL && investigadores[i].equals(nombre_completo)){
            for (int j= 0; j<investigadores[i].getDimL();j++){
                if(!investigadores[i]
                        .getCantSubsidios()[j]
                        .isEstado())
                    
                        investigadores[i]
                        .getCantSubsidios()[j]
                        .setEstado(true);
            }
        }
    };
    
    
// getters and setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    @Override
public String toString() {
    String nombre = this.nombre;
    int codigo = this.codigo;
    String director = this.director;
    double total = dineroTotalOtorgado();
    
    String listaInvestigadores = "";
    for (int i = 0; i < dimL; i++) {
        listaInvestigadores += investigadores[i].toString() + "\n"; // Concatenación acumulativa
    }
    
    return "Nombre del Proyecto: " + nombre + "\n" +
           "Código: " + codigo + "\n" +
           "Director: " + director + "\n" +
           "Total Dinero Otorgado: " + total + "\n" +
           "Investigadores:\n" + listaInvestigadores;
}
    
}
