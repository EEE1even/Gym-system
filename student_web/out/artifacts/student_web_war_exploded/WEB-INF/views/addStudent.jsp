<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>

<body background="../../static/images/图书馆.JPG">
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-4">
      <div class="card">
        <div class="card-body">
          <form method="post" action="StudentServlet?method=addStudentAct" method="post" class="site-form">
            <div class="form-group">
              <label for="stuno">学号</label>
              <input type="text" class="form-control" name="stuno" id="stuno"  value=""   required="required"    placeholder="请输入学号">
            </div>

            <div class="form-group">
              <label for="sname">姓名</label>
              <input type="text" class="form-control" name="sname" id="sname"  value=""   required="required"    placeholder="请输入姓名">
            </div>

            <div class="form-group">
              <label for="sname">年龄</label>
              <input type="text" class="form-control" name="age" id="age"  value=""   required="required"    placeholder="请输入年龄">
            </div>



            <div class="form-group">
              <label for="sex">请选择年级</label>
              <div>
                <select class="form-control" id="level" name="level" size="1">
                  <option value="大一">大一</option>
                  <option value="大二">大二</option>
                  <option value="大三">大三</option>
                  <option value="大四">大四</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label for="sclass">班级</label>
              <input type="text" class="form-control" name="sclass" id="sclass"  value=""   required="required"    placeholder="请输入班级">
            </div>


            <div class="form-group">
              <label for="qq">QQ邮箱</label>
              <input type="text" class="form-control" name="qq" id="qq"  value=""   required="required"    placeholder="请输入QQ邮箱">
            </div>

            <div class="form-group">
              <label for="phone">联系方式</label>
              <input type="text" class="form-control" name="phone" id="phone"   value=""   required="required"    placeholder="请输入联系方式">
            </div>




            <div class="form-group">
              <label for="sex">请选择性别</label>
              <div>
                <select class="form-control" id="sex" name="sex" size="1">
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>
              </div>
            </div>

            <div class="form-group">
              <label for="political">注册时间</label>
              <input type="text" class="form-control" name="political" id="political"   value=""   required="required"    placeholder="请输入注册时间">
            </div>




            <button type="submit" class="btn btn-primary">确认添加</button>
            <a href="StudentServlet?method=studentListAct" class="btn btn-info">取消操作</a>
          </form>

        </div>
      </div>
    </div>

  </div>



</div>
</body>
</html>