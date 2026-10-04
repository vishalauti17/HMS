///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
package in.HMS.AdminDash;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.HMS.Dao.*;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             
            String Susername = request.getParameter("username");
            String Spassword = request.getParameter("password"); 
            String name = request.getParameter("name");
            String room = request.getParameter("room");
            String course = request.getParameter("course");
            
            String SlogQuery = "insert into slogin (username, password) values(?,?)";
            String SQuery = "insert into students( name, roomNo, course, Std_id) values( ?,?,?,?)";
            
             int roomNo;
             
             try {
              roomNo = Integer.parseInt(room);
            } 
            catch(NumberFormatException e) {
              response.getWriter().println("Room must be a number!");
            return;
            }

            boolean Status = addStudentDAO.AddStudent( Susername, Spassword, name, roomNo, course, SQuery, SlogQuery);
           
           if(Status){
              response.sendRedirect("AddFees.jsp");
            } 
           else {
               request.setAttribute("msg","Student not added while some issue..");
               request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
             }
            
       }

    
}
    

