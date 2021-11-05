package dao;
import entity.Admin;
import org.apache.commons.dbutils.QueryRunner; //数据库
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.List;

//Dao 数据访问对象
public class AdminDao {
	//获取连接执行查询
			private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());

			//用户注册
			public boolean insertAdmin(Admin admin) {
				try {
					//执行插入sql
					runner.update("insert into admin(account,pwd,type)values(?,?,?)",
							admin.getAccount(),admin.getPwd(),admin.getType());
				} catch (SQLException e) {
					throw new RuntimeException(e);
				}
				return true;//成功返回true


				
			}

			public List<Admin> findAll() {
				try {
					return runner.query("select * from admin", new BeanListHandler<Admin>(Admin.class));//添加实体类的适配器进行类的反射
				} catch (SQLException e) {//捕获异常
					throw new RuntimeException(e);//抛出运行异常
				}

			}



		//根据账号查询所密码
		public Admin findByAcccount(String account) {
		try {
			return runner.query("select * from admin where account=?", new BeanHandler<Admin>(Admin.class),account);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		}


			public boolean updateAdminPwd(Admin admin,String account) {
				try {//执行更改
					runner.update("update admin set pwd=? where account=?",
							admin.getPwd(),account);
				} catch (SQLException e) {
					throw new RuntimeException(e);//抛出运行异常
				}


				return true;//返回true
			}




			public static void main(String args[]) {

			}
			
	
			
}
