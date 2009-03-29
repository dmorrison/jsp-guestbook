<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.*" %>

<%
Repository repo = new Repository(application);

if (request.getParameter("message") != null) {
    repo.createPost(1, request.getParameter("message"));
}

List<Post> posts = repo.getPosts();
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
            
            <div id="logInWrap"><div id="logInWrap2">
                <form action="index.jsp" method="post">
                    <div id="left">
                        Username
                        <input type="text" id="username" name="username" />
                        Password
                        <input type="password" id="password" name="password" />
                        <input type="submit" value="Log In" id="logIn" />
                    </div>
                    <div id="right">
                        <a href="#">Register</a>
                    </div>
                </form>
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

                        <div class="box"><div class="box2">
                            <h4>Post a Message</h4>
                            <form action="index.jsp" method="post">
                                <textarea name="message" id="message"
                                          cols="100" rows="10">
                                </textarea>
                                <input type="submit" value="Post Message" />
                            </form>
                        </div></div>
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