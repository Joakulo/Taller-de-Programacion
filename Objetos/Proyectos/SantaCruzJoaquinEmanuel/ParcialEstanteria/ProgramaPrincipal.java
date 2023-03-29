/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEstanteria;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
        
public class ProgramaPrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estanteria E, EO, EE;
        Libro L;
        
        GeneradorAleatorio.iniciar();
        
        E = new Estanteria(5, 3);
        EO = new Estanteria(5, 3);
        EE = new Estanteria(5, 3);
        int i;
        for (i=0;i<6;i++){
            L = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(256));
            E.almacenarLibro(L, GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(3));
            EO.almacenarLibroOrdenado(L);
            EE.almacenarLibroPorEstante(L, GeneradorAleatorio.generarInt(5));
        }
        
        L = new Libro("Messi", "Messi", 1000);
        E.almacenarLibro(L, GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(3));
        EO.almacenarLibroOrdenado(L);
        EE.almacenarLibroPorEstante(L, GeneradorAleatorio.generarInt(5));
        
        /*System.out.println(E.toString());
        System.out.println(E.calcular().toString());
        System.out.println(E.sacarLibro(Lector.leerString()).toString());
        System.out.println(E.toString());
        
        
        System.out.println(EO.toString());
        System.out.println(EO.sacarLibroOrdenado(Lector.leerInt(), Lector.leerInt()));
        System.out.println(EO.toString());
        System.out.println(EO.calcularOrdenado("Messi"));*/
        
        
        System.out.println(EE.toString());
        System.out.println(EE.sacarLibroOrdenado(Lector.leerInt(), Lector.leerInt()));
        System.out.println(EE.toString());
        System.out.println(EE.calcularPorEstante());
        
    }
    
}
