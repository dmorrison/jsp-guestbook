<%@ page %>
<%@ page import="java.sql.*" %>

<%
    try {
        Class.forName("org.sqlite.JDBC");
        String dbpath = application.getRealPath("guestbook.sqlite");
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + dbpath);
        Statement stat = conn.createStatement();

        stat.executeUpdate("drop table if exists users;");
        stat.executeUpdate(
                "create table users (" +
                    "id integer primary key, " +
                    "username, " +
                    "password);");

        stat.executeUpdate("insert into users " +
                           "(username, password) values " +
                           "('dsmith', 'password');");
        stat.executeUpdate("insert into users " +
                           "(username, password) values " +
                           "('jarnold', 'password');");

        stat.executeUpdate("drop table if exists posts;");
        stat.executeUpdate(
                "create table posts (" +
                    "userId, " +
                    "timestamp default CURRENT_TIMESTAMP, " +
                    "message);");

        stat.executeUpdate("insert into posts " +
                           "(userId, message) values " +
                           "(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu elit imperdiet neque porttitor volutpat. Etiam nec metus. Curabitur ac urna. Duis feugiat, lectus quis iaculis tempor, est nulla rhoncus tortor, sed venenatis nisl orci eu eros. Aliquam commodo. Sed ac tortor vel nunc hendrerit venenatis. Nunc nec augue. Fusce dui velit, porttitor et, congue quis, commodo ac, mauris. Integer ante. Sed viverra tristique elit. Sed suscipit. Donec nisi arcu, ornare in, rhoncus nec, convallis et, ipsum. Proin nec sem in ligula vulputate volutpat. In sodales tellus non justo. Maecenas vel arcu. Vivamus viverra.');");
        stat.executeUpdate("insert into posts " +
                           "(userId, timestamp, message) values " +
                           "(2, '2009-02-19 17:27:45', 'Morbi metus purus, rhoncus nec, mollis nec, porttitor at, elit. Donec bibendum, ligula non auctor cursus, risus metus sodales lorem, quis hendrerit justo magna tristique felis. Curabitur eget metus. Sed placerat. In dolor lorem, sodales ac, lobortis eu, semper quis, leo. Donec sollicitudin nibh. Vivamus sed augue et sem vestibulum ultricies. Mauris commodo semper tellus. Nulla eros massa, auctor et, suscipit id, hendrerit non, dui. Maecenas mi nunc, ultricies vitae, bibendum non, pulvinar id, elit. Cras tristique, nibh vitae elementum vestibulum, ipsum erat tristique massa, id pretium tortor eros vitae purus. In hac habitasse platea dictumst. Quisque sodales nunc. Pellentesque metus sapien, scelerisque vitae, imperdiet vitae, mattis tincidunt, dui.');");
        stat.executeUpdate("insert into posts " +
                           "(userId, timestamp, message) values " +
                           "(2, '2009-03-01 16:55:25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed turpis. Maecenas a ligula. Vestibulum magna. Aliquam erat volutpat. In ligula. Morbi varius egestas nunc. Sed semper metus vitae purus. Suspendisse tincidunt justo eget sem. Nulla leo magna, scelerisque nec, tristique vel, malesuada a, felis. Aenean interdum tortor et sem. ');");

        out.println("Database setup successfully.");
        
        conn.close();
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>
