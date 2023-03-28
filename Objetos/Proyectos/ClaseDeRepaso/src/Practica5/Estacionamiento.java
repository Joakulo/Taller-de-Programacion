/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

/**
 *
 * @author alumnos
 */
public class Estacionamiento {
	
	private String Nombre;
	private String Direccion;
	private double Apertura;
	private double Cierre;
	private Autitos [][]pisos;
	private int cantPisos, cantPlazas;

	public Estacionamiento(String unNombre, String unDireccion) {
		this.Nombre = unNombre;
		this.Direccion = unDireccion;
		Apertura=8.0;
		Cierre=21.0;
		cantPisos=5;
		cantPlazas=10;
		pisos = new Autitos[cantPisos][cantPlazas];
		
	}

	public Estacionamiento(String unNombre, String unDireccion, double unApertura, double unCierre, int x,int y) {
		this.Nombre = unNombre;
		this.Direccion = unDireccion;
		this.Apertura = unApertura;
		this.Cierre = unCierre;
		cantPisos=x;
		cantPlazas=y;
		pisos = new Autitos[x][y];
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String Direccion) {
		this.Direccion = Direccion;
	}

	public double getApertura() {
		return Apertura;
	}

	public void setApertura(double Apertura) {
		this.Apertura = Apertura;
	}

	public double getCierre() {
		return Cierre;
	}

	public void setCierre(double Cierre) {
		this.Cierre = Cierre;
	}

	public Autitos[][] getPisos() {
		return pisos;
	}
	
	
	
        public void setautito(Autitos Auto,int x,int y){
            pisos[x][y]= Auto;
        }
        
        public String buscarPatente(String Patente){
            int i=0,j, posi=-1,posj=0;
            while(i<cantPisos){
                j=0;
		while(i<cantPisos && j<cantPlazas && (pisos[i][j]==null || !pisos[i][j].getPatente().equals(Patente))) {
                    j++;  
                }
                if (j<cantPlazas && pisos[i][j]!=null && pisos[i][j].getPatente().equals(Patente)){
                    System.out.println("Encontrado");
                    posi=i+1;
                    posj=j+1;
                    i=cantPisos;
                }
                i++;  
	   }
	   if(posi==-1){
                return "Auto inexistente";
	   } else {
                return "Piso: " + posi + " Plaza: " + posj;
	   }
   }
        
   public String toString(){
	   int i,j;
	   String aux="Estacionamiento "+Nombre+".";
	   for(i=0;i<cantPisos;i++){
		   for(j=0;j<cantPlazas;j++)
			   if(pisos[i][j]==null)
			     aux+="\n"+" Piso: "+(i+1)+" Plaza: "+(j+1)+" Libre";
				else
				   aux+="\n"+" Piso: "+(i+1)+" Plaza: "+(j+1)+" "+pisos[i][j].toString();
                   aux+="\n";
	   }
	   return aux;
   }
   
   public int buscarPlaza(int y){
	   int cant=0;
	   int i;
	   for(i=0;i<cantPisos;i++){
		   if (pisos[i][(y-1)]!=null){
			   cant++;
		   }
	   }
	   return cant;
   }
   
   
}
   

