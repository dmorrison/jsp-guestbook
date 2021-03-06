package org;

import java.sql.*;
import java.text.*;
import java.util.Date;
import java.util.List;
import java.util.Vector;

public class Repository {
    private String dbPath;

    public Repository(String dbPath) {
        this.dbPath = dbPath;
    }

    public List<User> getUsers() throws ClassNotFoundException, SQLException, ParseException {
        Vector<User> users = new Vector<User>();

        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery("select * from users;");
        while (rs.next()) {
            User user = new User();

            user.setId(Integer.parseInt(rs.getString("id")));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));

            users.add(user);
        }
        rs.close();

        conn.close();

        return users;
    }

    public User getUser(String username) throws ClassNotFoundException, SQLException {
        User user = new User();

        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery(
                "select * from users where username='" + username + "';");
        rs.next();
        user.setId(Integer.parseInt(rs.getString("id")));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        rs.close();

        conn.close();

        return user;
    }

    public void createUser(String username, String password) throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        stat.executeUpdate("insert into users " +
                          "(username, password) values " +
                          "('" + username + "', '" + password + "');");

        conn.close();
    }

    public List<Post> getPosts() throws SQLException, ClassNotFoundException, ParseException {
        Vector<Post> posts = new Vector<Post>();

        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery(
                "select *, " +
                "       (select username from users where rowid=userId) as username " +
                "from posts " +
                "order by timestamp desc;");
        while (rs.next()) {
            Post post = new Post();

            post.setUsername(rs.getString("username"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
            Date timestamp = sdf.parse(rs.getString("timestamp"));
            post.setTimestamp(timestamp);

            post.setMessage(rs.getString("message"));

            posts.add(post);
        }
        rs.close();

        conn.close();
        
        return posts;
    }

    public void createPost(int userId, String message) throws ClassNotFoundException, SQLException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbPath);
        Statement stat = conn.createStatement();

        stat.executeUpdate("insert into posts " +
                          "(userId, message) values " +
                          "(" + userId + ", '" + message + "');");

        conn.close();
    }
}