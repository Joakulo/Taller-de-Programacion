/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

/**
 *
 * @author Joaco
 */
public class Coro {
    private String Cnombre;
    private Director director;
    private Corista [] vector;
    private int dimF=0;
    private Corista [][] matriz;
    private int filas,columnas;
    private int dimL=0;

    public Coro(String Cnombre, int dimFV, Director director) {
        this.Cnombre = Cnombre;
        this.dimF = dimFV;
        this.vector = new Corista[dimFV];
        this.director = director;
    }

    public Coro(String Cnombre, int filas, int columnas, Director director) {
        this.Cnombre = Cnombre;
        this.filas = filas;
        this.columnas = columnas;
        matriz = new Corista[filas][columnas];
        this.director = director;
    }

    public String getNombre() {
        return Cnombre;
    }

    public void setNombre(String nombre) {
        this.Cnombre = nombre;
    }

    public Corista[] getSemicirculo() {
        return vector;
    }

    public int getDimFV() {
        return dimF;
    }

    public int getDimLV() {
        return dimL;
    }

    public Corista[][] getPorHileras() {
        return matriz;
    }

    public int getFilas() {
        return filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public int getDimLM() {
        return dimL;
    }
    
    public void agregarCorista(Corista C){
         if (dimF != 0){
             vector[dimL] = C;
             dimL++;
         } else {
             matriz[dimL/columnas][dimL%columnas]=C;
             dimL++;
         }
    }
    
    public boolean coroLleno(){
        return dimL == dimF;
    }
    
    public boolean bienOrdenados(){
        if (dimF != 0){
            int i=0,max=vector[i].getTono();
            while (i < dimF && max >= vector[i].getTono()){
                max = vector[i].getTono();
                i++;
            }
            return i == dimF;
             
         } else {
            
            boolean aux;
            int i=0,j=0,tonoActual=matriz[i][j].getTono();
            while (i<filas && tonoActual >= matriz[i][j].getTono()){
                j=0;
                tonoActual=matriz[i][j].getTono();
                while (i<filas && j<columnas && tonoActual >= matriz[i][j].getTono()){
                    tonoActual=matriz[i][j].getTono();
                    j++;
                }
                i++;
            }
            
            aux = i == dimL/columnas;
       
            if (!aux){
                return aux;
            } else {
                j=0;
                tonoActual = matriz[i][j].getTono();
                while (j<columnas &&  tonoActual >= matriz[i][j].getTono()){
                    i=0;
                    tonoActual = matriz[i][j].getTono();
                    while (j<columnas && i<filas &&  tonoActual >= matriz[i][j].getTono()){
                        tonoActual = matriz[i][j].getTono();
                        i++;
                    }
                    j++;
                }
                aux = j == dimL/filas;
            }
            return aux;  
        }
    }
    
    public String toString(){
        String aux = "Coro " + Cnombre + " " + director.toString();
        if (dimF != 0){
            int i;
            for (i=0;i<dimL;i++){
                aux += "\n" + vector[i].toString();
            }
        } else {
            aux += "\n";
            int i,j;
            for (i=0;i<dimL/columnas;i++){
                for (j=0;j<columnas;j++){
                    aux += " " + i + j + matriz[i][j].toString();
                }
                aux += "\n";
            }
            for (i=0;i<dimL%columnas;i++){
                aux += "\n" + matriz[dimL/columnas][i].toString();
            }
        }
        aux += "\n" + bienOrdenados();
        return aux;
    }
    
    
}
