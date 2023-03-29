/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author alumnos
 */
public class Hotelz {
    private int numHab;
    private Habitacionz hab[];

    public Hotelz(int numHab) {
        this.numHab = numHab;
        this.hab = new Habitacionz[numHab];
    }

    public int getNumHab() {
        return numHab;
    }

    public void setNumHab(int numHab) {
        this.numHab = numHab;
    }

    public Habitacionz[] getHab() {
        return hab;
    }

    public void setHab(Habitacionz[] hab) {
        this.hab = hab;
        
    }
    
    public void agregarCliente (int x, Persona c){
       this.hab[x].agregarCliente(c);
    }
    
}


