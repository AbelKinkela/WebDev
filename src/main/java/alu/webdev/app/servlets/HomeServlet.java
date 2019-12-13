package alu.webdev.app.servlets;

import alu.webdev.app.entities.Dashboard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class HomeServlet extends HttpServlet {
    Dashboard dashboard = new Dashboard();
    //Date aDate = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate today = LocalDate.now();
        String name = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String description = request.getParameter("description");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/d/yyyy");
        //convert String to LocalDate
        LocalDate startDate_formatted = LocalDate.parse(startDate);
        LocalDate endDate_formatted = LocalDate.parse(endDate);

        //LocalDate startDate_formatted = LocalDate.parse(startDate, formatter);
        //LocalDate endDate_formatted = LocalDate.parse(endDate, formatter);

        Period project_total_duration = Period.between(startDate_formatted, endDate_formatted);
        int totalDuration = project_total_duration.getDays();

        Period project_duration = Period.between(startDate_formatted, today);
        int days = project_duration.getDays();

        int completionPercentage = (Integer) days/totalDuration;

        dashboard.createProject(name, completionPercentage, days, totalDuration);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // store data in User object and save User object in database

       // dashboard.createProject("Work on AADP Project", 2, 3,10);

        // set User object in request object and set URL
       request.setAttribute("projects", dashboard.getProjects());

        getServletContext().getRequestDispatcher("/Dashboard.jsp").forward(request, response);

    }
}
