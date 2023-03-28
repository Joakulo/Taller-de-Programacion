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
public class Autitos {

	private String Patente;
	private String Dueño;

	public Autitos(String Patente, String Dueño) {
		this.Patente = Patente;
		this.Dueño = Dueño;
	}

	public String getPatente() {
		return Patente;
	}

	public void setPatente(String Patente) {
		this.Patente = Patente;
	}

	public String getDueño() {
		return Dueño;
	}

	public void setDueño(String Dueño) {
		this.Dueño = Dueño;
	}

	@Override
	public String toString() {
		return "Autitos{" + "Patente=" + Patente + ", Duenio=" + Dueño + '}';
	}
	
	
}
