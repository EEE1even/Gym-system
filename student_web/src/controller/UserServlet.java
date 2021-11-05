package controller;

import dao.AdminDao;
import entity.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserServlet extends HttpServlet {
private AdminDao dao=new AdminDao();
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Object attribute= request.getParameter("method");
    String method = "";
    if(attribute != null){
        method = attribute.toString();
    }
    if(method.equals("registeAct")) {
        registeAdmin(request,response);
        return;
    }

    if(method.equals("toUpdateAdminPwdAct")) {
        String account=request.getParameter("account");

        Admin record=dao.findByAcccount(account);
        request.setAttribute("list", record);
        request.getRequestDispatcher("/WEB-INF/views/updatePwd.jsp").forward(request, response);
        return;

    }

    if(method.equals("updateAdminAct")) {
        String account=request.getParameter("account");
        String pwd=request.getParameter("pwd");
        Admin admin=new Admin();
        admin.setAccount(account);
        admin.setPwd(pwd);
        boolean b=dao.updateAdminPwd(admin,account);
        //request.setAttribute("list", record);
        request.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(request, response);

        return;

    }


    //接受登录请求
    if(method.equals("loginAct")) {
        String account=request.getParameter("account");
        String pwd=request.getParameter("pwd");

        Admin user=dao.findByAcccount(account);

        if(user==null){
            request.setAttribute("message", "用户不存在");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }else if(!user.getPwd().equals(pwd)){
            request.setAttribute("message", "密码不正确");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);

        }else  {
            //将需要的信息传入
            request.getSession().setAttribute("type", user.getType());
            request.getSession().setAttribute("account", user.getAccount());
            request.getSession().setAttribute("id", user.getId());

            request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
        }
        return;
    }

    //注销
    if(method.equals("loginOutAct")) {
        request.getSession().removeAttribute("account");
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        return;
    }

    //去登陆
    if(method.equals("toLoginAct")) {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        return;
    }
    //去注册
    if(method.equals("toRegisteAct")) {
        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        return;
    }

    //去控制台
    if(method.equals("toConsoleAct")) {

        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request, response);
        return;
    }


}
//处理注册请求
private void registeAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String account=request.getParameter("account");
    String pwd=request.getParameter("pwd");
    Admin admin=new Admin();
    admin.setAccount(account);
    admin.setPwd(pwd);
    admin.setType("管理员");

    boolean b=dao.insertAdmin(admin);
    if(b){
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

}

//处理doGet转发到Post请求
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
}
}
