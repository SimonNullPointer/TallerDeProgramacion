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
public class Evento extends Recital {

    private String Motivo;
    private String nombreContratador;
    private int dia;

    public Evento(String Motivo, String nombreContratador, int dia, String nombre, int cantTemas) {
        super(nombre, cantTemas);
        setMotivo(Motivo);
        setNombreContratador(nombreContratador);
        setDia(dia);
    }

    public String getMotivo() {
        return Motivo;
    }

    public void setMotivo(String Motivo) {
        this.Motivo = Motivo;
    }

    public String getNombreContratador() {
        return nombreContratador;
    }

    public void setNombreContratador(String nombreContratador) {
        this.nombreContratador = nombreContratador;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public void actuar() {

        switch (getMotivo()) {
            case "a beneficio":
                System.out.println("Recuerden colaborar con... " + getNombreContratador());
                break;
            case "show de tv":
                System.out.println("Saludos amigos televidentes");
                break;
            case "show privado":
                System.out.println("Un feliz cumpleaños para... " + getNombreContratador());
                break;
            default:
                System.out.println("Evento especial.");
                break;
        }
        super.actuar();
    }

    public double calcularCosto() {
        switch (getMotivo()) {
            case "a beneficio":
                return 0;
            case "show de tv":
                return 50000;
            case "show privado":
                return 150000;
            default:
                return -1;
        }
    }
}
