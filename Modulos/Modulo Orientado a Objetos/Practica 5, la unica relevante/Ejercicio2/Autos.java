/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author estudiante
 */
public class Autos {
    private String duenio;
    private String patente;

    public Autos(String duenio, String patente) {
        this.duenio = duenio;
        this.patente = patente;
    }
    

    public String getDuenio() {
        return duenio;
    }

    public void setDuenio(String duenio) {
        this.duenio = duenio;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Autos{" + "propietario=" + duenio + ", patente=" + patente + '}';
    }
    
}
