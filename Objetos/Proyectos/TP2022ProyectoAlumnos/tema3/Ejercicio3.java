package tema3;

public class Ejercicio3 {

    public static void main(String[] args) {
        Estante estante;
        estante = new Estante();
        Autor autor = new Autor("A","A","A");
        Libro libro = new Libro("A",autor,"A",1,"A",1);
        Autor autor2 = new Autor("B","B","B");
        Libro libro2 = new Libro("B",autor2,"B",2,"B",2);
        Autor autor3 = new Autor("C","C","C");
        Libro libro3 = new Libro("Mujercitas",autor3,"C",3,"C",3);
        
        estante.agregarLibro(libro);
        estante.agregarLibro(libro2);
        estante.agregarLibro(libro3);
        
        
        Libro mujercitas = estante.buscarLibro("Mujercitas");
        System.out.println(libro3.toString());
        System.out.println(mujercitas.elNombre());
        
        
        
    }
}
