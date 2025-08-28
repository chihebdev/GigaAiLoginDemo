package com.gigaai.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.gigaai.model.User;

 
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  	String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        User user = validateUser(username, password);

	        if (user != null) {
	            HttpSession session = request.getSession();
	            
	            
	            session.setAttribute("user", user.getFullName());
	            session.setAttribute("storage", user.getStorage());
	            session.setAttribute("bandwidth", user.getBandwidth());
	            session.setAttribute("max_file_size", user.getMaxFileSize());
	            response.sendRedirect("home.jsp");
	            log("successful login");
	        } else {
	            response.sendRedirect("login.jsp?error=invalid");
	            log("Invalid user");

	        }
	}
	
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        request.getRequestDispatcher("login.jsp").forward(request, response); 
    }
	   
	   
	 private User validateUser(String username, String password) {
		    User user = null;

		 	try {
			    Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			    e.printStackTrace();
			}
		 
	        String dbURL = "jdbc:mysql://database-1.cpqsqsiysvb8.us-east-2.rds.amazonaws.com:3306/gigadb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	        String dbUser = "admin";
	        String dbPass = "*********"; //Should be moved to Secrets Manager in Prod

	        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass)) {
	            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, username);
	            statement.setString(2, password);
	            ResultSet result = statement.executeQuery();
	            if (result.next()) {
	            	user = new User();
	                user.setFullName(result.getString("full_name"));
	                user.setStorage(result.getInt("storage"));
	                user.setBandwidth(result.getInt("bandwidth"));
	                user.setMaxFileSize(result.getInt("max_file_size"));
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        return user;
	    }

}
