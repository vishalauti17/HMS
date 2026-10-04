package in.HMS.AdminDash;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

    private static final String url = "jdbc:mysql://localhost:3306/HMS06";
    private static final String user = "root";
    private static final String password = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            // 🔥 Delete query
            String query = "DELETE FROM students WHERE st_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);
            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 🔁 Reload students page
        response.sendRedirect("StudentsServlet");
    }
}