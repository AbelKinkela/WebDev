package alu.webdev.app.entities;

import java.util.ArrayList;
import java.time.LocalDate;

public class Project {
    private int projectId;
    private String projectName;
    private boolean projectStatus;
    private LocalDate startDate;
    private LocalDate endDate;
    private String description;
    private ArrayList<Milestone> milestones;


    public Project(String projectName, boolean projectStatus, LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        this.projectName = projectName;
        this.projectStatus = projectStatus;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.milestones = milestones;
    }



    public Project(int projectId, String projectName, boolean projectStatus, LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        this.projectName = projectName;
        this.projectStatus = projectStatus;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.milestones = milestones;
    }


    public Project() {

    }


    public String getProjectName() {
        return projectName;
    }


    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }



    public Boolean getProjectStatus() {
        return projectStatus;
    }


    public void setProjectStatus(String projectStatus) {
        Status status = new Status(projectStatus);
        this.projectStatus = status.getStatus();
    }


    public LocalDate getStartDate() {
        return startDate;
    }


    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }


    public LocalDate getEndDate() {
        return endDate;
    }


    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public int getProjectId() {
        return projectId;
    }


    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }


    public ArrayList<Milestone> getMilestones() {
        return milestones;
    }


    public void setMilestones(ArrayList<Milestone> milestones) {
        this.milestones = milestones;
    }


    @Override
    public String toString() {
        return "Project{" +
                "projectName='" + projectName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", description='" + description + '\'' +
                ", milestones=" + milestones +
                '}';
    }
}
