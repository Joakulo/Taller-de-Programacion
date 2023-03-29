/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Joaco
 */
public class Triangulo {
    private double lado1, lado2, lado3;
    private String colorR, colorB;

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorR() {
        return colorR;
    }

    public String getColorB() {
        return colorB;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setColorR(String colorR) {
        this.colorR = colorR;
    }

    public void setColorB(String colorB) {
        this.colorB = colorB;
    }

    public Triangulo(double lado1, double lado2, double lado3, String colorR, String colorB) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorR = colorR;
        this.colorB = colorB;
    }
    
    double calcularPerimetro(){
        double aux=lado1 + lado2 + lado3;;
        return aux;
    }
    
    double calcularArea(){
        double s=(lado1 + lado2 + lado3)/2;
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
    
}