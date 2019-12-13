package alu.webdev.app.entities;

public class Status {

    private String status;


    public Status() {
        this.status = "uncompleted";
    }


    public Status(String status) {
        this.status = status;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        if (status.equalsIgnoreCase("uncompleted") || status.equalsIgnoreCase("completed")) {
            this.status = status;
        } else {
            System.out.println("invalid Status type!");
        }
    }

}
