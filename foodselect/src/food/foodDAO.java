package food;


import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import food.food;
import user.User;

public class foodDAO {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	public foodDAO() {
		try {
			System.out.println("1");
			String dbURL = "jdbc:mysql://localhost:3306/food?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String dbID = "root";
			String dbPassword = "tmdwls1523";		// 비밀번호는 따로 파일을 만들어서 보관하는 것이 좋음
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			System.out.println("sql 문제니");
			e.printStackTrace(); 
		}
	}
	
	
	
public ArrayList<food> getList(int pageNumber, String ab) {
		
		
		String SQL = "SELECT * FROM (SELECT * FROM FP WHERE foodCate = ? ) t order by foodID DESC limit ?, 4;";	

		System.out.println("cone");
		
		
		ArrayList<food> list = new ArrayList<food>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ab);
			pstmt.setInt(2, (pageNumber - 1) * 4); // 0~ 4
			rs = pstmt.executeQuery();
			while (rs.next()) {
				food food = new food();
				food.setfoodID(rs.getInt(1));
				food.setfoodTitle(rs.getString(2)); 
				food.setfoodContent(rs.getString(3));
				food.setfoodPhoto(rs.getString(4));
				food.setfoodCate(rs.getString(5));
				food.setfoodWhere(rs.getString(6));
				food.setfoodIntro(rs.getString(7));		// 여기보면 지금 food Info 까지만 받고 있어요 네 잠시만요!
				food.setfoodValue(rs.getInt(8));
				food.setfoodPerson(rs.getInt(9));
				food.setfoodMenu(rs.getString(10));
				food.setfoodPlace(rs.getString(11));
				list.add(food);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}	

public ArrayList<food> getWhere(int pageNumber, String ab) {
	
	
	String SQL = "SELECT * FROM (SELECT * FROM FP WHERE foodWhere = ? ) t order by foodID DESC limit ?, 4;";	

	
	
	
	ArrayList<food> list = new ArrayList<food>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, ab);
		pstmt.setInt(2, (pageNumber - 1) * 4); // 0~ 4
		rs = pstmt.executeQuery();
		while (rs.next()) {
			food food = new food();
			food.setfoodID(rs.getInt(1));
			food.setfoodTitle(rs.getString(2)); 
			food.setfoodContent(rs.getString(3));
			food.setfoodPhoto(rs.getString(4));
			food.setfoodCate(rs.getString(5));
			food.setfoodWhere(rs.getString(6));
			food.setfoodIntro(rs.getString(7));		// 여기보면 지금 food Info 까지만 받고 있어요 네 잠시만요!
			food.setfoodValue(rs.getInt(8));
			food.setfoodPerson(rs.getInt(9));
			food.setfoodMenu(rs.getString(10));
			food.setfoodPlace(rs.getString(11));
			list.add(food);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}	
	

public food getfood(int foodID) {
	
	String SQL = "SELECT * FROM FP WHERE foodID = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, foodID);
		//System.out.println("여기 에러입니까??");
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			food food = new food();
			food.setfoodID(rs.getInt(1));
			food.setfoodTitle(rs.getString(2)); 
			food.setfoodContent(rs.getString(3));
			food.setfoodPhoto(rs.getString(4));
			food.setfoodCate(rs.getString(5));
			food.setfoodWhere(rs.getString(6));
			food.setfoodIntro(rs.getString(7));
			food.setfoodValue(rs.getInt(8));
			food.setfoodPerson(rs.getInt(9));
			food.setfoodMenu(rs.getString(10));
			food.setfoodPlace(rs.getString(11));
			return food;

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}
	
	
public int update(int foodID, int foodValue) {
	int food_value = 0;
	int ab=0;
	String SQL = "SELECT * FROM FP WHERE foodID = ?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, foodID);
		//System.out.println("여기 에러입니까??");
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			food_value = rs.getInt(8);
			ab=rs.getInt(9);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	ab+=1;
	food_value += foodValue;
	
	String SQL1 = "UPDATE FP SET foodValue = ?, foodPerson=? WHERE foodID = ?";
	try {
		
		PreparedStatement pstmt = conn.prepareStatement(SQL1);
		pstmt.setInt(1, food_value);
		pstmt.setInt(2, ab);
		pstmt.setInt(3, foodID);
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
		return -1; 
	}
}
	



public ArrayList<food> getSerch(int pageNumber, String ab,String ac) {
	
	
	String SQL = "SELECT * FROM (SELECT * FROM FP WHERE foodCate = ? AND foodWhere = ? ) t order by foodID DESC limit ?, 4;";	

	System.out.println("cone");
	
	
	ArrayList<food> list = new ArrayList<food>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, ab);
		pstmt.setString(2, ac);
		pstmt.setInt(3, (pageNumber - 1) * 4); // 0~ 4
		rs = pstmt.executeQuery();
		while (rs.next()) {
			food food = new food();
			food.setfoodID(rs.getInt(1));
			food.setfoodTitle(rs.getString(2)); 
			food.setfoodContent(rs.getString(3));
			food.setfoodPhoto(rs.getString(4));
			food.setfoodCate(rs.getString(5));
			food.setfoodWhere(rs.getString(6));
			food.setfoodIntro(rs.getString(7));		
			food.setfoodValue(rs.getInt(8));
			food.setfoodPerson(rs.getInt(9));
			food.setfoodMenu(rs.getString(10));
			food.setfoodPlace(rs.getString(11));
			list.add(food);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}	

public String getDate() 
{
    String SQL = "SELECT NOW()"; 
    try {
        PreparedStatement pstmt = conn.prepareStatement(SQL);
        rs = pstmt.executeQuery();
        if(rs.next()) {
            return rs.getString(1);
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    return ""; 
}


public int write(int foodID, String userID, String Content) {
	String SQL = "INSERT INTO PT VALUES(?,?,?,?,?)";

	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, foodID);
		pstmt.setString(2, userID);
		pstmt.setString(3, getDate());
		pstmt.setString(4, Content);
		pstmt.setInt(5, 1);
		
		
		
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1; 
}

public int jjimadd(String userID, int foodID) {
	String SQL = "INSERT INTO jjim VALUES(?,?)";

	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		pstmt.setInt(2, foodID);
		
		
		
		
		return pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1; 
}

public int jjimgoing(String userID, int foodID) {
	String SQL = "SELECT COUNT(*) FROM jjim WHERE userID= ? AND foodID = ?;";

	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		pstmt.setInt(2, foodID);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public int jjimex(String userID, int foodID) {
	String SQL = "DELETE  FROM jjim WHERE userID = ? AND foodID = ?; ";

	try {

		PreparedStatement pstmt = conn.prepareStatement(SQL);   

		pstmt.setString(1, userID);
		pstmt.setInt(2, foodID);
		

		return pstmt.executeUpdate();



	} catch (Exception e) {

		e.printStackTrace();

	}

	return -1; 

}

public ArrayList<jjim> getjjim(String userID) {
	String SQL = "SELECT * FROM jjim WHERE userID = ?; ";

	ArrayList<jjim> list = new ArrayList<jjim>();
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			jjim ac = new jjim();
			ac.setuserID(rs.getString(1)); 
			ac.setfoodID(rs.getInt(2));
			
			
			list.add(ac);
		}
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	
	return list;
}	



public ArrayList<pt> getpt(int foodID) {
	
	
	String SQL = "SELECT * FROM (SELECT * FROM PT WHERE foodID = ? ) t order by foodID DESC ";	

	System.out.println("cone");
	
	
	ArrayList<pt> list = new ArrayList<pt>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setInt(1, foodID);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			pt pt= new pt();
			pt.setfoodID(rs.getInt(1));
			pt.setuserID(rs.getString(2));
			pt.setdate(rs.getString(3));
			pt.setcontent(rs.getString(4));
			pt.setAvailable(rs.getInt(5));
			list.add(pt);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}	

	


public ArrayList<food> getgrade(int pageNumber, double min, double max) {
	
	
	String SQL = "SELECT * FROM (SELECT * FROM FP WHERE ? < round(foodValue/foodPerson,1) AND round(foodValue/foodPerson,1) <= ?)  t order by foodID DESC limit ?, 4;";	
	System.out.println("cone");
	
	
	ArrayList<food> list = new ArrayList<food>();
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setDouble(1, min);
		pstmt.setDouble(2, max);
		pstmt.setInt(3, (pageNumber - 1) * 4); // 0~ 4
		rs = pstmt.executeQuery();
		while (rs.next()) {
			food food = new food();
			food.setfoodID(rs.getInt(1));
			food.setfoodTitle(rs.getString(2)); 
			food.setfoodContent(rs.getString(3));
			food.setfoodPhoto(rs.getString(4));
			food.setfoodCate(rs.getString(5));
			food.setfoodWhere(rs.getString(6));
			food.setfoodIntro(rs.getString(7));		// 여기보면 지금 food Info 까지만 받고 있어요 네 잠시만요!
			food.setfoodValue(rs.getInt(8));
			food.setfoodPerson(rs.getInt(9));
			food.setfoodMenu(rs.getString(10));
			food.setfoodPlace(rs.getString(11));
			list.add(food);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return list;
}	

public int getrating(double min, double max) {
	
	String SQL = "SELECT COUNT(1) FROM FP WHERE ? < round(foodValue/foodPerson,1) AND round(foodValue/foodPerson,1) <= ? ;";	
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setDouble(1, min);
		pstmt.setDouble(2, max);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}


public int getNext() {
	
	String SQL = "SELECT foodID FROM FP ORDER BY foodID DESC";  // 내림차순
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}


public int getcate(String cap) {
	
	String SQL = "SELECT COUNT(1) FROM FP WHERE foodCate = ?;";	
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, cap);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public int getdoor(String cap) {
	
	String SQL = "SELECT COUNT(1) FROM FP WHERE foodWhere = ?;";	
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, cap);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}

public int getserchnumber(String cap ,String pla) {
	
	String SQL = "SELECT COUNT(1) FROM FP WHERE foodCate = ? AND foodWhere=?;";	
	
	try {
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, cap);
		pstmt.setString(2, pla);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1); 
		}
		return 1; 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return -1;
}


public int join(food food) {
	String SQL = "INSERT INTO STD VALUES (?,?,?,?)";
	try {
		
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, food.getfoodTitle());
		pstmt.setString(2, food.getfoodContent());
		pstmt.setString(3, food.getfoodPlace());
		pstmt.setString(4, food.getfoodCate());
		return pstmt.executeUpdate();
	} catch (Exception e) {
		System.out.println("4");
		e.printStackTrace();
	}
	return -1; 
}


}
