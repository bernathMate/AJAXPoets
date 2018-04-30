package com.codecool.web.dao.database;

import com.codecool.web.dao.PoemDao;
import com.codecool.web.model.Poem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabasePoemDao extends AbstractDao implements PoemDao{

    public DatabasePoemDao(Connection connection) {
        super(connection);
    }

    @Override
    public List<Poem> findAllByPoetId(int poetId) throws SQLException {
        List<Poem> poems = new ArrayList<>();
        String sql = "SELECT id, title, content, published_date FROM works WHERE poet_id = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, poetId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    poems.add(fetchPoem(resultSet));
                }
            }
        }
        return poems;
    }

    @Override
    public Poem findByPoetIdAndPoemId(int poetId, int poemId) throws SQLException {
        String sql = "SELECT id, title, content, published_date FROM works WHERE poet_id = ? and id = ?;";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, poetId);
            statement.setInt(2, poemId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return fetchPoem(resultSet);
                }
            }
        }
        return null;
    }

    private Poem fetchPoem(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String title = resultSet.getString("title");
        String content = resultSet.getString("content");
        int publishedDate = resultSet.getInt("published_date");
        return new Poem(id, title, content, publishedDate);
    }
}
