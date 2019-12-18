package alu.webdev.app.entities;

public class Status {

    private String status;

    /**
     * Default Constructor
     */
    public Status() {
        this.status = "uncompleted";
    }

    /**
     * Setting Status
     */
    public Status(String status) {
        this.status = status;
    }

    /**
     * @return
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(String status) {
        if (status.equalsIgnoreCase("uncompleted") || status.equalsIgnoreCase("completed")) {
            this.status = status;
        } else {
            System.out.println("invalid Status type!");
        }
    }

}