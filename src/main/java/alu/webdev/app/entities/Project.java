package alu.webdev.app.entities;

import java.time.Period;
import java.util.ArrayList;
import java.time.LocalDate;

public class Project {
    private int projectId;
    private String projectName;
    private int completionPercentage;
    private LocalDate startDate;
    private LocalDate endDate;
    private String description;
    private ArrayList<Milestone> milestones;


    public Project() {}
    public Project(int projectId, String projectName, LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.milestones = milestones;
        this.completionPercentage =0;
    }

    public Project(int projectId, String projectName, LocalDate startDate, LocalDate endDate, String description) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
    }

    public Project(String projectName, LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        this.projectName = projectName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.description = description;
        this.milestones = milestones;
        this.completionPercentage =0;
    }

    public Project(int projectId, String projectName, LocalDate startDate, LocalDate endDate, int completionPercentage) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.completionPercentage =completionPercentage;
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
    public LocalDate getStartDate() {
        return startDate;
    }

    /**
     * @param startDate
     */
    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    /**
     * @return
     */
    public LocalDate getEndDate() {
        return endDate;
    }

    /**
     * @param endDate
     */
    public void setEndDate(LocalDate endDate) {
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


    public int getProjectId() {
        return projectId;
    }


    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    /**
     * @return
     */
    public ArrayList<Milestone> getMilestones() {
        return milestones;
    }

    public int getCompletionPercentage() {
        return completionPercentage;
    }

    public void setCompletionPercentage(int completionPercentage) {
        this.completionPercentage = completionPercentage;
    }

    public void setMilestones(ArrayList<Milestone> milestones) {
        this.milestones = milestones;
    }

    public int getProjectTotalDays(){
        Period project_total_duration = Period.between(startDate, endDate);
        int totalDuration = project_total_duration.getDays();
        return totalDuration;
    }

    public int getCurrentProjectDuration(){
        LocalDate today = LocalDate.now();
        Period project_duration = Period.between(startDate, today);
        int days = project_duration.getDays();
        return days;
    }
    @Override
    public String toString() {
        return "Project{" +
                "projectName='" + projectName + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", description='" + description + '\'' +
                '}';
    }
}