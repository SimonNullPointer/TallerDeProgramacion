package ejercicio4;

public class Ejercicio4 {
    public static void main(String[] args) {
        Director unDirector = new Director(10,463333,25,"simon");
        Semicirculo unCoro = new Semicirculo("la banda", unDirector,2);
        Corista unCorista = new Corista(2,45,20,"simon");
        Corista otroCorista = new Corista(3,46,21,"simon2");
        unCoro.agregarCorista(otroCorista);
        unCoro.agregarCorista(unCorista);
        System.out.println(unCoro.bienFormado());
    }
}
