<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/common/header.jsp"/>
<body background="../../static/images/2020.10.22桥柱子.JPG">

  <div class="container" style="margin:100px auto;width: 400px;color:#0C0C0C">
  		<h3 style="color:#000;text-align: center;">管理员注册界面</h3>
        <form action="UserServlet?method=registeAct" method="post" onSubmit="return checkForm()">
	      <div class="form-group">
	        <label for="account">账号</label>
	        <input type="text" name="account"  class="form-control" id="account" placeholder="请输入账号"/>
	      	<span id="msg"></span>
	      </div>
	      
	      <div class="form-group">
	        <label for="pwd">密码</label>
	        <input type="text" name="pwd" class="form-control" id="pwd" placeholder="请输入密码"/>
	      </div>

			<div class="form-group">
				<label for="pwd">确认密码</label>
				<input type="text" name="repwd" class="form-control" id="repwd" placeholder="请输入密码"/>
			</div>
	      
	      
	      <hr/>
	      <div class="form-group" style="text-align: center;">
	        <input class="btn btn btn-primary" id="registe" type="submit"  style="width:370px" value="注册">
		  </div>
	  	</form>
		<a href="UserServlet?method=toLoginAct" class="btn btn btn-primary" style="width:370px">去登录</a>
	
	  	<!-- 提示框 -->
	  	<div>
		${message }
		</div>
  	</div>
</div>

  <script>
	  layui.use([ 'form','jquery','layer' ], function() {
		  var form = layui.form,
				  layer = layui.layer,
				  $= layui.jquery;
		  form.render();//这句一定要加，占坑
		  layer.config({
			  skin: 'demo-class'
		  })
		  $('#registe').click(function(){
			  var $1 = $.trim($('#account').val());
			  var $2 = $.trim($("#pwd").val());
			  var $3 = $.trim($("#repwd").val());

			  if($1 == ''){
				  //$("#msg1").html("用户名不能为空");
				  layer.msg('账号不能为空',function() {time:2000});
				  return false;
			  }
			  if($2 == ''){
				  layer.msg('密码不能为空',function() {time:2000});
				  return false;
			  }
			  if($2 != $3){
				  layer.msg('两次密码不一致!',function() {time:2000});
				  return false;
			  }
		  })
	  });

  </script>


</body>
</html>