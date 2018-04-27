package com.codecool.web.model;

import java.util.Objects;

public class Poet extends AbstractModel{

    private String name;
    private String email;
    private String password;

    public Poet(int id, String name, String email, String password) {
        super(id);
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Poet poet = (Poet) o;
        return Objects.equals(name, poet.name) &&
                Objects.equals(email, poet.email) &&
                Objects.equals(password, poet.password);
    }

    @Override
    public int hashCode() {

        return Objects.hash(super.hashCode(), name, email, password);
    }
}
