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
                    <form method="post" action="UserServlet?method=updateAdminAct" method="post" class="site-form">
                          <div class="form-group">
                            <label for="account">账号</label>
                            <input type="text" id="account" readonly value="${list.account}" name="account" class="form-control" placeholder="请输入账号" required="required" >

                        </div>

                        <div class="form-group">
                            <label for="pwd">密码</label>
                            <input type="text" class="form-control" name="pwd" id="pwd"  value="${list.pwd}"   required="required"    placeholder="请输入密码">
                        </div>

                        <div class="form-group">
                            <label for="repwd">确认密码</label>
                            <input type="text" class="form-control" name="repwd" id="repwd"  value=""   required="required"    placeholder="请确认密码">
                        </div>





                        <button type="submit" class="btn btn-primary" id="updatePwd">确认修改</button>
                        <a href="UserServlet?method=toConsoleAct" class="btn btn-info">取消操作</a>
                    </form>

                </div>
            </div>
        </div>

    </div>



</div>

<script src="/layui/layui.js"></script>
<script>
    layui.use([ 'form','jquery','layer' ], function() {
        var form = layui.form,
            layer = layui.layer,
            $= layui.jquery;
        form.render();//这句一定要加，占坑
        layer.config({
            skin: 'demo-class'
        })
        $('#updatePwd').click(function(){
            var $1 = $.trim($('#account').val());
            var $2 = $.trim($("#pwd").val());
            var $3 = $.trim($("#repwd").val());
            if($1 == ''){
                //$("#msg1").html("用户名不能为空");
                layer.msg('账号不能为空',function() {time:2000},{icon: 1});
                return false;
            }
            if($2 == ''){
                layer.msg('密码不能为空',function() {time:2000},{icon: 5});
                return false;
            }
            if($2!=$3){
                layer.msg('两次密码不一致',function() {time:2000},{icon: 5});
                return false;
            }
        })
    });

</script>
  






</body>
</html>