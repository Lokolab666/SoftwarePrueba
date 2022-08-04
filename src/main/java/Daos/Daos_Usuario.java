package Daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Clases.Persona;
import Clases.Rol;
import Clases.Usuario;
import Conexion.Conexion;

public class Daos_Usuario {

	private Usuario usuario;
	private Rol rol;
    private Conexion conexion;
    private ResultSet rs;

    public Daos_Usuario() {
        usuario = new Usuario();
        conexion = new Conexion();
    }
    
    public int rolUsuario(String Usuario, String contrasenhia) throws SQLException{
        String consulta = "select nombre_Usuario, rol_id_rol from usuario where nombre_Usuario= '" +Usuario +"' and contrasenhia_Usuario = '"+contrasenhia+"';";     
        rs = conexion.seleccionarDatos(consulta);
        while (rs.next()){
            usuario = new Usuario();
            usuario.setNombre_Usuario(rs.getString(1));
            usuario.setIdRol_Usuario(rs.getInt(2));
            return usuario.getIdRol_Usuario();
        }
        return -1; 
    }
    
    public String nombre_Usuario(String Usuario) throws SQLException{
        String consulta = "SELECT p.nombre_Persona, p.apellido_Persona"
                + " FROM usuario as u, persona AS p "
                + "WHERE p.id_Persona=u.persona_id_Persona"
                + " AND p.id_Persona = (SELECT u.persona_id_Persona FROM usuario AS u WHERE u.nombre_Usuario= '"+Usuario+"');";
        rs = conexion.seleccionarDatos(consulta);
        
        while ( rs.next() ){
            usuario = new Usuario();
            
            usuario.setNombre_Persona(rs.getString(1));
            usuario.setApellido_Persona(rs.getString(2));
            
            return usuario.getNombre_Persona() + " " + usuario.getApellido_Persona();
            
        }
        return "No existe el usuario";
    }
    
    public boolean agregarUsuario(String usuario, String password, int rol, int persona) {
        String consulta = "insert into usuario values ("+null+",'" + usuario + "'," + password + "," + rol+ "," + persona+ ");";
        System.out.println(consulta);
        if (conexion.insertarDatos(consulta)) { 
        	conexion.desconectar();
            return true;
        } else {
        	conexion.desconectar();
            return false;
        }
    }
    
	public ArrayList<Rol> mostrarRol() {
    	ArrayList<Rol> mostrarRol = new ArrayList<Rol>();
    	String consulta = "select * from rol ";
    	
    	try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				rol = new Rol();
				rol.setId_Rol(rs.getInt(1));
				rol.setNombre_Rol(rs.getString(2));
				mostrarRol.add(rol);
			}
			conexion.desconectar();
			return mostrarRol;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
    }
	
    public boolean validarUsuario(String nombreUsuario) throws SQLException {
    	String consulta = "select nombre_usuario from usuario where nombre_usuario ='"+ nombreUsuario + "';";
    	rs = conexion.seleccionarDatos(consulta);
    	
    	while (rs.next()) {
			usuario = new Usuario();
			usuario.setNombre_Usuario(rs.getString(1));
			if (usuario.getNombre_Usuario().equals(nombreUsuario)) {
				return true;
			}
			
		}
    	return false;
    }
    
    public ArrayList<Usuario> mostrarUsuarios() {
    	ArrayList<Usuario> mostrarPersona = new ArrayList<Usuario>();
    	String consulta = "select u.id_usuario , u.nombre_usuario, p.nombre_persona, p.apellido_persona, r.nombre_rol from usuario as u, rol as r, persona as p where r.id_rol=u.rol_id_rol and p.id_persona=u.persona_id_persona;";
    	System.out.println(consulta);
    	try {
			rs = conexion.seleccionarDatos(consulta);
			while (rs.next()) {
				usuario = new Usuario();
				usuario.setId_Usuario(rs.getInt(1));
				usuario.setNombre_Usuario(rs.getString(2));
				usuario.setNombre_Persona(rs.getString(3));
				usuario.setApellido_Persona(rs.getString(4));
				usuario.setRol(rs.getString(5));
				
				mostrarPersona.add(usuario);
			}
			conexion.desconectar();
			return mostrarPersona;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conexion.desconectar();
			return null;
		}
    }
    
}