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
public class Fisico extends Libro{
    private boolean tapaDura;

    public Fisico(String titulo, double precioBase, boolean tapaDura) {
        super(titulo, precioBase);
        this.tapaDura = tapaDura;
    }

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    public double precioFinal(){
        if (!tapaDura){
        return super.precioFinal();
        } else {
            return super.precioFinal() + 500;
        }
    }

    @Override
    public String toString() {
        String aux = super.toString() + "Fisico{" + super.precioFinal();
        if (tapaDura){
            return aux + ", tapa dura}";
        } else {
            return aux + ", tapa blanda}";
        }
        
    }
    
    
}
