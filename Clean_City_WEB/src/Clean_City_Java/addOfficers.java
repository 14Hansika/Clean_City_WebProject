package Clean_City_Java;

import java.io.IOException;


import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Clean_City_Connectivity.ConnectDB;

/**
 * Servlet implementation class addOfficers
 */
public class addOfficers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOfficers() {
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
		try {
			String mname = request.getParameter("mname");
			String mzone = request.getParameter("mzone");
			String mcontact = request.getParameter("mcontact");
			String memail = request.getParameter("memail");
			String mpassword = request.getParameter("mpassword");

			Connection con = ConnectDB.getConnect();

			PreparedStatement ps1 = con.prepareStatement(
			    "INSERT INTO municipality (mname, mzone, mcontact, memail, mpassword) VALUES (?, ?, ?, ?, ?)"
			);

			ps1.setString(1, mname);
			ps1.setString(2, mzone);
			ps1.setString(3, mcontact);
			ps1.setString(4, memail);
			ps1.setString(5, mpassword);

			int i = ps1.executeUpdate();

			if (i > 0) {
				System.out.println("Registered Successfully..!!");
				response.sendRedirect("adminDashboard.html");
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

