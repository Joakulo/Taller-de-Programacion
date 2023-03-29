/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author Joaco
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo unTriangulo;
        System.out.println("Mandale el lado 1");
        double lado1 = Lector.leerDouble();
        System.out.println("Ahora el lado 2");
        double lado2 = Lector.leerDouble();
        System.out.println("Y ahora el 3");
        double lado3 = Lector.leerDouble();
        System.out.println("¿qué color de fondo te gustaría?");
        String colorR = Lector.leerString();
        System.out.println("Ya casi estamos. ¿Color de borde?");
        String colorB = Lector.leerString();
        
        unTriangulo = new Triangulo(lado1, lado2, lado3, colorR, colorB);
        System.out.println("El perimetro de unTriangulo es " + unTriangulo.calcularPerimetro() + " y su área es "+unTriangulo.calcularArea());
    }
    
}
