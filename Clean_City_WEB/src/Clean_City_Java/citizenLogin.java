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
import Clean_City_Connectivity.pojo;

/**
 * Servlet implementation class citizenLogin
 */
public class citizenLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public citizenLogin() {
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
			String cemail = request.getParameter("cemail");
			String cpassword = request.getParameter("cpassword");
			
			Connection con = ConnectDB.getConnect();
			
			PreparedStatement ps1 = con.prepareStatement("select * from citizen where cemail=? and cpassword=?");
			ps1.setString(1,cemail);
			ps1.setString(2,cpassword);
			ResultSet rs = ps1.executeQuery();
			
			if(rs.next())
			{
				
				int cid=rs.getInt("cid");
				gettersetter.setCid(cid);
				response.sendRedirect("citizenDashboard.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	
	}

	}


