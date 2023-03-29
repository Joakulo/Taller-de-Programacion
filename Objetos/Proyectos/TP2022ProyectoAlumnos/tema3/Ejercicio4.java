package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {

    public static void main(String[] args) {
        Hotel H=new Hotel(20);
        Persona P;
                
        int i;
        for (i=0;i<20;i++){
            P = new Persona();
            P.setDNI(GeneradorAleatorio.generarInt(10000));
            P.setNombre(GeneradorAleatorio.generarString(10));
            P.setEdad(GeneradorAleatorio.generarInt(50));
            H.ingresarCliente(P, i);
        }

            H.imprimirHotel();
            
            H.aumento(5000);
            H.imprimirHotel();
    }
    
}
