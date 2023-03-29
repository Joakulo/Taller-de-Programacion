package tema4;

public class DVisorFiguras {
    private int mostradas;
 
    public DVisorFiguras(){
        mostradas=0;
    }
    
    public void mostrar(AFigura f){
        System.out.println(f.toString()); 
        mostradas++;
    }
    
    public int getMostradas() {
        return mostradas;
    }
}
