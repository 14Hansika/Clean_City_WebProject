package Clean_City_Java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clean_City_Connectivity.ConnectDB;
import Clean_City_Connectivity.gettersetter;

/**
 * Servlet implementation class citizenRegister
 */
public class citizenRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public citizenRegister() {
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
		try {
			int cid=0;
			String cname = request.getParameter("cname");
			String caddress = request.getParameter("caddress");
			String ccontact = request.getParameter("ccontact");
			String cemail = request.getParameter("cemail");
			String cpassword = request.getParameter("cpassword");
		
			
			Connection con = ConnectDB.getConnect();
			
			PreparedStatement ps1 = con.prepareStatement("insert into citizen values (?,?,?,?,?,?)"
			);
			ps1.setInt(1,cid);
			ps1.setString(2,cname);
			ps1.setString(3,caddress);
			ps1.setString(4,ccontact);
			ps1.setString(5,cemail);
			ps1.setString(6,cpassword);
			

			int i = ps1.executeUpdate();

			if (i > 0) {
			
				System.out.println("Registered Successfully..!!");
				response.sendRedirect("citizenLogin.html");
			} else {
				response.sendRedirect("error.html");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

}


