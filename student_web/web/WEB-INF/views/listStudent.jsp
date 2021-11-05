<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<body>
<div class="card mb-3">
    <div class="card-header">
        <!--   <i class="fas fa-table"></i> -->

    <div class="card-body">
        <a href="StudentServlet?method=studentListAct" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">返回列表</i></a>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>班级</th>
                    <th>年级</th>
                    <th>注册时间</th>
                    <th>性别</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="s" items="${list }">
                    <tr>
                        <td>${s.stuno }</td>
                        <td>${s.sname }</td>
                        <td>${s.age }</td>
                        <td>${s.sclass }</td>
                        <td>${s.level }</td>
                        <td>${s.political}</td>
                        <td>
                            <c:choose>
                                <c:when test="${s.sex==1}">
                                    男
                                </c:when>
                                <c:otherwise>
                                    女
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td>

                            <a href="StudentServlet?method=queryStudentAct&id=${s.id}" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe642;</i></a>

                            <a href="javascript:deleteStudent(${s.id});" <%--href="StudentServlet?method=deleteStudentAct&id=${s.id}" --%>class="layui-btn layui-btn-sm layui-btn-danger"><i class="layui-icon">&#xe640;</i></a></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    ${message}


</div>
</div>
<script>

$(function(){
        $("a.layui-btn-danger").click(function () {

            return confirm("你确定删除学号为["+$(this).parent().parent().find("td:first").text()+"]这条记录吗");
        })

});


</script>

   

      
</body>
</html>