package in.HMS.Dao;
import in.HMS.DTO.AComplaint;

import java.sql.*;
import java.util.*;

public class AComplaintDAO {

    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
    private static final String user ="root";
    private static final String password ="";

    public static List<AComplaint> getAllComplaints() {

    List<AComplaint> list = new ArrayList<>();

    try {
        Connection con = DriverManager.getConnection(url, user, password);

        String query = "SELECT c_id, complaint_text, status FROM complaints";

        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new AComplaint(
                rs.getInt("c_id"),
                rs.getString("complaint_text"),
                rs.getString("status")
            ));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
}