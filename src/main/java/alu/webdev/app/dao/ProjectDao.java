package alu.webdev.app.dao;

import java.sql.SQLException;

import alu.webdev.app.entities.Project;

import java.util.List;



public interface ProjectDao {

    //void insertProject(Project project) throws SQLException;

    Project selectProject(long projectId);

    List<Project> selectAllProjects();

    boolean deleteProject(int id) throws SQLException;

    boolean updateProject(Project project) throws SQLException;
}
