package Practica5;

import PaqueteLectura.GeneradorAleatorio;

public class Test {

    public static void main(String[] args) {
        Proyecto P = new Proyecto("Pelipolis",12345,"Pablo Alanis");
        Investigador I;
        Subsidio S;
        
		GeneradorAleatorio.iniciar();
		
        int i,j;
        for (i=0;i<3;i++){
            I = new Investigador(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
            for (j=0;j<2;j++){
                S = new Subsidio(GeneradorAleatorio.generarDouble(1000),GeneradorAleatorio.generarString(5));
                I.agregarSubsidio(S);
            }
            P.agregarInvestigador(I);
        }
        
        System.out.println(P.toString());
        
    }
    
}
