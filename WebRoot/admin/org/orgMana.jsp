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
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<link href="<%=path %>/css/dtree.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=path %>/js/dtree.js" type="text/javascript"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<title></title>
		<script type="text/javascript">
		    var orgId=null;
		    function onClickTreeNode(nodeId)
		    {
		        orgId=nodeId;
		    }
		    
		    function addDingJiOrg()
		    {
				 var url="<%=path %>/admin/org/addOrg.jsp?orgId="+0;
                 var n="";
                 var w="400px";
                 var h="300px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
		    }
		    
		    
		    function addXiaJiOrg()
		    {
		        
				if(orgId==null)
				{
				     alert("请选择县市区或者市直单位");
				}
				else
				{
				     var url="<%=path %>/admin/org/addOrg.jsp?orgId="+orgId;
				    var iWidth = 500; 
					var iHeight = 300; 
					var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
					var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
					var win = window.open(url, "", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
				    /* window.showModelessDialog(url,"name","dialogWidth:400px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");  */
				     window.location.reload();
				}
		    }
		    
		    function delOrg()
		    {
				if(orgId==null)
				{
				     alert("请选择机构");
				}
				else
				{
				     var s="<%=path %>/org?type=orgDel&orgId="+orgId;
				     window.location.href=s;
				}
		    }
		    
		    function fresh()
		    {
		        window.location.reload();
		    }
		    
		</script>
	</head>

	<BODY>
	<div class="body-box">
		<div class="dtree">
			<script type="text/javascript">
				d = new dTree('d');
		        d.add(0,-1,'机构信息结构图');//必须有这句
				<c:forEach items="${requestScope.orgList}" var="org">
		            d.add(${org.id},${org.parenOrganization.id},'${org.name}','javaScript:onClickTreeNode(${org.id});',null,null,null,null,'yes');
		        </c:forEach>
				document.write(d);
			</script>
		</div>
		<br>
		<input type="button" class="ButtonCss" value="添加机构" onclick="addXiaJiOrg()">
		<input type="button" class="ButtonCss" value="删除机构" onclick="delOrg()">
	</div>
	</body>
</html>
