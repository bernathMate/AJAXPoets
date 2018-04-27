package com.codecool.web.model;

import java.util.Objects;

public class Poem extends AbstractModel {

    private String title;
    private String content;
    private int publishedDate;

    public Poem(int id, String title, String content, int publishedDate) {
        super(id);
        this.title = title;
        this.content = content;
        this.publishedDate = publishedDate;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getPublishedDate() {
        return publishedDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Poem poem = (Poem) o;
        return publishedDate == poem.publishedDate &&
                Objects.equals(title, poem.title) &&
                Objects.equals(content, poem.content);
    }

    @Override
    public int hashCode() {

        return Objects.hash(super.hashCode(), title, content, publishedDate);
    }
}
