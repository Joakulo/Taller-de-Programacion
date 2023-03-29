package tema4;

import PaqueteLectura.Lector;

public class A1Ejercicio1 {

    public static void main(String[] args) {
        
        AFigura c;
        AFigura t;
        c = new ACirculo("Rojo","Negro",5.0);
        t = new ATriangulo("Negro","Rojo",3.0,4.0,2.0);
        System.out.println(c.toString());
        System.out.println(t.toString());
        t.despintar();
        System.out.println(t.toString());

    }
    
}
