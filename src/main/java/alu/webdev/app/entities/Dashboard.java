package alu.webdev.app.entities;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author AbelKinkela
 */
public class Dashboard {

    private ArrayList<Project> projects=new ArrayList<Project>();


    public ArrayList<Project> getProjects() {
        return projects;
    }

    public void setProjects(ArrayList<Project> projects) {
        this.projects = projects;
    }


    public void createProject(int projectID, String projectName, LocalDate startDate, LocalDate endDate, int completionPercentage) {
        Project project = new Project(projectID, projectName, startDate, endDate, completionPercentage);
        projects.add(project);

    }

    public void deleteProject(Project project){
        projects.remove(project);
    }

}



