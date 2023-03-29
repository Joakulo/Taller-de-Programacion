/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	
        GeneradorAleatorio.iniciar();
        int dimF=5;
        
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        
        int [][] matriz = new int[dimF][dimF];
        int i,j;
        for (i=0;i<dimF;i++){
            for (j=0;j<dimF;j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(21);
            }
        }
        
        //Paso 4. mostrar el contenido de la matriz en consola
        
        for (i=0;i<dimF;i++){
            for (j=0;j<dimF;j++){
                System.out.print(matriz[i][j]+" ");
            }
            System.out.println();
        }
        
        System.out.println();
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        
        int suma=0;
        for (j=0;j<dimF;j++){
            suma += matriz[1][j];
        }
        System.out.println(suma);
        
        System.out.println();
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int [] vector=new int[dimF];
        for (j=0;j<dimF;j++){
            for (i=0;i<dimF;i++){
                vector[j] += matriz[i][j];
            }
        }
                
        for (j=0;j<dimF;j++){
            System.out.print(vector[j]+" ");
        }

        System.out.println();
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        int valor,posc=-1,posf=-1;
        System.out.println("Ingrese un valor a buscar: ");
        valor = Lector.leerInt();
        
        i=0;
        j=0;
        while ((valor != matriz[i][j]) && (i<dimF)){
            j=0;
            while ((valor != matriz[i][j]) && (i<dimF) && (j<dimF)){
                if (valor == matriz[i][j]){
                    posf=i;
                    posc=j;
                    i=dimF;
                }
                j++;
            }
            i++;
        }
        
        if (posc != -1)
            System.out.print(valor + " se encuentra en la columna " + posc + " fila " + posf);
        else
            System.out.print("El numero "+valor+" no se ebncuentra en la matriz");
        
    }
}
