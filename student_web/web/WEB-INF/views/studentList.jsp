<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<body>

<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header">学生列表</div>
        <div class="layui-card-body">
            <form class="layui-form" action="StudentServlet?method=findByCondationAct" method="post" lay-filter="component-form-element">
                <label class="layui-form-label"> </label>
                <div  style="display:flex;justify-content:center;align-items:center">
                    <input type="text" name="stuno" id="stuno"  placeholder="根据学生学号" autocomplete="off" style="width:180px;" class="layui-input">&emsp;
                    <input type="text" name="sname" id="sname"  placeholder="根据学生姓名查询" autocomplete="off" style="width:180px;" class="layui-input">
                    <button type="submit" id="chaxun" class="layui-btn layui-btn-sm">查询</button>
                    <span style="color:red" class="help-block m-b-none" >${msg}</span>
                </div>
            </form>

            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="150">
                    <col width="150">
                    <col width="150">

                </colgroup>
                <thead>
                <tr>
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

                </tr>
                </thead>
                <tbody>
                <c:forEach items="${studentList}" var="s" >
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

                            <a href="StudentServlet?method=deleteStudentAct&id=${s.id}" class="layui-btn layui-btn-sm layui-btn-danger"><i class="layui-icon">&#xe640;</i></a></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div style="text-align: center">
                <div class="layui-btn-group">

                    <a class="layui-btn layui-btn-primary" href="StudentServlet?method=studentListAct&p=1">首页</a>
                    <%--        判断是否有上一页--%>
                    <c:if test="${cp>1}">
                        <a class="layui-btn layui-btn-primary" href="StudentServlet?method=studentListAct&p=${cp-1}">上一页</a>
                    </c:if>
                    <%--        循环显示页码--%>
                    <c:forEach begin="${cp-2>1 ? (cp-2) :1}" end="${cp+2>tp?tp:(cp+2)}" var="e">
                        <%--            判断是否是当前页--%>
                        <c:if test="${cp==e}">
                            <a class="layui-btn layui-btn-danger" href="StudentServlet?method=studentListAct&p=${e}">${e}</a>
                        </c:if>
                        <c:if test="${cp!=e}">
                            <a class="layui-btn layui-btn-primary" href="StudentServlet?method=studentListAct&p=${e}">${e}</a>
                        </c:if>

                    </c:forEach>

                    <%--        判断是否有下一页--%>
                    <c:if test="${cp<tp}">
                        <a class="layui-btn  layui-btn-primary" href="StudentServlet?method=studentListAct&p=${cp+1}">下一页</a>
                    </c:if>
                    <a class="layui-btn  layui-btn-primary" href="StudentServlet?method=studentListAct&p=${tp}">尾页</a>

                    <a clss="layui-btn" href="StudentServlet?method=studentListAct&p=2">2</a>
                    <a clss="layui-btn" href="StudentServlet?method=studentListAct&p=3">3</a>
                    <a clss="layui-btn" href="StudentServlet?method=studentListAct&p=4">4</a>
                </div>
            </div>

        </div>
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
