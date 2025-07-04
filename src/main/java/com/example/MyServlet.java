package com.example;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // response.setContentType("text/html");
        // response.setCharacterEncoding("UTF-8");

        // PrintWriter out = response.getWriter();
        
        // out.println("<html><body>");
        // out.println("<h1>Hello, World from pranshu!</h1>");
        // out.println("</body></html>");
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
