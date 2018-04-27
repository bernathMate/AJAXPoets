package com.codecool.web.dao;

import com.codecool.web.model.Poet;

import java.sql.SQLException;

public interface UserDao {

    Poet findByEmail(String email) throws SQLException;
}
