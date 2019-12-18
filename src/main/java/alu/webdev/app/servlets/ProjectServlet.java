package alu.webdev.app.servlets;

import alu.webdev.app.dao.DatabaseConnection;
import alu.webdev.app.entities.Milestone;
import alu.webdev.app.entities.Project;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProjectServlet extends HttpServlet {



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Project project = new Project();

        String action = request.getRequestURI();
        int x = Integer.parseInt(action.replaceAll("[\\D]", ""));

        try {
            // Initialize the database
            Connection conn = DatabaseConnection.initializeDatabase();
            Statement stmt = conn.createStatement();
            ResultSet rs;
            String query = "SELECT * FROM PROJECT where ID="+x;
            System.out.println(query);
            rs = stmt.executeQuery(query);
            //
            while (rs.next()) {
                int projectID = rs.getInt("ID");
                String projectName = rs.getString("NAME");
                Date start_date = rs.getDate("START_DATE");
                Date end_date = rs.getDate("END_DATE");
                String description = rs.getString("DESCRIPTION");
                String milestones_string = rs.getString("MILESTONES");
                //createMileStones(milestones_string);
                //System.out.println("Record:");[
                project = new Project(projectID, projectName, start_date.toLocalDate(), end_date.toLocalDate(), description, createMileStones(milestones_string));

            }
            conn.close();

        }
        catch (Exception e) {
            e.printStackTrace();
        }

/*        for (Project p : dashboard.getProjects()) {
            System.out.println(p.getProjectName());
        }*/
        request.setAttribute("project", project);

        getServletContext().getRequestDispatcher("/view_project.jsp").forward(request, response);

    }

    public ArrayList<Milestone> createMileStones(String str)
    {
        ArrayList<Milestone> milestones=new ArrayList<>();
        String[] arrOfStr = str.split(",", -2);
        for (String a : arrOfStr) {
            milestones.add(new Milestone(a.trim()));
        }
        return milestones;
    }
}
