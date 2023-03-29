package tema4;


public class ACirculo extends AFigura {
   
    private double radio;

    public ACirculo(String unCR, String unCL,double radio) {
        super(unCR, unCL);
        setRadio(radio);
    }

    public ACirculo() {
    }

    
    public void setRadio(double Radio) {
        radio = Radio;
    }

    public double getRadio() {
        return radio;
    }
    
    public double calcularArea(){
        return(3.14159 * radio * radio);
    }
    
    public double calcularPerimetro(){
        return (2 * 3.14159 * radio);
    }
    
    public String toString(){
        String aux = super.toString() + " Radio: " + radio;
        return aux;
    }
    
}
