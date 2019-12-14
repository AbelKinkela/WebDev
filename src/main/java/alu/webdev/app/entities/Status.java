package alu.webdev.app.entities;

public class Status {

    private boolean status;


    public Status() {
        this.status = false;
    }


    public Status(String status) {
        if(status.equalsIgnoreCase("Ongoing")){
            this.status = false;
        }else if(status.equalsIgnoreCase("Completed")){
            this.status = true;
        }else{
            System.out.println("invalid Status");
        }
    }


    public Boolean getStatus() {
        return status;
    }


    public void setStatus(String status) {
        if (status.equalsIgnoreCase("ongoing")) {
            this.status = false;
        } else if(status.equalsIgnoreCase("completed")){
            this.status = true;
        }else {
            System.out.println("invalid Status type!");
        }
    }

}
