package in.HMS.Dao;

import java.sql.*;

public class ASloginDAO {
    
    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
    private static final String user ="root";
    private static final String password ="";
  
    public static Object ASlogin(String Username, String Password, String Query) {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            ps = con.prepareStatement(Query);
            ps.setString(1, Username);
            ps.setString(2, Password);

            rs = ps.executeQuery();

            if (rs.next()) {
                System.out.println("Login Successfully");

                try {
                    // For Student → get roomNo
                    int roomNo = rs.getInt("roomNo");
                    return roomNo;
                } catch (Exception e) {
                    // For Admin → no roomNo column
                    return true;
                }
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}