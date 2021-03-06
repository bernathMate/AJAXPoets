package com.codecool.web.service;

import com.codecool.web.model.Poem;
import com.codecool.web.service.exception.ServiceException;

import java.sql.SQLException;
import java.util.List;

public interface PoemService {

    List<Poem> getPoemsByPoetId(int poetId) throws SQLException, ServiceException;

    Poem getPoemByPoetIdAndPoemId(int poetId, int poemId) throws SQLException, ServiceException;

    int getSubstringOccurenceByPoetIdAndPoemId(int poetId, int poemId, String substring) throws SQLException, ServiceException;
}
