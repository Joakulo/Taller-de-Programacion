package tema4;

public class BJugador extends BEmpleado {
    
    private int partidos, goles;

    public BJugador( String nombre, double sueldo, int antiguedad,int partidos, int goles) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public BJugador() {
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public String toString() {
        return super.toString() + " Jugador{" + "partidos=" + partidos + ", goles=" + goles + ", efectividad= " + calcularEfectividad() + ", sueldo a cobrar=" + calcularSueldoACobrar() +'}';
    }
    
    public double calcularEfectividad(){
        double aux;
        aux = (double) getGoles() / getPartidos();
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double aux= getSueldo() + getSueldo() / 10;
        if (calcularEfectividad() >= 0.5){
            aux += getSueldo();
        }
        return aux;
    }
    
}
