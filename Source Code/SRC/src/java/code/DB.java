package code;
import java.sql.*;
public class  DB
{
    public static Connection con;
	public static Connection getConnection() throws ClassNotFoundException , SQLException
	{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_review?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "");

		return con;
	}
	
}
