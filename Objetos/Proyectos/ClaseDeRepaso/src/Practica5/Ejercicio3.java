package Practica5;

import PaqueteLectura.GeneradorAleatorio;
        
public class Ejercicio3 {

    public static void main(String[] args) {
        EventoOcasional E;
        Gira G;
        Fecha F;
        GeneradorAleatorio.iniciar();
        
        E = new EventoOcasional("Banda 1", 10, GeneradorAleatorio.generarInt(3),"Leon Alanis", 15);
        G = new Gira("Banda 2", 10, "Gira 1", 10);
        
        int i;
        for (i=0;i<10;i++){
            E.agregarTema(GeneradorAleatorio.generarString(10));
            G.agregarTema(GeneradorAleatorio.generarString(10));
            F = new Fecha();
            G.agregarFecha(F);
        }
        
        E.actuar();
        G.actuar();
    }
}
