<%@page import="java.util.ArrayList"%>
<%@page import="Daos.*"%>
<%@page import="Clases.*"%>

<%
System.out.println((request.getParameter("linea")) + " prueba1");

int id=Integer.parseInt(request.getParameter("linea")); 

MotivoLineaAccion motivoLinea = new MotivoLineaAccion();

Daos_motivoLineaAccion daoLinea = new Daos_motivoLineaAccion();
ArrayList<MotivoLineaAccion> ListarMotivo = new ArrayList<MotivoLineaAccion>();
ListarMotivo = daoLinea.listaMotivos(id);

%>


<input type="hidden" name="f_opc" id="i_opc">
<select name="motivo" required="">
	<option value="">-Seleccione-</option>
	<%
	for (Object listar1 : ListarMotivo) {// se crea el for para que recorra las ciudades//
		motivoLinea = (MotivoLineaAccion) listar1;
	%>
	<option value="<%out.print(motivoLinea.getIdMotivoLineaAccion());%>">
		<%
		out.print(motivoLinea.getNombreLineaAccion());
		%>
	</option>

	<%
	}
	%>

</select>