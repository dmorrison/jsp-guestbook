package org;

import java.sql.*;
import java.util.*;
import javax.servlet.ServletContext;

public class Repository {
    private ServletContext application;

    public Repository(ServletContext application) {
        this.application = application;
    }

    public List<Post> getPosts() throws SQLException, ClassNotFoundException {
        Vector<Post> posts = new Vector<Post>();

        Class.forName("org.sqlite.JDBC");
        String dbpath = application.getRealPath("guestbook.sqlite");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbpath);
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery(
                "select *, " +
                "       (select username from users where rowid=userId) as username " +
                "from posts;");
        while (rs.next()) {
            Post post = new Post();
            post.setUsername(rs.getString("username"));
            post.setTimestamp(rs.getDate("timestamp"));
            post.setMessage(rs.getString("message"));
            posts.add(post);
        }
        rs.close();

        conn.close();
        
        return posts;
    }
}