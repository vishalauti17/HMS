package in.HMS;

import in.HMS.DTO.AComplaint;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import in.HMS.Dao.*;
import java.util.List;
import javax.servlet.RequestDispatcher;

@WebServlet("/SLoginServlet")
public class SLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String Username = request.getParameter("username");
        String Password = request.getParameter("password");

        // ✅ Correct JOIN Query
        String query = "SELECT s.roomNo FROM students s " +
                       "JOIN Slogin l ON s.std_id = l.std_id " +
                       "WHERE l.username=? AND l.password=?";

        Object result = ASloginDAO.ASlogin(Username, Password, query);
        
        if (result != null) {

            int roomNo = (int) result;
            request.setAttribute("roomNo", roomNo);
            
            HttpSession session = request.getSession();
            session.setAttribute("roomNo", roomNo);
            
            List<AComplaint> complaints = AComplaintDAO.getAllComplaints();
            request.setAttribute("complaints", complaints);

            String FeeQuery = "SELECT fee FROM Fees WHERE ft_id=?";

            int fee = FeeDAO.getFee(roomNo, FeeQuery);
            session.setAttribute("fee", fee);
            
            RequestDispatcher rd = request.getRequestDispatcher("Student_Dashboard.jsp");
            rd.forward(request, response);

        } else {
            RequestDispatcher rd = request.getRequestDispatcher("Student_Login.jsp");
            rd.forward(request, response);
        }
    }
}