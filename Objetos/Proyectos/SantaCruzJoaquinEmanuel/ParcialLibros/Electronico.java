/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialLibros;

/**
 *
 * @author Joaco
 */
public class Electronico extends Libro{
    private String formato;
    private double tamanio;

    public Electronico(String titulo, double precioBase, String formato, double tamanio) {
        super(titulo, precioBase);
        this.formato = formato;
        this.tamanio = tamanio;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public double getTamanio() {
        return tamanio;
    }

    public void setTamanio(double tamanio) {
        this.tamanio = tamanio;
    }

    public double precioFinal() {
        return super.precioFinal() + (2.5 * tamanio);
    }

    @Override
    public String toString() {
        return super.toString() + "Electronico{ Precio Final: " + precioFinal() + ", Formato: " + formato + ", Tamanio=" + tamanio + "MB}";
    }

    
    
    
}
