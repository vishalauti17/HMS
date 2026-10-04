/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package in.HMS.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author user5
 */
public class addStudentDAO {
    
     private static final String url ="jdbc:mysql://localhost:3306/HMS06";
     private static final String user ="root";
     private static final String password ="";
  
    public static boolean AddStudent(String Susername, String Spassword, String name,int roomNo, String course, String SQuery, String SlogQuery){
      
     Connection con= null;
     PreparedStatement ps1 = null;
     PreparedStatement ps2 = null;
     
     int count1=0;
     int count2=0;
     int Std_Id=0;
     
     try{ 
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
             
        //        String IDQuery ="Select id from slogin";
        ps1 = con.prepareStatement(SlogQuery, Statement.RETURN_GENERATED_KEYS);
        ps1.setString(1,Susername);
        ps1.setString(2, Spassword);
        
        count1 = ps1.executeUpdate();        
        ResultSet rs = ps1.getGeneratedKeys();

        if(rs.next()){
          Std_Id = rs.getInt(1);
         } rs.close();
        System.out.println("Std_Id"+" "+ Std_Id);
        
//      Students table adding student and  name, roomNo, course, Std_id
        ps2 = con.prepareStatement(SQuery); 
        
        ps2.setString(1, name);
        ps2.setInt(2, roomNo);
        ps2.setString(3, course);
        ps2.setInt(4, Std_Id);
        
        count2 = ps2.executeUpdate();
          if(count2 == 0){
              System.out.println(" count2 = ps2.executeUpdate(); not run");
          }  
          else{
              System.out.println(" count2 = ps2.executeUpdate(); run");
          }
     }
     catch(ClassNotFoundException e){
         e.printStackTrace();
         System.out.println("Class not found(Driver)"+e);
     }
     catch(SQLException e){
         e.printStackTrace();
         System.out.println("SQL"+e);
     }
     finally{
       try{
          
          if(ps1!=null)
              ps1.close();
          if(ps2!=null)
              ps2.close();
          if(con!=null)
              con.close();
       }
       catch(SQLException e){
          e.printStackTrace();
       }
     }
      
  return count1>0 && count2 >0;
  }

}
