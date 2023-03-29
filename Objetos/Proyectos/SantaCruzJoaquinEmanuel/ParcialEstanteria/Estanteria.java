/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialEstanteria;

/**
 *
 * @author Joaco
 */
public class Estanteria {
    private Libro [][] matriz;
    private int cantEstantes, cantLibros;
    private int dimL=0;
    private int [] VdimL;

    public Estanteria(int N, int M) {
        this.cantEstantes = N;
        this.cantLibros = M;
        this.matriz = new Libro[N][M];
        int i;
        VdimL = new int[N];
        for (i=0;i<N;i++)
            VdimL[i]=0;
    }

    public int getCantEstantes() {
        return cantEstantes;
    }

    public void setCantEstantes(int cantEstantes) {
        this.cantEstantes = cantEstantes;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void almacenarLibro(Libro libro, int Y, int X){
        matriz[Y][X] = libro;
    }
    
    public Libro sacarLibro(String titulo){
        int i=0,j;
        Libro L=null;
        while (i<cantEstantes){
            j=0;
            while (i<cantEstantes && j<cantLibros && (matriz[i][j]==null || !matriz[i][j].getTitulo().equals(titulo))){
                j++;
            }
            if (j<cantLibros && matriz[i][j]!=null && matriz[i][j].getTitulo().equals(titulo)){
                L = matriz[i][j];
                matriz[i][j] = null;
                return L;
            }
            i++;
        }
        System.out.println("Libro no encontrado");
        return L;
    }
    
    public Libro calcular(){
        int i,j;
        double max=0;
        Libro L=null;
        for (i=0;i<cantEstantes;i++){
            for (j=0;j<cantLibros;j++){
                if (matriz[i][j]!=null && matriz[i][j].getPeso()>max){
                    max=matriz[i][j].getPeso();
                    L = matriz[i][j];
                }
            }
        }
        return L;
    }
    
    
    
    public void almacenarLibroOrdenado(Libro L){
        matriz[dimL/cantLibros][dimL%cantLibros]=L;
        dimL++;
    }
    
    public Libro sacarLibroOrdenado(int Y, int X){
        Libro L = matriz[Y-1][X-1];
        matriz[Y-1][X-1]=null;
        return L;
    }
    
    public int calcularOrdenado(String autor){
        int i,j, cant=0;
        for (i=0;i<dimL/cantLibros;i++){
            for (j=0;j<cantLibros;j++){
                if (matriz[i][j] != null && matriz[i][j].getPrimerAutor().equals(autor)){
                    cant++;
                }
            }
        }
        for (j=0;j<dimL%cantLibros;j++){
            if (matriz[i][j] != null && matriz[i][j].getPrimerAutor().equals(autor)){
                    cant++;
            }
        }
        return cant;
    }
    
    
    
    public void almacenarLibroPorEstante(Libro L, int Y){
        matriz[Y][VdimL[Y]] = L;
        VdimL[Y]++;
    }
    
    public int calcularPorEstante(){
        int est=-1,aux,max=0,i,j;
        for (i=0;i<cantEstantes;i++){
            aux =0;
            for (j=0;j<VdimL[i];j++){
                if (matriz[i][j] != null)
                    aux += matriz[i][j].getPeso();
            }
            if (aux > max){
                max = aux;
                est = i;
            }
        }
        return est;
    }
    
    
    public String toString(){
        String aux="";
        int i,j;
        for (i=0;i<cantEstantes;i++){
            for (j=0;j<cantLibros;j++){
                if (matriz[i][j]==null)
                    aux += "null ";
                else
                    aux += matriz[i][j].getTitulo() + " ";
            }
            aux += "\n";
        }
        return aux;
    }
}
