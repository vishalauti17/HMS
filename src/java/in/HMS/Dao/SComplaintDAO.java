package in.HMS.Dao;

import java.sql.*;

public class SComplaintDAO {

    private static final String url = "jdbc:mysql://localhost:3306/HMS06";
    private static final String user = "root";
    private static final String password = "";

    public static void addComplaint(String complaint) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            // ✅ Insert complaint + status only
            String query = "INSERT INTO complaints (complaint_text, status) VALUES (?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, complaint);
            ps.setString(2, "Pending"); // default

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}