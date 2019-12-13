package alu.webdev.app.entities;

public class Milestone {
    private String name;
    private Status status;


    public Milestone(String name) {
        this.name = name;
        Status status = new Status();
        this.status = status;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public Status getStatus() {
        return status;
    }



    public void setStatus(Status status) {
        this.status = status;
    }


    @Override
    public String toString() {
        return "Milestone{" +
                "name='" + name + '\'' +
                ", status=" + status +
                '}';
    }


}
