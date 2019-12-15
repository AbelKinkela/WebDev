package alu.webdev.app.entities;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author AbelKinkela
 */
public class Dashboard {

    private ArrayList<Project> projects=new ArrayList<Project>();
    int counter=0;

    public ArrayList<Project> getProjects() {
        return projects;
    }

    public void setProjects(ArrayList<Project> projects) {
        this.projects = projects;
    }


    public void createProject(int projectID, String projectName, LocalDate startDate, LocalDate endDate, String description, ArrayList<Milestone> milestones) {
        Project project = new Project(projectID, projectName, startDate, endDate, description, milestones);
        projects.add(project);
        System.out.println("Project added to dashboard.."+ counter);
        counter ++;
    }

    public void deleteProject(Project project){
        projects.remove(project);
    }

}



