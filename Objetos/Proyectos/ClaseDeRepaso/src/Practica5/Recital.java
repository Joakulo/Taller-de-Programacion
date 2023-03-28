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
public abstract class Recital {
    private String banda;
    private String [] temas;
    private int dimF, dimL=0;

    public Recital(String unaBanda, int DF) {
        this.banda = unaBanda;
        dimF = DF;
        temas = new String[DF];
    }

    public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }

    public String[] getTemas() {
        return temas;
    }
    
    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public abstract void actuar();
    public abstract int calcularCosto();
    
    public void agregarTema(String unTema) {
        temas[dimL] = unTema;
        dimL++;
    }
    
    public void listadoDeTemas(){
        int i;
        for (i=0;i<dimF;i++){
            System.out.println(temas[i]);
        }
    }
    
    
    
    
}
