package Practica5;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador []vector;
    private int dimF=50, dimL=0;

    public Proyecto() {
    }
    
    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
        this.vector = new Investigador[dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }    
    
    public void agregarInvestigador(Investigador unInvestigador){
        if (dimL < dimF){
            vector[dimL]=unInvestigador;
            dimL++;
        }
    }
    
    public double TotalDineroOtorgado(){
        int i,aux=0;
        for (i=0;i<dimL;i++){
            aux += vector[i].dineroOtorgado();
        }
        return aux;
    }
    
    public void otorgarTodos(String unNombre){
        int i=0,j;
        while (i<dimL && !vector[i].getNombre().equals(unNombre)){
            i++;
        }
        if (i!=dimF){
            for (j=0;j<vector[i].getDimL();j++){
                vector[i].getCantS()[j].setEntregado(true);
            }
        }
    }
    
    public String toString(){
        int i;
        String aux = "Proyecto " + nombre + ", Codigo: " + codigo + ". Dinero otorgado: " + TotalDineroOtorgado();
        for (i=0;i<dimL;i++){
            aux += "\n"
                    + "Investigador N°"+ (i+1) +": " + vector[i].toString();
        }
        return aux;
    }
    
}
