/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

import PaqueteLectura.GeneradorAleatorio;
//import PaqueteLectura.Lector;
        
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Coro semi,hileras;
        Director D;
        Corista C;
        
        D = new Director("Pablo Alanis",12345,50,6);
        semi = new Coro("Semicirculo",14,D);
        hileras = new Coro("Por Hileras",7,2,D);
        
        int i;
        for (i=0;i<14;i++){
            C = new Corista(GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarInt(5000),GeneradorAleatorio.generarInt(50),GeneradorAleatorio.generarInt(5)+1);
            semi.agregarCorista(C);
            hileras.agregarCorista(C);
        }
        
        System.out.println(semi.toString());
        
        System.out.println(hileras.toString());
        
    }
    
}
