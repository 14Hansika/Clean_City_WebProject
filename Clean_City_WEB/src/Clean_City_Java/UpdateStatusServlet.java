package Clean_City_Java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateStatusServlet
 */
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatusServlet() {
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
		  int wid = Integer.parseInt(request.getParameter("wid"));
	        String action = request.getParameter("action");  // "Approved" or "Disapproved"

	        try {
	            Connection con = Clean_City_Connectivity.ConnectDB.getConnect();

	            PreparedStatement ps = con.prepareStatement(
	                "UPDATE waste_reports SET wstatus = ? WHERE wid = ?");
	            ps.setString(1, action);
	            ps.setInt(2, wid);
	            int rows = ps.executeUpdate();

	            con.close();

	            response.sendRedirect("viewWasteReportMunciple.jsp"); // Redirect back to the reports page
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	    }
	}


