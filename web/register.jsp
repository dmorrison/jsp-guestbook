<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="org.*" %>
<%@ page import="java.util.*" %>

<%
String error = "";
if (session.getAttribute("error") != null) {
    error = session.getAttribute("error").toString();
    session.removeAttribute("error");
}

String status = "";
if (session.getAttribute("status") != null) {
    status = session.getAttribute("status").toString();
    session.removeAttribute("status");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>COMP 6006 Guestbook - Register</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="styles.css" rel="stylesheet" type="text/css" />
    </head>

    <body>        
        <div id="contmain">
            
            <div id="account"><div id="account2">
                <div id="logIn">
                    <% if (session.getAttribute("username") == null) { %>
                    <form action="accountmanager" method="post">
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
                <div id="messages">
                    <span class="error"><%= error %></span>
                    <span class="status"><%= status %></span>
                </div>
                <div id="registerLogOut">
                    <% if (session.getAttribute("username") == null) { %>
                    <a href="register.jsp">Register</a>
                    <% } else { %>
                    <form action="accountmanager" method="post">
                        <input type="submit" value="Log Out"
                            name="logOut" id="logOut" />
                    </form>
                    <% } %>
                </div>
            </div></div>

            <div id="main">

                <div id="header">
                    <div id="logo">
                        <h1><a href="index.jsp">COMP 6006 Guestbook</a></h1>
                    </div>
                </div>

                <div id="page">
                    <div id="content">
                        <form action="accountmanager" method="post">
                            <table>
                                <tr>
                                    <td>
                                        <label for="username">Username:</label>
                                    </td>
                                    <td>
                                        <input type="text" name="username" id="username" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="password">Password:</label>
                                    </td>
                                    <td>
                                        <input type="password" name="password" id="password" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="password">Confirm Password:</label>
                                    </td>
                                    <td>
                                        <input type="password" name="confirmPassword"
                                            id="confirmPassword" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" name="register" id="register"
                                            value="Register" />
                                    </td>
                                </tr>
                            </table>
                        </form>
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