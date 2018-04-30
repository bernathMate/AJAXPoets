package com.codecool.web.service.simple;

import com.codecool.web.dao.PoemDao;
import com.codecool.web.model.Poem;
import com.codecool.web.service.PoemService;
import com.codecool.web.service.exception.ServiceException;

import java.sql.SQLException;
import java.util.List;

public class SimplePoemService implements PoemService{

    private final PoemDao poemDao;

    public SimplePoemService(PoemDao poemDao) {
        this.poemDao = poemDao;
    }

    @Override
    public List<Poem> getPoemsByPoetId(int poetId) throws SQLException, ServiceException {
        try {
            List<Poem> poems = poemDao.findAllByPoetId(poetId);
            if (poems.size() == 0) {
                throw new ServiceException("There are no poems, yet!");
            }
            return poems;
        } catch (NumberFormatException ex) {
            throw new ServiceException("The poet's id must be an integer!");
        } catch (IllegalArgumentException ex) {
            throw new ServiceException(ex.getMessage());
        }
    }

    @Override
    public Poem getPoemByPoetIdAndPoemId(int poetId, int poemId) throws SQLException, ServiceException {
        try {
            Poem poem = poemDao.findByPoetIdAndPoemId(poetId, poemId);
            if (poem == null) {
                throw new ServiceException("Unknown poem!");
            }
            return poem;
        } catch (NumberFormatException ex) {
            throw new ServiceException("The poet's id and poem's id must be an integer!");
        } catch (IllegalArgumentException ex) {
            throw new ServiceException(ex.getMessage());
        }
    }
}
