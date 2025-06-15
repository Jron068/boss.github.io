package com.AuthServlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class AuthServlet extends HttpServlet {
    private static final Map<String, String> users = new HashMap<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("register".equalsIgnoreCase(action)) {
            if (!users.containsKey(username)) {
                users.put(username, password);
                response.sendRedirect(request.getContextPath() + "/Pages/loginpage.jsp");
            } else {
            	response.sendRedirect(request.getContextPath() + "/Pages/loginpage.jsp");

            }
        } else if ("login".equalsIgnoreCase(action)) {
            if (users.containsKey(username) && users.get(username).equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect(request.getContextPath() + "/Pages/welcome.jsp");
            } else {
            	response.getWriter().println("Unknown action.");
                response.sendRedirect(request.getContextPath() + "/Pages/register.jsp");
            }}
            
          else if ("logout".equalsIgnoreCase(action)) {
                HttpSession session = request.getSession(false); // don't create if it doesn't exist
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect(request.getContextPath() + "/Pages/loginpage.jsp");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("Unknown action.");
        }
        
    }   
    
}
