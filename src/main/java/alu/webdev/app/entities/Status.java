package alu.webdev.app.entities;

public class Status {
    private enum StatusTypes {
        completed, uncompleted;
    }

    StatusTypes status;

    /**
     * Default Constructor
     */
    public Status() {
        this.status = StatusTypes.uncompleted;
    }

    /**
     * Setting Status
     */
    public Status(StatusTypes status) {
        this.status = status;
    }

    /**
     * @return
     */
    public StatusTypes getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(StatusTypes status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return  status.toString();
    }
}
