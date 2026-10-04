/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.HMS.AdminDash;
import in.HMS.Dao.addFeesDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author user5
 */
@WebServlet("/AddFeesServlet")
public class AddFeesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      
        String RoomNo = request.getParameter("room");
        String Fees = request.getParameter("fees");
        
        int room =0;
        int fee =0;
        try{
             room = Integer.parseInt(RoomNo);
             fee = Integer.parseInt(Fees);
        }
        catch(NumberFormatException e){
              response.getWriter().println("Room must be a number!");
        }
        
        System.out.println("Studet fees add servlet1");
        String Query = "insert into fees(room_No, fee, std_id) values( ?,?,?)";
        boolean Status = addFeesDAO.addFees(room, fee, Query);
        
        System.out.println("Studet fees add servlet 2");
        if(Status){
            response.sendRedirect("StudentsServlet");
        }
        else{
            System.out.println("Student fees failed");
            request.setAttribute("msg","Fees not pay Something issue found..");
            
        }
        
    }
}
