package Clean_City_Java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clean_City_Connectivity.ConnectDB;

/**
 * Servlet implementation class changeMunciplePass
 */
public class changeMunciplePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeMunciplePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 String memail = request.getParameter("memail");
	        String oldPass = request.getParameter("oldPassword");
	        String newPass = request.getParameter("newPassword");
	        String confirmPass = request.getParameter("confirmPassword");

	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();

	        try {
	            Connection con = ConnectDB.getConnect();

	            PreparedStatement check = con.prepareStatement("SELECT * FROM municipality WHERE memail = ? AND mpassword = ?");
	            check.setString(1, memail);
	            check.setString(2, oldPass);
	            ResultSet rs = check.executeQuery();

	            if (rs.next()) {
	               
	                if (newPass.equals(confirmPass)) {
	                	PreparedStatement update = con.prepareStatement("UPDATE municipality SET mpassword = ? WHERE memail = ?");
	                    update.setString(1, newPass);
	                    update.setString(2, memail);
	                    int rows = update.executeUpdate();
	                    if(rows>0)
						{
							response.sendRedirect("loginAsMunicipalityOfficer.html");
						}
						

	                }}}

	            
	         catch (Exception e) {
	            e.printStackTrace();
	            out.println("<h3>Error: " + e.getMessage() + "</h3>");
	        }
	}

}
