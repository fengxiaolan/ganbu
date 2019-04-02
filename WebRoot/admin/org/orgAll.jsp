<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <base target="_self">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<link href="<%=path %>/css/dtree.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=path %>/js/dtree.js" type="text/javascript"></script>
		<title></title>
		<script type="text/javascript">
		    var org_id1 = ""; 
		    
		    function onClickTreeNode(org_id)
		    {
		         org_id1 = org_id;
		    }
		    
		    function queding()
            {
                 if(org_id1=="")
                 {
                    alert("请单击选择机构");
                    return false;
                 }
                 window.opener.document.getElementById("org_id").value = org_id1;
                 //window.opener.returnValue = org_id1;
                 window.returnValue = org_id1;
                 //document.newform.newvalue.value = org_id1;
		         window.close();
            }
		    
		</script>
	</head>

	<BODY>
		<div class="dtree">
			<script type="text/javascript">
				d = new dTree('d');
		        d.add(0,-1,'部门组织结构图');//必须有这句
				<c:forEach items="${requestScope.orgList}" var="org">
		            d.add(${org.id},${org.parenOrganization.id},'${org.name}','javaScript:onClickTreeNode(${org.id});',null,null,null,null,'yes');
		        </c:forEach>
				document.write(d);
			</script>
		</div>
		<br>
		&nbsp;&nbsp;&nbsp;<input type="button" value="确定" style="width: 80px;" onclick="queding()">
	</body>
</html>
