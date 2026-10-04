package in.HMS.AdminDash;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/UpdateComplaintServlet")
public class UpdateComplaintServlet extends HttpServlet {

    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
    private static final String user ="root";
    private static final String password ="";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try {
            System.out.println("UpdateComplaint servlet opened");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "UPDATE complaints SET status=? WHERE c_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, status);
            ps.setInt(2, id);
System.out.println("UpdateComplaint set query");
            ps.executeUpdate();
System.out.println("UpdateComplaint execute query");
           response.sendRedirect("Admin_Dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}