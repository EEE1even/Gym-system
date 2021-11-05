
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()
            +"://"
            +request.getServerName()
            +":"+
            +request.getServerPort()
            +request.getContextPath()
            +"/";
%>

<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>学校健身房管理系统 </title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="后台管理系统HTML模板">
<meta name="description" content="基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/materialdesignicons.min.css" rel="stylesheet">
<link href="/static/css/style.min.css" rel="stylesheet">
<link href="/static/css/login.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" />
<!--时间选择插件-->
 <link rel="stylesheet" href="/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<script type="text/javascript"  src="/static/layui/layui.js"></script>
<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/static/js/main.min.js"></script>
<script type="text/javascript" src="/static/js/Chart.js"></script>
<!--时间选择插件-->
<script src="/static/js/bootstrap-datetimepicker/moment.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
 <script src="/static/js/bootstrap-datetimepicker/locale/zh-cn.js"></script>
</head>