package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;


public class C3p0Utils {
	private static DataSource ds;
	static{
		ds=new ComboPooledDataSource();

	}
	public static DataSource getDs(){
		return ds;
	}
    //获取数据库连接
	public static Connection getConnection() throws SQLException{
		return ds.getConnection();
	}
	//c3p0连接测试
	public static void main(String args[]) throws SQLException {
		System.out.println(new C3p0Utils().getConnection()+"mysql is ok");
	}
}
