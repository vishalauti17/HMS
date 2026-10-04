package in.HMS.Dao;

import java.sql.*;

public class FeeDAO {

    private static final String url = "jdbc:mysql://localhost:3306/HMS06";
    private static final String user = "root";
    private static final String password = "";

    public static int getFee(int roomNo, String Query) {

        int fee = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            // ✅ FIXED QUERY (correct column)
            String roomIDQuery = "SELECT std_id FROM students WHERE roomNo=?";
            PreparedStatement ps1 = con.prepareStatement(roomIDQuery);
            ps1.setInt(1, roomNo);

            int roomID = 0;

            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
                roomID = rs1.getInt("std_id"); // ✅ correct
                System.out.println("Student ID: " + roomID);
            }

            // ✅ Now get fee
            PreparedStatement ps2 = con.prepareStatement(Query);
            ps2.setInt(1, roomID);

            ResultSet rs = ps2.executeQuery();

            if (rs.next()) {
                fee = rs.getInt("fee");
                System.out.println("Fee: " + fee);
            }

            rs.close();
            rs1.close();
            ps2.close();
            ps1.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return fee;
    }
    
}