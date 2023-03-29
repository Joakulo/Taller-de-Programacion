package tema4;

public class EVisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private AFigura [] vector;
 
    public EVisorFigurasModificado(){
        vector = new AFigura [capacidadMaxima];
    }
 
    public void guardar(AFigura f){
        if (guardadas < capacidadMaxima){
            vector[guardadas] = f;
            guardadas++;
        }
    }
    
    public boolean quedaEspacio(){
        return guardadas < capacidadMaxima;
    }
 
    public void mostrar(){
        int i;
        for (i=0;i<capacidadMaxima;i++){
            System.out.println(vector[i]);
        }
    }
 
    public int getGuardadas() {
        return guardadas;
    }
}
