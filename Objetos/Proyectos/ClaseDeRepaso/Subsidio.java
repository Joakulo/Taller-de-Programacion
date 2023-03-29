package Practica5;

public class Subsidio{
    private double monto;
    private String motivo;
    private boolean entregado;

    public Subsidio() {
    }
    
    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.entregado = false;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isEntregado() {
        return entregado;
    }

    public void setEntregado(boolean entregado) {
        this.entregado = entregado;
    }
    
    
    
}
