<%@ page %>
<%@ page import="java.sql.*" %>

<%
    try {
        //Class.forName("org.sqlite.JDBC");
        String dbpath = application.getRealPath("guestbook.sqlite");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbpath);
        Statement stat = conn.createStatement();

        stat.executeUpdate("drop table if exists users;");
        stat.executeUpdate("create table users (username, password);");

        stat.executeUpdate("insert into users values ('dsmith', 'password');");
        stat.executeUpdate("insert into users values ('jarnold', 'password');");

        stat.executeUpdate("drop table if exists posts;");
        stat.executeUpdate(
                "create table posts (" +
                    "userId, " +
                    "timestamp default CURRENT_TIMESTAMP, " +
                    "message);");

        stat.executeUpdate("insert into posts " +
                           "(userId, message) values " +
                           "(1, 'Lorem ipsum');");
        stat.executeUpdate("insert into posts " +
                           "(userId, message) values " +
                           "(2, 'Lorem ipsum dolor secut. Equin colour.');");
        /*PreparedStatement prep = conn.prepareStatement(
                "insert into people values (?, ?);");

        prep.setString(1, "Gandhi");
        prep.setString(2, "politics");
        prep.addBatch();
        prep.setString(1, "Turing");
        prep.setString(2, "computers");
        prep.addBatch();
        prep.setString(1, "Wittgenstein");
        prep.setString(2, "smartypants");
        prep.addBatch();

        conn.setAutoCommit(false);
        prep.executeBatch();
        conn.setAutoCommit(true);*/


        /*ResultSet rs = stat.executeQuery("select * from people;");
        while (rs.next()) {
            out.println("name = " + rs.getString("name"));
            out.println("job = " + rs.getString("occupation") + "<br />");
        }
        rs.close();*/

        out.println("Database setup successfully.");
        
        conn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
