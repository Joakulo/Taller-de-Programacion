package tema3;


public class Estante {

    private Libro [] vector;
    private int dimL;
    private int dimF;

    public Estante() {
        this.dimF = 20;
        this.vector = new Libro[dimF];
        this.dimL = 0;
    }

    public Estante(int dimF){
        this.dimF = dimF;
        this.vector = new Libro[dimF];
        this.dimL = 0;
    }
    
    public int cantLibros(){
        return dimL;
    }
    
    public  boolean lleno(){
        return dimL == dimF;
    }
    
    public Libro buscarLibro(String titulo){
        int i=0;
        while (i < dimL && !titulo.equals(vector[i].getTitulo())){
           i++; 
        }
        if (i!=dimF) {
            return vector[i];
        } else {
            return null;
        }
    }
    
    public void agregarLibro(Libro libro){
        if (dimL < dimF) {
            this.vector[dimL] = libro;
            dimL++;            
        }
    }

    @Override
    public String toString() {
        return "Estante{" + "vector=" + vector + ", dimL=" + dimL + '}';
    }
    
    
}
