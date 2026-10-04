package in.HMS.DTO;

public class Student {

    private int id;
    private String name;
    private int roomNo;
    private String course;

    public Student(int id, String name, int roomNo, String course) {
        this.id = id;
        this.name = name;
        this.roomNo = roomNo;
        this.course = course;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public int getRoomNo() { return roomNo; }
    public String getCourse() { return course; }
}