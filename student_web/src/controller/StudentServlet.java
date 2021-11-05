package controller;

import dao.StudentDao;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class StudentServlet extends HttpServlet {
    private StudentDao dao=new StudentDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object attribute= request.getParameter("method");
        String method = "";
        if(attribute != null){
            method = attribute.toString();
        }
        //返回学生列表
        if(method!=null&&method.equals("findByConditionAct")) {
            String stuno=request.getParameter("stuno");
            String sname=request.getParameter("sname");
            System.out.print(stuno);
            List<Student> list=dao.findByCondation(stuno,sname);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/WEB-INF/views/listStudent.jsp").forward(request, response);
            return;
        }


        if(method!=null&&method.equals("toAddStudentAct")) {
            request.getRequestDispatcher("/WEB-INF/views/addStudent.jsp").forward(request, response);
            return;
        }

        if(method!=null&&method.equals("studentListAct")) {
            StudentListPage(request,response);
            return;
        }

        //根据id删除成功后返回到主页
        if(method!=null&&method.equals("deleteStudentAct")) {
            int id=Integer.parseInt(request.getParameter("id"));
            System.out.print(id);
            int b=dao.delete(id);
            if(b==1) {
                StudentListPage(request,response);
            }else {
                StudentListPage(request,response);
            }

        }


        //根据id查询实体属性
        if(method!=null&&method.equals("queryStudentAct")) {
            int id=Integer.parseInt(request.getParameter("id"));

            Student record=dao.findById(id);
            request.setAttribute("list", record);
            request.getRequestDispatcher("/WEB-INF/views/updateStudent.jsp").forward(request, response);
            return;
        }
        if(method!=null&&method.equals("addStudentAct")) {
            String stuno=request.getParameter("stuno");
            String sname=request.getParameter("sname");
            String sclass=request.getParameter("sclass");
            String sex=request.getParameter("sex");
            int age=Integer.parseInt(request.getParameter("age"));
            String level=request.getParameter("level");
            String phone=request.getParameter("phone");
            String political=request.getParameter("political");
            String qq=request.getParameter("qq");
            Student record=new Student();
            record.setStuno(stuno);
            record.setSname(sname);
            record.setSclass(sclass);
            record.setSex(sex);
            record.setAge(age);
            record.setLevel(level);
            record.setPhone(phone);
            record.setPolitical(political);
            record.setQq(qq);
            boolean b=dao.insertStudent(record);
            if(b){//成功就返回到登陆界面
                StudentListPage(request, response);
            }else {
                StudentListPage(request, response);
            }

            return;
        }

        if(method!=null&&method.equals("updateStudentAct")) {
            int id=Integer.parseInt(request.getParameter("id"));
            String stuno=request.getParameter("stuno");
            String sname=request.getParameter("sname");
            String sclass=request.getParameter("sclass");
            String sex=request.getParameter("sex");
            int age=Integer.parseInt(request.getParameter("age"));
            String level=request.getParameter("level");
            String phone=request.getParameter("phone");
            String political=request.getParameter("political");
            String qq=request.getParameter("qq");
            Student record=new Student();
            record.setStuno(stuno);
            record.setSname(sname);
            record.setSclass(sclass);
            record.setSex(sex);
            record.setAge(age);
            record.setLevel(level);
            record.setPhone(phone);
            record.setPolitical(political);
            record.setQq(qq);

            boolean b=dao.updateStudent(record, id);
            if(b){//成功就返回到登陆界面
                StudentListPage(request, response);
            }else {
                StudentListPage(request, response);
            }

            return;
        }

    }
//显示学生信息
    private void StudentListPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String p=request.getParameter("p");//接收页码
        System.out.println(p);
        int pageSize=6;//每页显示5条
        int pageNum=1; //默认第一页
        if(p!=null){
            pageNum= Integer.parseInt(p);
        }
        //调用分页查询
        List<Student> bList=dao.getPage(pageNum,pageSize);
        //携带参数到页面
        request.setAttribute("studentList",bList); //绑定参数
        int nums=dao.count(); //查询总数
        //计算总页数
        int totalPage=(nums%pageSize==0)? (nums/pageSize):(nums/pageSize+1);
        request.setAttribute("cp",pageNum); //当前页
        request.setAttribute("tp",totalPage); //总页数
        //条件 值1：值2
        request.getRequestDispatcher("/WEB-INF/views/studentList.jsp").forward(request,response); //页面转发
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
