package tema4;
import PaqueteLectura.Lector;

public class C1Ejercicio3 {

    public static void main(String[] args) {
        CPersona P=new CPersona("Bananin",12345,69);
        CPersona T=new CTrabajador("Sex Machine",54321,118,"Maquinista");
        
        System.out.println(P.toString());
        // T.setDNI(Lector.leerInt());
        System.out.println(T.toString());
    }
    
}
