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
 * Servlet implementation class submitReport
 */
public class submitReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitReport() {
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
			
			int cid=gettersetter.getCid();
			String wlocation = request.getParameter("wlocation");
			String wdesc = request.getParameter("wdesc");
			String wdate = request.getParameter("wdate");
//			String wstatus = request.getParameter("wstatus");
			String wname= request.getParameter("wname");
			
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps = con.prepareStatement("insert into waste_reports VALUES (?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1,0); // from session
			ps.setInt(2,cid); // from session
			ps.setString(3, wlocation);
			ps.setString(4, wdesc);
			ps.setString(5, wdate);
			ps.setString(6, "pending");
			ps.setString(7, wname);

			
			int i = ps.executeUpdate();
			String reportDate = request.getParameter("reportDate");

			// Check if date is valid
			if (wdate == null || wdate.trim().isEmpty()) {
			    wdate= "2024-01-01"; // fallback or return error
			}


			if (i > 0) {
				System.out.println("Submitted Successfully..!!");
				response.sendRedirect("citizenDashboard.html");
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
