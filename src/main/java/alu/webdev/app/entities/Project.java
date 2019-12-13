package alu.webdev.app.entities;
import java.io.Serializable;

public class Project implements Serializable{
    String name;
    int completionPercentage;
    int days;
    int totalDuration;

    public Project() {
        this.name = "";
        this.completionPercentage = 0;
        this.days = 0;
        this.totalDuration = 0;
    }

    public Project(String name, int completionPercentage, int days, int totalDuration) {
        this.name = name;
        this.completionPercentage = completionPercentage;
        this.days = days;
        this.totalDuration = totalDuration;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCompletionPercentage() {
        return completionPercentage;
    }

    public void setCompletionPercentage(int completionPercentage) {
        this.completionPercentage = completionPercentage;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(int totalDuration) {
        this.totalDuration = totalDuration;
    }

    @Override
    public String toString() {
        return "Project{" +
                "name='" + name + '\'' +
                ", completionPercentage=" + completionPercentage +
                ", days=" + days +
                ", totalDuration=" + totalDuration +
                '}';
    }
}
