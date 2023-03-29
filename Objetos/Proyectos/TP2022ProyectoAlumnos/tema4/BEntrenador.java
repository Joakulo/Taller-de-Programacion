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
public class BEntrenador extends BEmpleado{
    
    private int cant;

    public BEntrenador( String nombre, double sueldo, int antiguedad, int cant) {
        super(nombre, sueldo, antiguedad);
        this.cant = cant;
    }

    public BEntrenador() {
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public String toString() {
        return super.toString() + " Entrenador{" + "cant=" + cant + ", efectividad= " + calcularEfectividad() + ", sueldo a cobrar=" + calcularSueldoACobrar() + '}';
    }
    
    public double calcularEfectividad(){
        double aux;
        aux = (double) getCant() / getAntiguedad();
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double aux = getSueldo() + getSueldo() / 10;
        if (1<= getCant() && getCant()<= 4){
            aux += getCant() * 5000;
        } else if (5<= getCant() && getCant()<= 10){
            aux += getCant() * 30000;
        } else {
            aux += getCant() * 50000;
        }
        return aux;
    }
    
    
    
}
