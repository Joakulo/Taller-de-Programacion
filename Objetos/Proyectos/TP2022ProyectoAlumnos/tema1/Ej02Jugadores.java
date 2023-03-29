
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        
        double [] vector;
        
        //Paso 3: Crear el vector para 15 double 
        
        int DimF = 15;
        vector = new double[DimF]; 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        
        int i,cant=0;
        double a,prom=0;
        
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        
        for (i=0;i<DimF;i++){
            a = Lector.leerDouble();
            vector[i]=a;
        }
            
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        for (i=0;i<DimF;i++){
            prom += vector[i];
        }        
        prom = prom / 15;
        System.out.println("Promedio: " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        
        for (i=0;i<DimF;i++){
            if (vector[i] > prom){
                cant++;
            }
        }
        
        //Paso 9: Informar la cantidad.
        
        System.out.println("Cantidad por encima del promedio: "+cant);
    }
    
}
