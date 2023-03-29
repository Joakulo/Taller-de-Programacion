package tema4;


public class ATriangulo extends AFigura{
    
    private double lado1, lado2, lado3;

    public ATriangulo(String unCR, String unCL,double lado1, double lado2, double lado3) {
        super(unCR, unCL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    public ATriangulo() {
    }

    
    public void setLado1(double Lado1) {
        lado1 = Lado1;
    }

    public void setLado2(double Lado2) {
        lado2 = Lado2;
    }

    public void setLado3(double Lado3) {
        lado3 = Lado3;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    @Override
    public double calcularArea(){
        double s=(lado1 + lado2 + lado3)/2;
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
    
    @Override
    public double calcularPerimetro(){
        return  (lado1 + lado2 + lado3);
    }
    
    @Override
    public String toString(){
        String aux= super.toString() + " Lados 1, 2 y 3: "+ getLado1() + " " + getLado2() + " " + getLado3();
        return aux;
    }
        
    
}
