package Practica5;

public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] cantS;
    private int dimF=5,dimL=0;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.cantS = new Subsidio[dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getCantS() {
        return cantS;
    }
    
    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (dimL < dimF){
            cantS[dimL]=unSubsidio;
            dimL++;
        }
    }
    
    public double dineroOtorgado(){
        int i,aux=0;
        for (i=0;i<dimL;i++){
            if (cantS[i].isEntregado()){
                aux += cantS[i].getMonto();            
            }
        }
        return aux;
    }
    
    public String toString(){
        return nombre + ". Categoria " + categoria + ". Dinero otorgado: " + dineroOtorgado();
    }
}
