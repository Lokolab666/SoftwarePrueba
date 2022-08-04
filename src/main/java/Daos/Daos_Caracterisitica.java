package Daos;

import java.sql.ResultSet;
import java.util.ArrayList;

import Clases.*;
import Conexion.Conexion;

public class Daos_Caracterisitica {

	private Caracteristica caracterisitca;
	private Conexion conexion;
	private ResultSet rs;
	
	public Daos_Caracterisitica() {
		caracterisitca = new Caracteristica();
		conexion = new Conexion();
	}
	
	public ArrayList<Caracteristica> mostrarNombreCaracteristica(){
		ArrayList<Caracteristica> mostrarCaracteristica = new ArrayList<Caracteristica>();
		String consulta = "select id_caracteristica, nombre_caracteristica from caracteristica;";
		
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				caracterisitca = new Caracteristica();
				caracterisitca.setId_caracteristica(rs.getInt(1));
				caracterisitca.setNombre_Caracteristica(rs.getString(2));
				
				mostrarCaracteristica.add(caracterisitca);
			}
			conexion.desconectar();
			return mostrarCaracteristica;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
		
	}
	
	
	public ArrayList<Caracteristica> informacionMostrar(){
		ArrayList<Caracteristica> mostrarCaracteristica = new ArrayList<Caracteristica>();
		String consulta = "select nombre_caracteristica, ponderacion_caracteristica, nivel_caracteristica, "
				+ "calificacion_caracteristica, gradoCumplimiento_caracteristica, id_caracteristica from caracteristica;";
		
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				caracterisitca = new Caracteristica();
				
				caracterisitca.setNombre_Caracteristica(rs.getString(1));
				caracterisitca.setPonderacion_Caracteristica(rs.getInt(2));
				caracterisitca.setNivel_Caracteristica(rs.getString(3));
				caracterisitca.setCalificacion_Caracteristica(rs.getDouble(4));
				caracterisitca.setGrado_Cumplimiento_Caracteristica(rs.getString(5));
				caracterisitca.setId_caracteristica(rs.getInt(6));
				mostrarCaracteristica.add(caracterisitca);
			}
			conexion.desconectar();
			return mostrarCaracteristica;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
	}
	
	public ArrayList<Caracteristica> informacionMostrarCaracteristica(int idCaracteristica){
		ArrayList<Caracteristica> mostrarCaracteristica = new ArrayList<Caracteristica>();
		String consulta = "select nombre_caracteristica, ponderacion_caracteristica, nivel_caracteristica, "
				+ "calificacion_caracteristica, gradoCumplimiento_caracteristica, id_caracteristica from caracteristica where id_caracteristica = "+idCaracteristica+";";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				caracterisitca = new Caracteristica();
				caracterisitca.setNombre_Caracteristica(rs.getString(1));
				caracterisitca.setPonderacion_Caracteristica(rs.getInt(2));
				caracterisitca.setNivel_Caracteristica(rs.getString(3));
				caracterisitca.setCalificacion_Caracteristica(rs.getDouble(4));
				caracterisitca.setGrado_Cumplimiento_Caracteristica(rs.getString(5));
				caracterisitca.setId_caracteristica(rs.getInt(6));
				mostrarCaracteristica.add(caracterisitca);
			}
			conexion.desconectar();
			return mostrarCaracteristica;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
	}
	
	public boolean AgregarPonderacion(int idCaracteristica, int ponderacion, String nivel, double calificacion, String gradoCumplimiento) {
		String consulta ="update caracteristica set ponderacion_caracteristica="+ ponderacion +",nivel_caracteristica='" +nivel +"', calificacion_caracteristica="+calificacion+", gradoCumplimiento_caracteristica ='"+gradoCumplimiento+"' where id_caracteristica="+idCaracteristica+";";
		System.out.println(consulta);
		if (conexion.modificarDatos(consulta)) {
			conexion.desconectar();
			return true;
		}else {
			conexion.desconectar();
			return false;
		}
	}
	
}
