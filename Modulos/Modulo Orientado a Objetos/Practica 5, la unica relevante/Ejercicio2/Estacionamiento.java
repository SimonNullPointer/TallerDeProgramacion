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
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Autos [][] matrizAutos;
    private int dimensionPlaza;
    private int dimensionPiso;
    
    public Estacionamiento(String nombre,String direccion){
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura("08.00");
        setHoraCierre("21.00");
        setMatrizAutos(new Autos[5][10]);
        setDimensionPlaza(10);
        setDimensionPiso(5);
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int n, int m) {
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura(horaApertura);
        setHoraCierre(horaCierre);
        setMatrizAutos(new Autos[n][m]);
        setDimensionPlaza(m);
        setDimensionPiso(n);
    }

    //inciso c-1
    
    public void registrarAuto(Autos unAuto, int x, int y){
        matrizAutos[x][y]= unAuto;
    }
    
public String retornarAuto(String patente) {
    for (int i = 0; i < getDimensionPiso(); i++) {
        for (int j = 0; j < getDimensionPlaza(); j++) {
            if (matrizAutos[i][j] != null && matrizAutos[i][j].getPatente().equals(patente)) {
                return "El auto se encuentra en:" + "\n" +"Piso: "+ i + " " +"Plaza: "+ j; 
            }
        }
    }
    return "no se encontró nada";
}

public String representarEstacionamiento() {
    String resultado = "";
    
   
    for (int i = 0; i < getDimensionPiso(); i++) {
        
        for (int j = 0; j < getDimensionPlaza(); j++) {
           
            resultado = resultado + "Piso " + (i + 1) + " Plaza " + (j + 1) + ": ";
            
            if (matrizAutos[i][j] == null) {
                resultado = resultado + "libre";
            } else {
                
                resultado = resultado + matrizAutos[i][j].toString();
            }
            
            resultado = resultado + "\n";
        }
    }
    
    return resultado; 
}
public int retornarCantidades(int plaza){
    int aux = 0;
    for (int i=0; i<getDimensionPiso();i++){
        if(matrizAutos[i][plaza]!=null){
            aux++;
        }
    }
    return aux;
}

    public int getDimensionPlaza() {
        return dimensionPlaza;
    }

    public void setDimensionPlaza(int dimensionPlaza) {
        this.dimensionPlaza = dimensionPlaza;
    }

    public int getDimensionPiso() {
        return dimensionPiso;
    }

    public void setDimensionPiso(int dimensionPiso) {
        this.dimensionPiso = dimensionPiso;
    }
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Autos[][] getMatrizAutos() {
        return matrizAutos;
    }

    public void setMatrizAutos(Autos[][] matrizAutos) {
        this.matrizAutos = matrizAutos;
    }
    
}
