/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

/**
 *
 * @author Joaco
 */
public class Gira extends Recital{
    private String nombre;
    private Fecha [] fechas;
    private int dimF,dimL=0;
    private int fechaActual=0;

    public Gira(String unaBanda, int DF, String nombre, int cantFechas) {
        super(unaBanda, DF);
        this.nombre = nombre;
        this.dimF = cantFechas;
        fechas = new Fecha[dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Fecha[] getFechas() {
        return fechas;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }

    public void agregarFecha(Fecha unaFecha){
        if (dimL < dimF){
            fechas[dimL]=unaFecha;
            dimL++;
        }
    }
    
    public void actuar() {
        System.out.println("Buenas noches " + fechas[fechaActual].getCiudad());
        fechaActual++;
        super.listadoDeTemas();
        System.out.println(calcularCosto());
    }

    public int calcularCosto(){
        return dimL*30000;
    }
}
