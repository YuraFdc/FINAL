package com.epam.ragency;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Servlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String path = request.getServletPath();
        if (path.equals("/")){
            request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
        }
        else if (path.equals("/welcome")){
            request.getRequestDispatcher("/WEB-INF/view/welcome.jsp").forward(request, response);
        }
    }

    public void destroy() {
    }
}