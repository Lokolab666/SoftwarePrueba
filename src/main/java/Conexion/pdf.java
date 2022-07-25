package Conexion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class pdf
 */
@WebServlet("/PdfGen")
public class pdf extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     
    public pdf() {
        super();
        // TODO Auto-generated constructor stub
    }
*/
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();
		
		try {
			try {
				Document documento = new Document();
				PdfWriter.getInstance(documento, out);
				
				documento.open();
				
				Paragraph paraUno = new Paragraph();
				Font fontTitulo = new Font(Font.FontFamily.HELVETICA,16,Font.BOLD, BaseColor.BLACK);
				paraUno.add(new Phrase("Reporte", fontTitulo));
				paraUno.setAlignment(Element.ALIGN_CENTER);
				paraUno.add(new Phrase(Chunk.NEWLINE));
				paraUno.add(new Phrase(Chunk.NEWLINE));
				
				documento.add(paraUno);
				
				Paragraph paraDos = new Paragraph();
				Font fontDesc = new Font(Font.FontFamily.HELVETICA,12,Font.NORMAL, BaseColor.BLACK);
				paraDos.add(new Phrase("Para encontrar a ", fontDesc));
				paraDos.setAlignment(Element.ALIGN_JUSTIFIED);
				paraDos.add(new Phrase(Chunk.NEWLINE));
				paraDos.add(new Phrase(Chunk.NEWLINE));
				
				documento.add(paraDos);
				
				documento.close();
				
				
			} catch (Exception e) {
				e.getMessage();
			}
		} finally {
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
