package in.HMS.StudDash;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import in.HMS.Dao.SComplaintDAO;

@WebServlet("/AddComplaintServlet")
public class AddComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String complaint = request.getParameter("complaint");

        // ✅ validation
        if (complaint == null || complaint.trim().isEmpty()) {
            response.sendRedirect("AddComplaint.jsp");
            return;
        }

        // ✅ save complaint
        SComplaintDAO.addComplaint(complaint);

        // ✅ redirect back
        response.sendRedirect("Student_Dashboard.jsp");
    }
}