



package ejercicio4;

public class Semicirculo extends Coros {
    private Corista[] coristas;
    private int dimL = 0;   

    public Semicirculo(String nombre, Director unDirector, int cantCoristas) {
        super(nombre, unDirector,cantCoristas);
        coristas = new Corista[cantCoristas];
    }

    public void agregarCorista(Corista unCorista) {
        if (dimL < this.getDimF()) {
            coristas[dimL] = unCorista;
            dimL++;
        } else {
            System.out.println("El coro ya está lleno, no se puede agregar más coristas.");
        }
    }

    public boolean estaLleno() {
        return dimL == this.getDimF();
    }

    
       
    private int[] generarVector(Corista[] vector){
        int[] tonalidades = new int[this.getDimF()];
        for (int i = 0; i < this.getDimF(); i++) {
            tonalidades[i] = vector[i].getTonalidad();  
    }
         return tonalidades;
    }
    
    public boolean bienFormado() {
        int[] tonalidades = generarVector(coristas);
        return ordenado(tonalidades); 
    }
    

    public Corista[] getCoristas() {
        return coristas;
    }

    public void setCoristas(Corista[] coristas) {
        this.coristas = coristas;
    }

    public int getDimL() {
        return dimL;
    }

    @Override
    public String toString() {
        String aux ="";
        aux += super.toString();
        for (int j=0; j<getDimL();j++) {
                    aux += coristas[j].toString() + "\n";
                }
        return aux;
    }

}
