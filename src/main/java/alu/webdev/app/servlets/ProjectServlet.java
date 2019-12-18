package alu.webdev.app.servlets;

import alu.webdev.app.dao.DatabaseConnection;
import alu.webdev.app.dbCon.DbManager;
import alu.webdev.app.entities.Milestone;
import alu.webdev.app.entities.Project;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class ProjectServlet extends HttpServlet {



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void listProject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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


    private void deleteTodo(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean rowDeleted;
        try (Connection connection = DbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from PROJECT where id = ?;");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        response.sendRedirect("/listProject");
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/delete":
                    deleteTodo(request, response);
                    break;
                case "/listProject":
                    listProject(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

}