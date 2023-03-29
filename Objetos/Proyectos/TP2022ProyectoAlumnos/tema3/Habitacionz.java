/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author alumnos
 */
public class Habitacionz {
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
                                
    public Habitacionz() {
        this.ocupada = false;
        this.costo = GeneradorAleatorio.generarInt(2000); 
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }

    public Habitacionz(double costo, boolean ocupada, Persona cliente) {
        this.costo = costo;
        this.ocupada = ocupada;
        this.cliente = cliente;
    }
    
    public void agregarCliente(Persona c){
        this.ocupada= true;
        this.cliente= c;
    }
}
