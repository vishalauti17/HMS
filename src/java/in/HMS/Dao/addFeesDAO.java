/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package in.HMS.Dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user5
 */
public class addFeesDAO {
    
    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
     private static final String user ="root";
     private static final String password ="";
     
    public static boolean addFees(int RoomNo, int Fees, String Query){
      Connection con =null;
      PreparedStatement ps1 = null;
      PreparedStatement ps2 = null;
      ResultSet rs = null;
      int count = 0;
      int St_id = 0;
      int std_id=0;
      
      System.out.println("Studet fees add dao 1");
      try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           con = DriverManager.getConnection(url,user,password);
           
           String idQuery ="select st_id from students where roomNo = ?";
           ps1 = con.prepareStatement(idQuery);
      System.out.println("Studet fees add dao 2");     
           ps1.setInt(1, RoomNo);
           rs = ps1.executeQuery();
           if(rs.next()){
                St_id = rs.getInt(1);
                 System.out.println(St_id);
           }
           else{
//            response.getWriter().
               System.out.println("id not getting");
           }rs.close();
         
           System.out.println(St_id);
           ps2 = con.prepareStatement(Query);
           ps2.setInt(1, RoomNo);
           System.out.println("roonno");
           ps2.setInt(2, Fees);
           System.out.println("fees");
           ps2.setInt(3, St_id);
           System.out.println("st_id");
          
           count = ps2.executeUpdate();
           System.out.println("Studet fees add dao 3"); 
           if(count >0)
               System.out.println(" count >0 in add fees");
           
      }
      catch(ClassNotFoundException e){
             e.printStackTrace();
             System.out.println("Class not found ");
      }
      catch(SQLException e){
            e.printStackTrace();
            System.out.println("SQL query");
      }
     finally{
        try{
          if(ps2 != null)
              ps2.close();
          if(ps1 != null)
              ps1.close();
          if(con != null)
              con.close(); 
        }
        catch(SQLException e){
          e.printStackTrace();
       }
      }
      
      
    return count >0;  
  }
}

