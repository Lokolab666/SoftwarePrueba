package Daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Clases.*;
import Conexion.Conexion;

public class Daos_actividadpoliticasocial {
	private Actividad_Politica_Social actividad_Politica_Social;
	private Conexion conexion;
	private ResultSet rs;
	
	public Daos_actividadpoliticasocial() {
		actividad_Politica_Social = new Actividad_Politica_Social();
		conexion = new Conexion();
	}
	
	public boolean validarlinea(int motivoLineaAccion) throws SQLException  {
		String consulta ="select motivoLineaAccion, usuarios from actividadpoliticasocial;";
		rs = conexion.seleccionarDatos(consulta);
		while (rs.next()) {
			actividad_Politica_Social = new Actividad_Politica_Social();
			actividad_Politica_Social.setMotivoLineaAccion(rs.getInt(1));
			actividad_Politica_Social.setUsuarios(rs.getInt(2));
			
			if (actividad_Politica_Social.getLineaAccion()!=0 && actividad_Politica_Social.getUsuarios()!=0) {
				return false;
			}
		}
		return true;
		
	}
	
	public boolean agregarActividadPolitica(int lineaAccion, int motivoLineaAccion, int usuarios, int servicios, int periodo_idperiodo) {
		String consulta= " insert into actividadpoliticasocial values ("+null+","+lineaAccion+","+motivoLineaAccion +"," + usuarios+","+servicios+","+periodo_idperiodo+",4);";
		System.out.println(consulta);
		if (conexion.insertarDatos(consulta)) {
			conexion.desconectar();
			return true;
		}else {
			conexion.desconectar();
			return false;
		}
	}
	
	public ArrayList<Actividad_Politica_Social> listaInformaion(){
		ArrayList<Actividad_Politica_Social> informacion = new ArrayList<Actividad_Politica_Social>();
		String consulta ="select ap.idactividadpoliticasocial, la.nombreLineaAccion, mla.nombreMotivoLineaAccion, ap.usuarios, ap.servicios, p.periodo\r\n"
				+ "from lineaAccion as la, motivoLineaAccion as mla, actividadpoliticasocial as ap, periodo as p\r\n"
				+ "where la.idLineaAccion=ap.lineaAccion and mla.idMotivoLineaAccion=ap.motivoLineaAccion and p.idperiodo=ap.periodo_idperiodo;";
		
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				actividad_Politica_Social = new Actividad_Politica_Social();
				actividad_Politica_Social.setIdactividadpoliticasocial(rs.getInt(1));
				actividad_Politica_Social.setNombrelineaAccion(rs.getString(2));
				actividad_Politica_Social.setNombremotivoLineaAccion(rs.getString(3));
				actividad_Politica_Social.setUsuarios(rs.getInt(4));
				actividad_Politica_Social.setServicios(rs.getInt(5));
				actividad_Politica_Social.setNombrePeriodo(rs.getString(6));
				
				informacion.add(actividad_Politica_Social);
				
			}
			conexion.desconectar();
			return informacion;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
	}
}
