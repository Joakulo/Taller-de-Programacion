package tema4;

public class D1Ejercicio4 {


    public static void main(String[] args) {
        DVisorFiguras visor = new DVisorFiguras();
 
        ACuadrado c1 = new ACuadrado(10,"Violeta","Rosa");
        ARectangulo r= new ARectangulo(20,10,"Azul","Celeste");
        ACuadrado c2= new ACuadrado(30,"Rojo","Naranja");
 
        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);
 
        System.out.println(visor.getMostradas());
    } 
}

