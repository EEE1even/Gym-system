package dao;

import entity.Student;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.C3p0Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class StudentDao {
	//获取连接执行查询
	private QueryRunner runner=new QueryRunner(C3p0Utils.getDs());
	//用户注册
	public boolean insertStudent(Student student) {
		try {
			//执行插入sql
			runner.update("insert into student(stuno,sname,sclass,sex,political,age,level,phone,qq)values(?,?,?,?,?,?,?,?,?)",
					student.getStuno(),student.getSname(),student.getSclass(),student.getSex(),student.getPolitical(),
					student.getAge(),student.getLevel(),student.getPhone(),student.getQq());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return true;//成功返回true



	}

	//根据id删除学生
	public int delete(int id) {
		try {
			//执行删除的sql
			runner.update("delete from student where id=?",id);
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}

		return 1;//删除成功返回1表示结束
	}

	//多条件查询
	public List<Student> findByCondation(String stuno,String sname) {
		try {
			String sql = "select * from student where 1=1 ";
	        //创建一个集合用来存储查询的参数，因为不清楚到底输入几个参数，所以用集合来存放
	        List<String> list = new ArrayList<String>();
	        if (stuno != "") {
	            //如果用户输入的pname不为空，那需要进行字符串拼接
	            sql += "and stuno like ? ";
	            //将用户输入的参数添加到集合
	            list.add("%" + stuno + "%");
	        }
	        if(sname!=""){
	        	sql+="and sname like ?";
	        	list.add("%"+sname+"%");

			}
	        //最后将集合转化成数组
	        Object[] params = list.toArray();
	        //调用runner对象的query查询方法，并将集合返回
	        return runner.query(sql, new BeanListHandler<Student>(Student.class), params);
		} catch (SQLException e) {//捕获异常
			throw new RuntimeException(e);//抛出运行异常
		}

	}



	//查询所有学生分页
	public List<Student> getPage(int pageNum, int pageSize) {
		String sql="select * from student limit ?,?";
		int startNo=(pageNum-1)*pageSize;
		List<Student> list=null;
		try {
			list= runner.query(sql, new BeanListHandler<Student>(Student.class),new Object[] {startNo,pageSize});//添加实体类的适配器进行类的反射
		return list;
		} catch (SQLException e) {//捕获异常
			throw new RuntimeException(e);//抛出运行异常
		}

	}

	//获取学生数量
	public int count() {
		  String sql="select count(*) from student";
		  try {
			  Long count = (long) runner.query(sql, new ScalarHandler());
			  return count.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}


	//根据id查询
	public Student findById(int id) {
		try {//返回查询的信息
			return runner.query("select * from student where id=?", new BeanHandler<Student>(Student.class),id);
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}


	}

	//根据id更改学生信息
	public boolean updateStudent(Student student,int id) {
		try {//执行更改
			runner.update("update student set stuno=?,sname=?,sclass=?,sex=?,political=?,age=?,level=?,phone=?,qq=? where id=?",
					student.getStuno(),student.getSname(),student.getSclass(),student.getSex(),student.getPolitical(),
					student.getAge(),student.getLevel(),student.getPhone(),student.getQq(),id);
		} catch (SQLException e) {
			throw new RuntimeException(e);//抛出运行异常
		}
		return true;//返回true
	}



	public static void main(String[] args){
		StudentDao dao=new StudentDao();
		List<Student> list=dao.getPage(1,3);
		Iterator<Student> iterator=list.iterator();
		while (iterator.hasNext()){
			System.out.println(iterator.next());
		}


	}

}
