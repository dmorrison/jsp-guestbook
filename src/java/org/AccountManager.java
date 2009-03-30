package org;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountManager extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        Repository repo = new Repository(
                getServletContext().getRealPath("guestbook.sqlite"));

        // Handle log in.
        if (request.getParameter("logInButton") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            List<User> users = repo.getUsers();
            for (User u : users) {
                if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                    request.getSession().setAttribute("username", username);
                }
            }
            if (request.getSession().getAttribute("username") == null) {
                request.getSession().setAttribute(
                        "error", "Invalid username or password.");
            }

            response.sendRedirect("index.jsp");
        }

        // Handle log out.
        if (request.getParameter("logOut") != null) {
            request.getSession().removeAttribute("username");
            response.sendRedirect("index.jsp");
        }

        // Handle register user.
        if (request.getParameter("register") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            if (username.equals("") || password.equals("") || confirmPassword.equals("")) {
                request.getSession().setAttribute(
                        "error", "Please enter all fields.");
                response.sendRedirect("register.jsp");
            } else if (!password.equals(confirmPassword)) {
                request.getSession().setAttribute(
                        "error", "Passwords do not match.");
                response.sendRedirect("register.jsp");
            } else {
                // Check if username already exists.
                List<User> users = repo.getUsers();
                boolean usernameExists = false;
                for (User u : users) {
                    if (u.getUsername().equals(username)) {
                        usernameExists = true;
                    }
                }

                if (usernameExists) {
                    request.getSession().setAttribute(
                        "error", "Username already exists.");
                    response.sendRedirect("register.jsp");
                } else {
                    repo.createUser(username, password);
                    request.getSession().setAttribute("status", "Account created.");
                    response.sendRedirect("index.jsp");
                }
            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(AccountManager.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Account manager";
    }// </editor-fold>

}
