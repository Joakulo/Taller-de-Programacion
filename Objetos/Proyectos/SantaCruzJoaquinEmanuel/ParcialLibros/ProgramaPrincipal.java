/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialLibros;

import PaqueteLectura.GeneradorAleatorio;

public class ProgramaPrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Electronico E;
        Fisico F;
        
        E = new Electronico("Mesi", 10, ".d10s", 10);
        F = new Fisico("Penaldo", 7, true);
        
        int i;
        for (i=0;i<3;i++){
            E.agregarAutor(GeneradorAleatorio.generarString(10));
            F.agregarAutor(GeneradorAleatorio.generarString(10));
        }
        
        System.out.println(E.toString());
        System.out.println("");
        System.out.println(F.toString());
    }
    
}
