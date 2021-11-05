<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/common/header.jsp"/>
<body background="../../static/images/2020.10.22图书馆1.JPG">
<div class="row lyear-wrapper" >
	<div class="lyear-login">
		<div class="login-center">
			<div class="login-header text-center">
				<a href="index.html"> <h4  style="color: #15c377;">学校健身房管理系统</h4></a>
			</div>
			<form action="UserServlet?method=loginAct" method="post" >
				<div class="form-group has-feedback feedback-left">
					<input type="text" placeholder="请输入用户名" class="form-control" name="account" id="account" />
					<span class="mdi mdi-account form-control-feedback" aria-hidden="true"> </span>
					<span id="msg" style="color:red;"></span>
				</div>
				<div class="form-group has-feedback feedback-left">
					<input type="password" placeholder="请输入密码" class="form-control" id="pwd" name="pwd" />
					<span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
					<span id="msg2" style="color:red;"></span>
				</div>

				<font  color="red">${message}</font>
				<div class="form-group"><!-- onclick="location.href='index.html'" -->
					<button class="btn btn-block btn-primary" type="submit" id="login"  >登 录</button>

				</div>
			</form>
			<button class="btn btn-block btn-primary" type="button" onclick="location.href='UserServlet?method=toRegisteAct'">注 册</button>
			<hr>
			<footer class="col-sm-12 text-center">
			</footer>
		</div>
	</div>
</div>
<script src="/layui/layui.js"></script>
<script>
	layui.use([ 'form','jquery','layer' ], function() {
		var form = layui.form,
				layer = layui.layer,
				$= layui.jquery;
		form.render();//占坑
		layer.config({
			skin: 'demo-class'
		})
		$('#login').click(function(){
			var $1 = $.trim($('#account').val());
			var $2 = $.trim($("#pwd").val());
			if($1 == ''){
				//$("#msg1").html("用户名不能为空");
				layer.msg('账号不能为空',function() {time:2000},{icon: 1});
				return false;
			}
			if($2 == ''){
				layer.msg('密码不能为空',function() {time:2000},{icon: 5});
				return false;
			}
		})
	});

</script>
</body>
</html>