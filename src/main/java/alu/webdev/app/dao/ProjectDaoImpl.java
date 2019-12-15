package alu.webdev.app.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import alu.webdev.app.entities.Milestone;
import alu.webdev.app.entities.Project;
import alu.webdev.app.dbCon.DbManager;


public class ProjectDaoImpl implements ProjectDao {

    private static final String INSERT_PROJECTS_SQL = "INSERT INTO projects"
            + "  (projectName, projectStatus, startDate, endDate,  description, milestones) VALUES " + " (?, ?, ?, ?, ?, ?);";

    private static final String SELECT_PROJECT_BY_ID = "select id,projectName,projectStatus, startDate, endDate,  description, milestones from projects where id =?";
    private static final String SELECT_ALL_PROJECTS = "select * from projects";
    private static final String DELETE_PROJECT_BY_ID = "delete from projects where id = ?;";
    private static final String UPDATE_PROJECT = "update projects set projectName = ?, projectStatus= ?, startDate =?, endDate =?, description = ? , milestones = ? , where id = ?;";


    public ProjectDaoImpl() {

    }



/*    @Override
    public void insertProject(Project project) throws SQLException {
        System.out.println(INSERT_PROJECTS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DbManager.getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_PROJECTS_SQL)) {
            ps.setString(1, project.getProjectName());
            ps.setBoolean(2, project.getProjectStatus());
            ps.setDate(3, DbManager.getSQLDate(project.getStartDate()));
            ps.setDate(4, DbManager.getSQLDate(project.getEndDate()));
            ps.setString(5, project.getDescription());
            ArrayList<Milestone> milestones = project.getMilestones();
            String milestonesString = "";
            for (Milestone milestone : milestones) {
                if (milestonesString.equals("")) {
                    milestonesString = milestone.toString();
                } else {
                    milestonesString += "," + milestone;
                }
            }
            ps.setString(6, milestonesString);
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException exception) {
            DbManager.printSQLException(exception);
        }

    }*/


    @Override
    public Project selectProject(long projectId) {
        Project project = null;
        // Step 1: Establishing a Connection
        try (Connection connection = DbManager.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement ps = connection.prepareStatement(SELECT_PROJECT_BY_ID)) {
            ps.setLong(1, projectId);
            System.out.println(ps);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("projectId");
                String projectName = rs.getString("projectName");
                boolean projectStatus = rs.getBoolean("projectStatus");
                LocalDate startDate = rs.getDate("startDate").toLocalDate();
                LocalDate endDate = rs.getDate("endDate").toLocalDate();
                String description = rs.getString("description");

                ArrayList<Milestone> milestones = null;
                if (project != null) {
                    milestones = project.getMilestones();
                }
                String milestonesString = "";
                for (Milestone milestone : milestones) {
                    if (milestonesString.equals("")) {
                        milestonesString = milestone.toString();
                    } else {
                        milestonesString += "," + milestone;
                    }
                }
                milestonesString = rs.getString("milestones");
                project = new Project(id, projectName, projectStatus, startDate, endDate, description, milestones);

            }
        } catch (SQLException exception) {
            DbManager.printSQLException(exception);
        }
        return project;
    }


    @Override
    public List<Project> selectAllProjects() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Project> projects = new ArrayList<>();

        // Step 1: Establishing a Connection
        try (Connection connection = DbManager.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_PROJECTS)) {
            System.out.println(ps);
            // Step 3: Execute the query or update query
            ResultSet rs = ps.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("projectId");
                String projectName = rs.getString("projectName");
                boolean projectStatus = rs.getBoolean("projectStatus");
                LocalDate startDate = rs.getDate("startDate").toLocalDate();
                LocalDate EndDate = rs.getDate("EndDate").toLocalDate();
                String description = rs.getString("description");
                ArrayList<Milestone> milestones = (ArrayList<Milestone>) rs.getObject("milestones");
                projects.add(new Project(id, projectName, projectStatus, startDate, EndDate, description, milestones));
            }
        } catch (SQLException exception) {
            DbManager.printSQLException(exception);
        }
        return projects;
    }



    @Override
    public boolean deleteProject(int id) throws SQLException {
        boolean projectDeleted;
        try (Connection connection = DbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_BY_ID)) {
            statement.setInt(1, id);
            projectDeleted = statement.executeUpdate() > 0;
        }
        return projectDeleted;
    }


    @Override
    public boolean updateProject(Project project) throws SQLException {
        boolean projectUpdated;
        try (Connection connection = DbManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PROJECT)) {
            statement.setString(1, project.getProjectName());
            statement.setBoolean(2, project.getProjectStatus());
            statement.setDate(3, DbManager.getSQLDate(project.getStartDate()));
            statement.setDate(4, DbManager.getSQLDate(project.getEndDate()));
            statement.setString(5, project.getDescription());
            statement.setObject(6, project.getMilestones());
            statement.setInt(7, project.getProjectId());
            projectUpdated = statement.executeUpdate() > 0;
        }
        return projectUpdated;
    }
}

