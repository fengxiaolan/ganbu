<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	    <style type="text/css"><!--
			body {
				margin-left: 0px;
				margin-top: 0px;
				margin-right: 0px;
				margin-bottom: 0px;
			}
			#container{
				position: relative;
				width: 100%;
				height: 100%;
				background: #e1ecf5;
			}
			.loginbox{
				position: absolute;
				top:0;
				left: 0;
				right: 0;
				bottom: 0;
				margin: auto;
				width: 400px;
				height: 260px;
				padding: 20px 10px 30px;
				background: #fff;
				box-shadow: 1px 2px #f2f2f2;
				border-radius: 5px;
			}
			.title{
				width: 100%;
				height: 50px;
				line-height: 50px;
				text-align: center;
				background: #008AF1;
				color: #fff;
				font-size: 20px;
				font-weight: 800;
				margin-bottom: 20px;
			}
			.labels{
			 color: #666;
			 font-size: 14px;
			}
			input[type=button]{
			 border: 1px solid #008AF1;
			 background-color: #008AF1;
			 color: #fff;
			 padding: 3px 6px;
			 cursor: pointer;
			 border-radius: 5px;
			 padding: 4px 8px;
			 font-size: 14px;
			}
			input[type=reset]{
			 background-color: #fff;
			 color: #333;
			 border: 1px solid #ababab;
			  cursor: pointer;
			  border-radius: 5px;
			  padding: 4px 8px;
			 font-size: 14px;
			}
		  .formlogin{
		  
		  }
		</style>
		
		<link rel="StyleSheet" href="<%=path %>/css/bootstrap.css" type="text/css" />
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/js/jquery.particleground.js'></script>
        <script type='text/javascript' src='<%=path %>/js/jquery.js'></script>
        
		<script language="javascript">
		<%-- function check1() {
			window.location.href="<%=path %>/loginSuccess.jsp";
		} --%>
		function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
			 
		} 
		
		 function callback(data)
		{
			 alert('alert', data);
		    document.getElementById("indicator").style.display="none"; 
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		      
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		    
		}
		
		document.addEventListener('DOMContentLoaded', function () {
			
		  particleground(document.getElementById('container'), {
		    //粒子颜色
		    dotColor: '#008AF1',
		    //线颜色
		    lineColor: '#eda'
		  });
		 
		}, false);
	    </script>
</head>
<body class="bg-login">
<div >
    <div id="container">
        <div class="loginbox">
            <div class="title">宁强县委组织部干部管理系统</div>
            <form class="form-horizontal" name="ThisForm" action="<%=path %>/adminLogin.action" method=post class="formlogin">
                <div class="form-group">
                    <label class="col-sm-3 control-label labels">用户名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="userName" placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label labels">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="userPw" placeholder="请输入密码">
                    </div>
                </div>
                <div style="text-align: center;">
	                <input type="button" name="button" id="Submit" value="登录" onclick="check1()"/>
	                &nbsp;&nbsp;&nbsp;
				    <input type="reset" name="cs" id="cs" value="重置"/><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>