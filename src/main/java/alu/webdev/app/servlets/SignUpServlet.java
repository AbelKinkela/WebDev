package alu.webdev.app.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String name = request.getParameter("your_name");
        String password = request.getParameter("your_pass");
        //String email = request.getParameter("email");

        if (name.isEmpty() || password.isEmpty()) {
            RequestDispatcher req = request.getRequestDispatcher("/signup.jsp");
            req.include(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("/dashboard.jsp");
            req.forward(request, response);
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/signup.jsp").forward(request, response);
    }
}