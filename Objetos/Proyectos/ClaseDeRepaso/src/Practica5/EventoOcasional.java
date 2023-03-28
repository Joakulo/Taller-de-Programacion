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
public class EventoOcasional extends Recital{
    private int motivo;
    private String contratante;
    private int dia;

    public EventoOcasional(String unaBanda, int DF, int motivo, String contratante, int dia) {
        super(unaBanda, DF);
        this.motivo = motivo;
        this.contratante = contratante;
        this.dia = dia;
    }

    public int getMotivo() {
        return motivo;
    }

    public void setMotivo(int motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }


    public void actuar() {
        if (motivo == 0){
            System.out.println("Recuerden colaborar con "+contratante);
        } else if (motivo == 1){
            System.out.println("Saludos amigos televidentes");
        } else {
            System.out.println("Un feliz cumpleanios para "+contratante);
        }
        super.listadoDeTemas();
        System.out.println(calcularCosto());
    }
    
    public int calcularCosto(){
        if (motivo == 0){
            return 0;
        } else if (motivo == 1){
            return 50000;
        } else {
            return 150000;
        }
    }
    
}
