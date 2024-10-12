/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author estudiante
 */
public class Gira extends Recital{
    private String nombreGira;
    private Fecha fechasGira[];
    private int numeroFechaActual= 0;
    private int dimL = 0;

    public Gira(String nombreGira, String nombre, int cantTemas,int cantFechas) {
        super(nombre, cantTemas);
        setNombreGira(nombreGira);
        fechasGira = new Fecha[cantFechas];
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fecha[] getFechasGira() {
        return fechasGira;
    }

    public void setFechasGira(Fecha[] fechasGira) {
        this.fechasGira = fechasGira;
    }

    public int getNumeroFechaActual() {
        return numeroFechaActual;
    }

    public void setNumeroFechaActual(int numeroFechaActual) {
        this.numeroFechaActual = numeroFechaActual;
    }
    
    public void agregarFecha(Fecha unaFecha){
        fechasGira[dimL] = unaFecha;
        dimL++;
    }
    
    public void actuar(){
        System.out.println("Buenas noches..." + fechasGira[numeroFechaActual].getCiudad());
        super.actuar();
        numeroFechaActual++;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    
    
    public double calcularCosto(){
        double aux = dimL*30000;
        return aux;
    }
}
