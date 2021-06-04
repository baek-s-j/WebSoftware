package user;
import java.io.Console;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import food.food;


public class UserDAO {
	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;

public UserDAO() {
		try {
			System.out.println("1");		
			String dbURL = "jdbc:mysql://localhost:3306/food?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "tmdwls1523";		
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			System.out.println("2");
			e.printStackTrace(); 
		}
	}
	
public int login(String userID, String userPassword) {
		String SQL = "SELECT password FROM USER WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				if (rs.getString(1).equals(userPassword)) {
					return 1; 
				}else
					return 0; 
			}
			return -1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
		try {
			System.out.println("여기까지오냐?");
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserPassword());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("4");
			e.printStackTrace();
		}
		return -1; 
	}
	
public String pass(String username,String userID) {
		
		String SQL = "SELECT * FROM USER WHERE name = ? AND id= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			System.out.println(username);
			System.out.println(userID);
			
			pstmt.setString(1, username);
			pstmt.setString(2, userID);
			//System.out.println("여기 에러입니까??");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString(4);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
		

public User getinf(String userID) {
	
	String SQL = "SELECT * FROM user WHERE id = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			User user = new User();
			user.setUserName(rs.getString(1));
			user.setUserID(rs.getString(2));
			user.setUserEmail(rs.getString(3));
			return user;

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}
	
}