/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Joaco
 */
public class CTrabajador extends CPersona{
    private String trabajo;

    public CTrabajador( String unNombre, int unDNI, int unaEdad,String trabajo) {
        super(unNombre, unDNI, unaEdad);
        this.trabajo = trabajo;
    }

    public CTrabajador() {
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }

    public String toString() {
        return super.toString() + " Soy " + trabajo + ".";
    }
    
    
    
    
}
