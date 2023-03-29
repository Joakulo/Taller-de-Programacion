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
public abstract class Libro {
    private String titulo;
    private double precioBase;
    private String [] vector;
    private int dimL;

    public Libro(String titulo, double precioBase) {
        this.titulo = titulo;
        this.precioBase = precioBase;
        vector = new String[8];
        int i;
        for (i=0;i<8;i++){
            vector[i]="";
        }
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public String[] getVector() {
        return vector;
    }
    
    public void agregarAutor(String autor){
        vector[dimL]=autor;
        dimL++;
    }
    
    public double precioFinal(){
        double aux = precioBase + (precioBase * 0.21);
        return aux;
    }

    @Override
    public String toString() {
        int i;
        String aux="Libro{" + "Titulo=" + titulo + 
                ", Autores= \n";
        for (i=0;i<dimL;i++){
            aux += vector[i] + "\n";
        }
        return aux;     
    }
    
    
    
}
