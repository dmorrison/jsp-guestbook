<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.*" %>

<%
String error = "";

Repository repo = new Repository(application);
List<Post> posts = repo.getPosts();

// Handle log in.
String username = request.getParameter("username");
String password = request.getParameter("password");
if (username != null && password != null) {
    List<User> users = repo.getUsers();
    for (User u : users) {
        if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
            session.setAttribute("username", username);
        }
    }
    if (session.getAttribute("username") == null) {
        error = "Invalid username or password.";
    }
}

// Handle log out.
if (request.getParameter("logOut") != null) {
    session.removeAttribute("username");
}

// Handle create new message.
if (request.getParameter("message") != null) {
    repo.createPost(1, request.getParameter("message"));
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>COMP 6006 Guestbook</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="styles.css" rel="stylesheet" type="text/css" />
    </head>

    <body>        
        <div id="contmain">
            
            <div id="account"><div id="account2">
                <div id="logIn">
                    <% if (session.getAttribute("username") == null) { %>
                    <form action="index.jsp" method="post">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" />
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" />
                        <input type="submit" value="Log In" id="logInButton" name="logInButton" />
                    </form>
                    <% } else { %>
                    Welcome <%= session.getAttribute("username") %>
                    <% } %>
                </div>
                <div id="error">
                    <%= error %>
                </div>
                <div id="registerLogOut">
                    <% if (session.getAttribute("username") == null) { %>
                    <a href="#">Register</a>
                    <% } else { %>
                    <form action="index.jsp" method="post">
                        <input type="submit" value="Log Out"
                            name="logOut" id="logOut" />
                    </form>
                    <% } %>
                </div>
            </div></div>

            <div id="main">

                <div id="header">
                    <div id="logo">
                        <h1>COMP 6006 Guestbook</h1>
                    </div>
                </div>

                <div id="page">
                    <div id="content">
                        <% for (Post post : posts) { %>
                            <div class="box"><div class="box2">
                                <h4><%= post.getUsername() %></h4><br />
                                <p><%= post.getMessage() %></p>
                                <p class="date">
                                    <img src="images/timeicon.gif" alt="Clock Icon" />                                    
                                    <%= new SimpleDateFormat("MMMM d, yyyy h:mm a").format(post.getTimestamp()) %>
                                </p>
                            </div></div>
                        <% } %>

                        <% if (posts.isEmpty()) { %>
                            <p>No messages have been posted yet.</p>
                        <% } %>

                        <% if (session.getAttribute("username") != null) { %>
                        <div class="box"><div class="box2">
                            <h4>Post a Message</h4><br />
                            <form action="index.jsp" method="post">
                                <textarea name="message" id="message"
                                    cols="100" rows="10"></textarea><br />
                                <input type="submit" value="Post Message" />
                            </form>
                        </div></div>
                        <% } %>
                    </div>
                </div>
                
                <div id="footer">
                    <p>&copy; 2009 Derek Morrison</p>
                    <p>Built for COMP 6006 @ Auburn University</p>
                    <p>
                        Design by
                        <a href="http://www.metamorphozis.com/">
                            Metamorphosis Design
                        </a>
                    </p>
                </div>

            </div>

        </div>
    </body>
</html>