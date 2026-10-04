package in.HMS.Dao;

import java.sql.*;

public class studentDashboardDAO {

    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
    private static final String user ="root";
    private static final String password ="";

    // 🔹 Method to get Fee
   public static int getFee(String username, String passwordInput) {

    int fee = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        String query = "SELECT f.fee FROM Fees f " +
                       "JOIN Slogin l ON f.Std_id = l.std_id " +
                       "WHERE l.username=? AND l.password=?";

        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, passwordInput);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            fee = rs.getInt("fee");
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return fee;
}
}