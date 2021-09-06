package com.epam.ragency;

import com.epam.ragency.db.dao.ApplicationDao;
import com.epam.ragency.db.entity.Application;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class Servlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        ApplicationDao applicationDao = new ApplicationDao();
        List<Application> app = applicationDao.getAllApplications();
        PrintWriter printWriter = response.getWriter();
        printWriter.write(app.get(0).toString());
        /*String path = request.getServletPath();
        if (path.equals("/")){
            request.getRequestDispatcher("/WEB-INF/view/Error404.jsp").forward(request, response);
        }
        else if (path.equals("/welcome")){
            request.getRequestDispatcher("/WEB-INF/view/welcome.jsp").forward(request, response);
        }*/
    }

    public void destroy() {
    }
}