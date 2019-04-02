<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <style>
   .loginsuccess{
        margin: 80px auto;
        text-align: center;
    }
  </style>
  <script type='text/javascript' src='<%=path %>/js/jquery.js'></script>
  <body>
       <script type="text/javascript">
       $(document).ready(function(){
  		tiao();
  		})
           function tiao()
           {
               //<c:if test="${sessionScope.userType==0}">
                  window.location.href="<%=path %>/admin/index.jsp";
               /*   window.location.href="http://localhost:8080/ganbu/index.jsp"; */
              // </c:if>
           }
           
           setTimeout(tiao,1300)
       </script>
       <div class="loginsuccess">
       		<img src="<%=path %>/img/loading.gif">页面跳转中
	   </div>
  </body>
</html>
