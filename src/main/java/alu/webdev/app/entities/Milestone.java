package alu.webdev.app.entities;

public class Milestone {
    private String name;
    private Status status;


    public Milestone(String name) {
        this.name = name;
        Status status = new Status();
        this.status = status;
    }

    /**
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return
     */
    public Status getStatus() {
        return status;
    }


    /**
     * @param status
     */
    public void setStatus(Status status) {
        this.status = status;
    }


    /**
     * @return
     */
    @Override
    public String toString() {
        return "Milestone{" +
                "name='" + name + '\'' +
                ", status=" + status +
                '}';
    }


}
