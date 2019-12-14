package alu.webdev.app.entities;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author AbelKinkela
 */
public class Dashboard {

    private ArrayList<Project> projects;

    public ArrayList<Project> getProjects() {
        return projects;
    }

    public void setProjects(ArrayList<Project> projects) {
        this.projects = projects;
    }


    public void createProject(String projectName,  LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        projects = new ArrayList<Project>();
        Project project = new Project(projectName, startDate, endDate, description, milestones);
        projects.add(project);

    }

    public void deleteProject(Project project){
        projects.remove(project);
    }

}



