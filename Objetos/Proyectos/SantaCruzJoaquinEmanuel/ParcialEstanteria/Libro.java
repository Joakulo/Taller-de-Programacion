/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEstanteria;

/**
 *
 * @author Joaco
 */
public class Libro {
    private String titulo, primerAutor;
    private double peso;

    public Libro(String titulo, String primerAutor, double peso) {
        this.titulo = titulo;
        this.primerAutor = primerAutor;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getPrimerAutor() {
        return primerAutor;
    }

    public void setPrimerAutor(String primerAutor) {
        this.primerAutor = primerAutor;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", primerAutor=" + primerAutor + ", peso=" + peso + '}';
    }
    
    
    
}
