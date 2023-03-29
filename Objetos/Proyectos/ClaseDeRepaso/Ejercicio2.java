
package Practica5;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio2 {

	public static void main(String[] args) {
		Estacionamiento E;
		Autitos A;
		
		GeneradorAleatorio.iniciar();
		
		E = new Estacionamiento("Fercho", "Calle 123", 8.0, 21.0,3,3);
		int i;
		for (i=0;i<6;i++){
			A = new Autitos(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(10));
			E.getPisos()[GeneradorAleatorio.generarInt(3)][GeneradorAleatorio.generarInt(3)] = A;
		}
		
		System.out.println(E.toString());
                System.out.println(E.buscarPatente(Lector.leerString()));
		System.out.println("Cantidad de autos en la plaza 1: "+E.buscarPlaza(1));
	}
	
}
