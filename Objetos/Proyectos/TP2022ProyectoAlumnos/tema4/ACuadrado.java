package tema4;


public class ACuadrado extends AFigura{
    
    private double lado;
    
    public ACuadrado(double unLado, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado(unLado);

    } 
    
    public double getLado(){
        return lado;       
    }
  
    public void setLado(double unLado){
        lado=unLado;
    }

    @Override
    public double calcularArea(){
       return (getLado()* getLado());
    }
    
    @Override
    public double calcularPerimetro(){
       return (getLado()*4);
    }
    
    @Override
    public String toString(){
       String aux = super.toString() + 
                    " Lado: " + getLado();
       return aux;
    }

 
}
