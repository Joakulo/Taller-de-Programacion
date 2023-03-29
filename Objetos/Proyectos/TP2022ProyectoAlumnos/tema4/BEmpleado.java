package tema4;

import java.util.Objects;

public abstract class BEmpleado {
    
    private String nombre; 
    private double sueldo;
    private int antiguedad;

    public BEmpleado(String nombre, double sueldo, int antiguedad) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public BEmpleado() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", sueldo=" + sueldo + ", antiguedad=" + antiguedad + '}';
    }   
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    
}
