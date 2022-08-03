package Daos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Clases.*;
import Conexion.Conexion;

public class Daos_EstudiantesInscritos {
	private Estudiantes_Inscritos estudiantes_Inscritos;
	private labelCarac labelcaract;
	private Conexion conexion;
	private ResultSet rs;
	
	public Daos_EstudiantesInscritos() {
		estudiantes_Inscritos = new Estudiantes_Inscritos();
		conexion = new Conexion();
	}
	
	public Boolean validarPeriodo(int periodo) throws SQLException {
		String consulta = "select cantidad_aspirantes from estudiantesinscritos where periodo_idperiodo=" + periodo+ ";";
		rs = conexion.seleccionarDatos(consulta);
		System.out.println(consulta);
		while( rs.next() ) {
			estudiantes_Inscritos = new Estudiantes_Inscritos();
			estudiantes_Inscritos.setCantidad_aspirantes(rs.getInt(1));
			System.out.println(estudiantes_Inscritos.getCantidad_aspirantes());
			if (estudiantes_Inscritos.getCantidad_aspirantes()!=0) {
				return false;
			}
		}
		return true;
	}
	
	public boolean agregarEstudiantes(int cantidad_aspirantes, int cantidad_admitidos, int cantidad_matriculados, 
			int cantidad_opcionales, int opcionalaes_matriculados,int total_admitidos,  int nuevosmatriculados, 
			int periodo_idperiodo) {
		String consulta ="insert into estudiantesinscritos (cantidad_aspirantes, cantidad_admitidos, cantidad_matriculados, "
				+ "cantidad_opcionales, opcionales_matriculados, total_admitidos, nuevosmatriculados, periodo_idperiodo, caracteristica_id_caracteristica)\r\n"
				+ "values ( " +cantidad_aspirantes + ", " +cantidad_admitidos + "," +cantidad_matriculados+"," 
					+cantidad_opcionales + "," +opcionalaes_matriculados + ", " +total_admitidos+"," +nuevosmatriculados +"," + periodo_idperiodo +", 1  );";
		System.out.println(consulta);
        if (conexion.insertarDatos(consulta)) {
            conexion.desconectar();
            return true;

        } else { 
            conexion.desconectar();
            return false;
        }
	}
	
	public ArrayList<Estudiantes_Inscritos> mostrarInformacion() {
    	ArrayList<Estudiantes_Inscritos> mostrarInformacion = new ArrayList<Estudiantes_Inscritos>();
    	String consulta = "select ei.cantidad_aspirantes, ei.cantidad_admitidos, ei.cantidad_matriculados, ei.cantidad_opcionales,\r\n"
    			+ "ei.opcionales_matriculados , ei.total_admitidos, ei.nuevosmatriculados, p.periodo, ei.idestudiantesinscritos from estudiantesinscritos as ei, \r\n"
    			+ "periodo as p where p.idperiodo=ei.periodo_idperiodo;";
    	try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setCantidad_aspirantes(rs.getInt(1));
				estudiantes_Inscritos.setCantidad_admitidos(rs.getInt(2));
				estudiantes_Inscritos.setCantidadMatriculados(rs.getInt(3));
				estudiantes_Inscritos.setCantidad_opcionales(rs.getInt(4));
				estudiantes_Inscritos.setOpcionalaes_matriculados(rs.getInt(5));
				estudiantes_Inscritos.setTotalAdmitidos(rs.getInt(6));
				estudiantes_Inscritos.setNuevosmatriculados(rs.getInt(7));
				estudiantes_Inscritos.setNombrePeriodo(rs.getString(8));
				estudiantes_Inscritos.setIdestudiantesinscritos(rs.getInt(9));
				mostrarInformacion.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return mostrarInformacion;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
    }
	
	public ArrayList<Estudiantes_Inscritos>  cantidadAspirantes() {
		ArrayList<Estudiantes_Inscritos> cAspirantes = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.cantidad_aspirantes from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setCantidad_aspirantes(rs.getInt(1));
				cAspirantes.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cAspirantes;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadAdmitidos() {
		ArrayList<Estudiantes_Inscritos> cAdmitidos = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.cantidad_admitidos from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setCantidad_admitidos(rs.getInt(1));
				cAdmitidos.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cAdmitidos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadMatriculados() {
		ArrayList<Estudiantes_Inscritos> cMatriculados = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.cantidad_matriculados from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setCantidadMatriculados(rs.getInt(1));
				cMatriculados.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cMatriculados;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadOpcionales() {
		ArrayList<Estudiantes_Inscritos> cOpcionales = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.cantidad_opcionales from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setCantidad_opcionales(rs.getInt(1));
				cOpcionales.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cOpcionales;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadOpcionales2() {
		ArrayList<Estudiantes_Inscritos> cOpcionales2 = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.opcionales_matriculados from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setOpcionalaes_matriculados(rs.getInt(1));
				cOpcionales2.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cOpcionales2;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadTotal() {
		ArrayList<Estudiantes_Inscritos> cTotal = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.total_admitidos from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setTotalAdmitidos(rs.getInt(1));
				cTotal.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cTotal;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	public ArrayList<Estudiantes_Inscritos>  cantidadNuevosMat() {
		ArrayList<Estudiantes_Inscritos> cNuevosMat = new ArrayList<Estudiantes_Inscritos>();
		String consulta = "select ei.nuevosmatriculados from estudiantesinscritos as ei, periodo as p where p.idperiodo=ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				estudiantes_Inscritos = new Estudiantes_Inscritos();
				estudiantes_Inscritos.setNuevosmatriculados(rs.getInt(1));
				cNuevosMat.add(estudiantes_Inscritos);
			}
			conexion.desconectar();
			return cNuevosMat;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}
	
	
	public ArrayList<labelCarac> ArregloLabel() {
		ArrayList<labelCarac> label = new ArrayList<labelCarac>();
		String consulta = "select p.periodo from periodo as p, estudiantesinscritos as ei where p.idperiodo= ei.periodo_idperiodo;";
		try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				labelcaract = new labelCarac();
				labelcaract.setAnhio_Caract1(consulta);
				
				label.add(labelcaract);
			}
			conexion.desconectar();
			return label;
		} catch (Exception e) {
			System.out.println(e.getMessage());
            conexion.desconectar();
            return null;
		}
	}	
	
}
