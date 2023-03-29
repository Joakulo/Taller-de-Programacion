package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Hotel {
    private Habitacion []vector;
    private int dimF;

    public Hotel(int dimF) {
        this.vector = new Habitacion[dimF];
        this.dimF = dimF;
        int i;
        Habitacion H;
        for (i=0;i<dimF;i++){
            H = new Habitacion(GeneradorAleatorio.generarDouble(6000) + 2000, true, null);
            vector[i]=H;
        }
    }
    
    public void ingresarCliente(Persona C,int X){
        vector[X].setCliente(C);
        vector[X].setLibre(false);
    }
    
    public void aumento(double X){
        int i;
        for (i=0;i<dimF;i++){
            vector[i].setCosto(vector[i].getCosto() + X);
        }
    }
    
    public void imprimirHotel(){
        int i;
        for (i=0;i<dimF;i++){
            System.out.println(toString(i));
        }
    }
    
    public String toString(int i){
        if (vector[i].isLibre()){
            return "Habitacion"+i+" Costo: " + vector[i].getCosto() + ", libre.";
        } else {
            return "Habitacion"+i+" Costo: " + vector[i].getCosto() + ", ocupada por " + vector[i].getCliente().toString();
        }
            
    }
    
}
