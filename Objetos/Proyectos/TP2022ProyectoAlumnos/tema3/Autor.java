package tema3;


public class Autor {
    
    private String nombre, biografia, origen;

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String toString(){
        String aux = getNombre() + " nacio en "+ getOrigen() + "y " + getBiografia();
        return aux;
    }

    
}
