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
public class Hileras extends Coros {

    private Corista[][] matrizCoros;
    private int dimL = 0;
    private int dimColumnas;

    
    public Hileras(String nombre, Director unDirector, int filas, int cantCoristasPorFilas) {
        super(nombre, unDirector,filas);
        matrizCoros = new Corista[filas][cantCoristasPorFilas];
        setDimColumnas(cantCoristasPorFilas);
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public int getDimColumnas() {
        return dimColumnas;
    }

    public void setDimColumnas(int dimColumnas) {
        this.dimColumnas = dimColumnas;
    }

    public void agregarCorista(Corista unCorista) {
        int i =0;
        int j = 0;
        boolean agregado = false;

    while (i < this.getDimF() && !agregado) {
        while (j < this.getDimColumnas() && !agregado) {
            if (matrizCoros[i][j] == null) { 
                matrizCoros[i][j] = unCorista; 
                agregado = true; 
            }
            j++;
        }
        i++;
        j = 0; 
    }
    }

    public boolean estaLleno() {
        return dimL == (this.getDimF() * dimColumnas);

    }

    
    //consultar
public boolean bienFormado() {
    int[] tonalidades = new int[this.getDimF()];
    for (int i=0; i<this.getDimF();i++){
        tonalidades[i] = matrizCoros[i][0].getTonalidad();
        
        
        for (int j=0; j<getDimColumnas();j++){
            if(matrizCoros[i][j].getTonalidad()!=tonalidades[i]){
                return false;
            }
        }
    }

    return ordenado(tonalidades);
}
@Override
public String toString() {
        String aux ="";
        aux += super.toString();
        aux += "Coristas:";
        for (int i= 0; i<this.getDimF();i++) {
            for (int j=0; j<getDimColumnas();j++) {
                if (matrizCoros[i][j]!= null) {
                    aux += matrizCoros[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
}
