package tema4;

public class E1Ejercicio5 {

    public static void main(String[] args) {
        EVisorFigurasModificado vector = new EVisorFigurasModificado();
        AFigura C1,C2,R;
        
        C1 = new ACuadrado (10,"Negro","Blanco");
        C2 = new ACuadrado (20,"Blanco","Negro");
        R = new ARectangulo (5,20,"Azul","Rojo");
        
        vector.guardar(C1);
        vector.guardar(C2);
        vector.guardar(R);
        
        vector.mostrar();
    }
    
}
