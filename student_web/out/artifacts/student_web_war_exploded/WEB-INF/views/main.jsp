<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
</head>
<body class="layui-layout-body" background="../../static/images/2020.10.22图书馆1.JPG">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">学校健身房管理系统</div>


    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">

          ${account}
        </a>

      </li>
      <li class="layui-nav-item"><a href="UserServlet?method=loginOutAct">退出</a></li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">

    <div class="layui-side-scroll">

      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

      <ul class="layui-nav layui-nav-tree"  lay-filter="test">

        <li class="layui-nav-item layui-nav-itemed">

          <a class="" href="javascript:;">学生管理</a>

          <dl class="layui-nav-child">

            <dd><a href="StudentServlet?method=studentListAct" target="mainFrame">学生列表</a></dd>

            <dd><a href="StudentServlet?method=toAddStudentAct" target="mainFrame">添加学生</a></dd>

          </dl>

        </li>
        <li class="layui-nav-item layui-nav-itemed">

          <a class="" href="javascript:;">系统管理</a>

          <dl class="layui-nav-child">

            <dd><a href="UserServlet?method=toUpdateAdminPwdAct&account=${account}" target="mainFrame">修改密码</a></dd>

          </dl>

        </li>



      </ul>

    </div>

  </div>

  <div class="layui-body">
    <iframe src="UserServlet?method=toConsoleAct" style="/* margin-top:100px; */" id="mainFrame" name="mainFrame" frameborder="0" width="100%"  height="800px" frameBorder="0"></iframe>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
  </div>
</div>

<script src="layui/layui.all.js"></script>
<script>

  layui.use('element', function(){

            var element = layui.element; //
            element.init();
  });
</script>
</body>
</html>