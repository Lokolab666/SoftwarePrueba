package Daos;

import java.sql.ResultSet;
import java.util.ArrayList;
import Clases.*;
import Conexion.Conexion;

public class Daos_AspectoEvaluado {
	
	private Aspecto_Evaluado aspecto_Evaluado;
	private Conexion conexion;
	private ResultSet rs;
	
	public Daos_AspectoEvaluado() {
		aspecto_Evaluado = new Aspecto_Evaluado();
		conexion = new Conexion();
	}
	
	public ArrayList<Aspecto_Evaluado> listaAspectoEvaluado(int caracteristica){
		ArrayList<Aspecto_Evaluado> listaAspectoEvaluado = new ArrayList<Aspecto_Evaluado>();
		String consulta = "select idaspectoEvaluado, nombre_aspectoEvaluado, concepto_aspectoEvaluado, calificacion_aspectoEvaluado, evidencia_aspectoEvaluado from aspectoEvaluado where caracteristica_id_caracteristica = " +caracteristica + ";";
		
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				aspecto_Evaluado = new Aspecto_Evaluado();
				aspecto_Evaluado.setId_Aspecto_Evaluado(rs.getInt(1));
				aspecto_Evaluado.setNombre_aspectoEvaluado(rs.getString(2));
				aspecto_Evaluado.setConcepto_aspectoEvaluado(rs.getString(3));
				aspecto_Evaluado.setCalificacion_aspectoEvaluado(rs.getDouble(4));
				aspecto_Evaluado.setEvidencia_aspectoEvaluado(rs.getString(5));
				
				listaAspectoEvaluado.add(aspecto_Evaluado);
			}
			conexion.desconectar();
			return listaAspectoEvaluado;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
	}
}
