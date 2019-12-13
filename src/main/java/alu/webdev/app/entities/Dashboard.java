package alu.webdev.app.entities;

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



    /**
     *
     */
    public void createProject(String name, int completionPercentage, int days, int totalDuration){
        projects = new ArrayList<Project>();
        Project project = new Project(name, completionPercentage, days, totalDuration);
        projects.add(project);
    }

    public void deleteProject(Project project){
        projects.remove(project);
    }

}



