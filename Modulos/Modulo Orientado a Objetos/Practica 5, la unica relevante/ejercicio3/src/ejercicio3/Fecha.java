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
public class Fecha {
    private String ciudad;
    private int dia;

    public Fecha(String ciudad, int dia) {
        setCiudad(ciudad);
        setDia(dia);
    }
    
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public String toString() {
        return "Fecha{" + "ciudad=" + ciudad + ", dia=" + dia + '}';
    }
    
}
