package in.HMS.Dao;

import in.HMS.DTO.Student;
import java.sql.*;
import java.util.*;

public class StudentDAO {

    private static final String url ="jdbc:mysql://localhost:3306/HMS06";
    private static final String user ="root";
    private static final String password ="";

    public static List<Student> getAllStudents() {

        List<Student> list = new ArrayList<>();

        try {
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "SELECT st_id, name, roomNo, course FROM students";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Student(
                    rs.getInt("st_id"),
                    rs.getString("name"),
                    rs.getInt("roomNo"),
                    rs.getString("course")
                ));
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}