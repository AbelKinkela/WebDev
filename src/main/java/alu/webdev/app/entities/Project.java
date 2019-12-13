package alu.webdev.app.entities;

import java.util.ArrayList;
import java.util.Date;

public class Project {

    private String projectName;
    private Status projectStatus;
    private Date startDate;
    private Date endDate;
    private String description;
    private ArrayList<Milestone> milestones;

    /**
     * @param projectName
     */
    public Project(String projectName, Status projectStatus, Date startDate, Date endDate, String description, ArrayList<Milestone> milestones) {
        this.projectName = projectName;
        this.projectStatus = projectStatus;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.milestones = milestones;
    }

    /**
     *
     */
    public Project(){

    }

    /**
     * @return
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * @param projectName
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }


    /**
     * @return
     */
    public Status getProjectStatus() {
        return projectStatus;
    }

    /**
     * @param projectStatus
     */
    public void setProjectStatus(Status projectStatus) {
        this.projectStatus = projectStatus;
    }

    /**
     * @return
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * @param startDate
     */
    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    /**
     * @return
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * @param endDate
     */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return
     */
    public ArrayList<Milestone> getMilestones() {
        return milestones;
    }

    /**
     * @param milestones
     */
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
