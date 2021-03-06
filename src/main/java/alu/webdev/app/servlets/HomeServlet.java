package alu.webdev.app.servlets;

import alu.webdev.app.dao.DatabaseConnection;
import alu.webdev.app.entities.Dashboard;
import alu.webdev.app.entities.Milestone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class HomeServlet extends HttpServlet {
    ArrayList<Milestone> milestones =new ArrayList<>();
    int userID;
    //Date aDate = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String projectName = request.getParameter("name");
        //String projectStatus = request.getParameter("projectStatus");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String description = request.getParameter("description");
        String milestones_string = request.getParameter("milestones");

        if(endDate != null){
            try {
                // Initialize the database
                Connection con = DatabaseConnection.initializeDatabase();
                // Create a SQL query to insert data into PROJECT table
                PreparedStatement st = con
                        .prepareStatement("insert into PROJECT (NAME, START_DATE, END_DATE, DESCRIPTION, MILESTONES, USER_ID) values(?, ?, ?, ?, ?, ?)");
                st.setString(1, projectName);
                //st.setString(2, projectStatus);
                st.setDate(2, Date.valueOf(startDate));
                st.setDate(3, Date.valueOf(endDate));
                st.setString(4, description);
                st.setString(5, milestones_string);
                st.setInt(6, 1); //to be replaced with userID
                // Execute the insert command using executeUpdate()
                // to make changes in database
                st.executeUpdate();

                // Close all the connections
                st.close();
                con.close();
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }

        doGet(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get user iD
        //String userID = request.getParameter("your_user_ID");

        Dashboard dashboard = new Dashboard();

        try {
            // Initialize the database
            Connection conn = DatabaseConnection.initializeDatabase();
            Statement stmt = conn.createStatement();
            ResultSet rs;
            //rs=stmt.executeQuery("SELECT * FROM PROJECT where USER_ID=userID");
            rs = stmt.executeQuery("SELECT * FROM PROJECT");
            //loop through the resultset
            while ( rs.next() ) {
                int projectID = rs.getInt("ID");
                String projectName = rs.getString("NAME");
                Date start_date = rs.getDate("START_DATE");
                Date end_date = rs.getDate("END_DATE");
                int completionPercentage = rs.getInt("COMPLETION_PERCENT");

                dashboard.createProject(projectID, projectName, start_date.toLocalDate(), end_date.toLocalDate(), completionPercentage);
            }
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("projects", dashboard.getProjects());
        getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }

}