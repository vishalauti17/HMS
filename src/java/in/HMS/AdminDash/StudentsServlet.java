package in.HMS.AdminDash;

import in.HMS.Dao.StudentDAO;
import in.HMS.DTO.Student;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.List;

@WebServlet("/StudentsServlet")
public class StudentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> list = StudentDAO.getAllStudents();

        request.setAttribute("students", list);

        RequestDispatcher rd = request.getRequestDispatcher("Students.jsp");
        rd.forward(request, response);
    }
}