package alu.webdev.app.entities;

public class Milestone {
    private String name;
    private boolean done;


    public Milestone(String name) {
        this.name = name;
        this.done=false;
    }

    public Milestone(String name, boolean done) {
        this.name = name;
        this.done = done;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    @Override
    public String toString() {
        return "Milestone{" +
                "name='" + name + '\'' +
                ", done=" + done +
                '}';
    }
}