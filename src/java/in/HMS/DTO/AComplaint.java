/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package in.HMS.DTO;

public class AComplaint {

    private int id;
    private String complaint;
    private String status;

    public AComplaint(int id, String complaint, String status) {
        this.id = id;
        this.complaint = complaint;
        this.status = status;
    }
    
 

    public int getId() {
        return id;
    }

    public String getComplaint() {
        return complaint;
    }

    public String getStatus() {
        return status;
    }
}