package com.codecool.web.dao.database;

import java.sql.Connection;

abstract class AbstractDao {

    final Connection connection;

    AbstractDao(Connection connection) {
        this.connection = connection;
    }
}
