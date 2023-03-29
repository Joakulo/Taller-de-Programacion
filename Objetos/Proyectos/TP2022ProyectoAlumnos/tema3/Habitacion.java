package tema3;

public class Habitacion {
    private double costo;
    private boolean libre;
    private Persona cliente;

    public Habitacion(double costo, boolean libre, Persona cliente) {
        this.costo = costo;
        this.libre = libre;
        this.cliente = cliente;
    }

    public Habitacion() {
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isLibre() {
        return libre;
    }

    public void setLibre(boolean libre) {
        this.libre = libre;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    public String toString(){
        String estado,aux;
        if (libre){
            estado =" libre ";
        } else {
            estado = " ocupada ";
        }
        aux = "La habitacion esta " + estado + " por " + cliente.getNombre();
        return aux;
    }
    
}
