package com.codecool.web.dao;

import com.codecool.web.model.Poem;

import java.sql.SQLException;
import java.util.List;

public interface PoemDao {

    List<Poem> findAllByPoetId(int poetId) throws SQLException;

    Poem findByPoetIdAndPoemId(int poetId, int poemId) throws SQLException;
}
