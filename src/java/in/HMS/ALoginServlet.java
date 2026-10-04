package in.HMS;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.util.List;
import in.HMS.Dao.ASloginDAO;
import in.HMS.DTO.AComplaint;
import in.HMS.Dao.AComplaintDAO;

@WebServlet("/ALoginServlet")
public class ALoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String Username = request.getParameter("username");
        String Password = request.getParameter("password");

        String Query = "SELECT * FROM Alogin WHERE Ausername=? AND Apassword=?";
        
        Object status = ASloginDAO.ASlogin(Username, Password, Query);

        if (status != null) {

            System.out.println("Admin login success");

            // ✅ Load complaints
            List<AComplaint> complaints = AComplaintDAO.getAllComplaints();
            request.setAttribute("complaints", complaints);

            RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
            rd.forward(request, response);

        } else {
            request.setAttribute("msg","Incorrect Username or Password");
            request.getRequestDispatcher("Admin_Login.jsp").forward(request, response);
        }
    }
}