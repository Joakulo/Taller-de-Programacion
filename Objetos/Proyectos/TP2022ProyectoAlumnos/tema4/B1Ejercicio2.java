package tema4;

public class B1Ejercicio2 {

    public static void main(String[] args) {
        BEmpleado E;
        BEmpleado J;
        E = new BEntrenador("Pedrito",50000,7,11);
        J = new BJugador("ByVirus",50000,7,32,40);
        
        System.out.println(E.toString());
        System.out.println(J.toString());
    }
    
}
