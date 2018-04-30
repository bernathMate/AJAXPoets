package com.codecool.web.servlet;

import com.codecool.web.dao.PoemDao;
import com.codecool.web.dao.database.DatabasePoemDao;
import com.codecool.web.model.Poem;
import com.codecool.web.model.Poet;
import com.codecool.web.service.PoemService;
import com.codecool.web.service.exception.ServiceException;
import com.codecool.web.service.simple.SimplePoemService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/protected/poems")
public final class PoemsServlet extends AbstractServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = getConnection(req.getServletContext())) {
            PoemDao poemDao = new DatabasePoemDao(connection);
            PoemService poemService = new SimplePoemService(poemDao);

            int poetId = ((Poet) req.getSession().getAttribute("poet")).getId();
            List<Poem> poems = poemService.getPoemsByPoetId(poetId);

            sendMessage(resp, HttpServletResponse.SC_OK, poems);
        } catch (ServiceException e) {
            sendMessage(resp, HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (SQLException e) {
            handleSqlError(resp, e);
        }
    }
}
