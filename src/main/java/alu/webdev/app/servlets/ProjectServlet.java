package alu.webdev.app.servlets;


import alu.webdev.app.dao.ProjectDao;
import alu.webdev.app.dao.ProjectDaoImpl;
import alu.webdev.app.entities.Milestone;
import alu.webdev.app.entities.Project;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addProjectForm")
public class ProjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProjectDao projectDao;

    public void init() {
        projectDao = new ProjectDaoImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    displayNewProjectForm(request, response);
                    break;
                /*case "/insert":
                    insertProject(request, response);
                    break;*/
                case "/delete":
                    deleteProject(request, response);
                    break;
                case "/edit":
                    displayEditProjectForm(request, response);
                    break;
                case "/update":
                    updateProject(request, response);
                    break;
                case "/list":
                    listProject(request, response);
                    break;
                default:
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/home.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listProject(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<Project> listProject = projectDao.selectAllProjects();
        request.setAttribute("listProject", listProject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.html");
        dispatcher.forward(request, response);
    }

    private void displayNewProjectForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/projectForm.jsp");
        dispatcher.forward(request, response);
    }

    private void displayEditProjectForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Project existingProject = projectDao.selectProject(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/projectForm.jsp");
        request.setAttribute("project", existingProject);
        dispatcher.forward(request, response);
    }

/*    private void insertProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        String projectId = request.getParameter("projectId");
        String projectName = request.getParameter("projectName");
        boolean projectStatus = Boolean.valueOf(request.getParameter("projectStatus"));
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-mm-dd");
		LocalDate startDate = LocalDate.parse(request.getParameter("startDate"),df);
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"),df);
        String description = request.getParameter("description");

        Object milestoneObj= request.getParameter("milestones");
        ArrayList<Milestone> milestones=(ArrayList<Milestone>)milestoneObj;

        Project newProject = new Project(projectName, projectStatus, startDate, endDate, description,milestones);
        projectDao.insertProject(newProject);
        response.sendRedirect("list");
    }*/

    private void updateProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String projectId = request.getParameter("projectId");
        String projectName = request.getParameter("projectName");
        boolean projectStatus = Boolean.valueOf(request.getParameter("projectStatus"));
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-mm-dd");
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"),df);
        LocalDate endDate = LocalDate.parse(request.getParameter("endDate"),df);
        String description = request.getParameter("description");

        Object milestoneObj= request.getParameter("milestones");
        ArrayList<Milestone> milestones=(ArrayList<Milestone>)milestoneObj;

        Project updateProject = new Project(projectName, projectStatus, startDate, endDate, description,milestones);
        projectDao.updateProject(updateProject);

        response.sendRedirect("list");
    }

    private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        projectDao.deleteProject(id);
        response.sendRedirect("list");
    }


}


