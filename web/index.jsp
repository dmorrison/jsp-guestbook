<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.*" %>

<%
    Repository repo = new Repository(application);
    List<Post> posts = repo.getPosts();
    String stop = "Stop!";
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
                        <div class="box"><div class="box2">
                            <h4><a href="#">Welcome To Our Website</a></h4><br />
                            <p><%= new AccountManager().getMessage() %></p>
                            <p><%= posts.get(0).getMessage() %></p>
                            <p>This website template is released under  a Creative Commons Attribution 2.5 License</p>
                            <p>We request you retain the full copyright notice below including the link to www.metamorphozis.com.<br />
                                This not only gives respect to the large amount of time given freely by the developers
                                but also helps build interest, traffic and use of our free and paid designs. If you cannot (for good
                                reason) retain the full copyright we request you at least leave in place the
                                Website Templates line, with Website Templates  linked to www.metamorphozis.com. If you refuse
                                to include even this then support may be affected.<br />
                                <br />
                                You are allowed to use this design only if you agree to the following conditions:<br />
                                - You cannot remove copyright notice from this design without our permission.<br />
                                - If you modify this design it still should contain copyright because it is based on our work.<br />
                                - You may copy, distribute, modify, etc. this template as long as link to our website remains untouched.<br />
                                For support visit <a href="http://www.metamorphozis.com/contact/contact.php">http://www.metamorphozis.com/contact/contact.php</a><br />
                                <br />
                            The Metamorphosis Design : 2008 </p>
                            <p class="date">
                                <img src="images/timeicon.gif" alt="Clock Icon" />
                                March 31, 2009 at 3:31 PM
                            </p>
                        </div></div>
                        <div class="box"><div class="box2">
                            <h4><a href="#">Web Design Starter's Guide</a></h4><br />
                            <ol>
                                <li><a href="http://www.metamorphozis.com/free_templates/free_templates.php">More Free Website Templates</a></li>
                                <li><a href="http://www.metamorphozis.com/shop/flash_templates.php">Flash Templates</a></li>
                                <li><a href="http://www.metamorphozis.com/website_hosting/index.php">Top Hosting Providers</a></li>
                                <li><a href="http://www.metamorphozis.com/contact/contact.php">Support For Free Website Templates</a></li>

                            </ol>
                            <p class="date"><img src="images/comment.gif" alt="" /> <a href="#">Comments(34)</a> <img src="images/timeicon.gif" alt="" /> 22.04.</p>
                        </div></div>
                        <div class="box"><div class="box2">
                            <h4><a href="#">SAMPLE ADVERTISEMENT BANNER</a></h4>
                            <p><a href="http://www.metamorphozis.com/software_development/software_development.php"><img src="images/software.gif" alt="Metamorphosis Design Webmaster's Kit" /></a></p>
                            <br />
                            <p>Consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat.</p>
                            <p>Sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autemr in hendrerit in vulputate velit esse molestie consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat...</p>
                            <p class="date"><img src="images/comment.gif" alt="" /> <a href="#">Comments(8)</a> <img src="images/timeicon.gif" alt="" /> 13.46.</p>
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