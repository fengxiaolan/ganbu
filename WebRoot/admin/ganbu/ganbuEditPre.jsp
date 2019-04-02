<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script language="JavaScript" src="<%=path %>/dojo/dojo/dojo.js" ></script>
        
        
        <script language="javascript">
            function c()
		    {
		        if(document.formAdd.org_id1.value=="")
		        {
		            alert("请选择新机构");
		            return false;
		        }
		        
		        document.formAdd.submit();
		    } 
		    
		    
		    function orgAll()
		    {
		       	var strUrl = "<%=path %>/org?type=orgAll";
		       	var iWidth = 500; 
				var iHeight = 300; 
				var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
				var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
				var ret = window.open(strUrl, "", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
				/* var ret = window.showModalDialog(strUrl,"","dialogWidth:350px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;"); */
				
				if(ret==undefined)
			    {
			        ret="";
			    }
			    else
			    {   
			        document.formAdd.org_id.value=ret;
			        orgGet(ret);
			    }
		    }
		    
		    function orgGet(ret)
			{
				dojo.xhrGet
				(
					{
				         url: '/ganbu/org?type=orgGet&org_id='+ret,    //设置接受客户端请求的服务器端页面
				         load: helloCallback, //异步调用成功后触发的方法
				         error: helloError,   //出错时触发的方法
				         content: {}         //设置提交请求时的参数
				     
			        }
		        );
			}
			
			function helloCallback(data,ioArgs) 
			{
				var org_name = data;
				document.formAdd.xxxx.value=org_name;
			}
			function helloError(data, ioArgs) 
			{
		        alert('Error ');
		    }
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		    function orgAll1()
		    {
		       	var strUrl = "<%=path %>/org?type=orgAll";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:350px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			        ret="";
			    }
			    else
			    {   
			        document.formAdd.org_id1.value=ret;
			        orgGet1(ret);
			    }
		    }
		    
		    function orgGet1(ret)
			{
				dojo.xhrGet
				(
					{
				         url: '/ganbu/org?type=orgGet&org_id='+ret,    //设置接受客户端请求的服务器端页面
				         load: helloCallback1, //异步调用成功后触发的方法
				         error: helloError,   //出错时触发的方法
				         content: {}         //设置提交请求时的参数
				     
			        }
		        );
			}
			
			function helloCallback1(data,ioArgs) 
			{
				var org_name1 = data;
				document.formAdd.xxxx1.value=org_name1;
			}
			function helloError(data, ioArgs) 
			{
		        alert('Error ');
		    }
        </script>
	</head>

	<body leftmargin="9" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/ganbu?type=ganbuEdit" name="formAdd" method="post">
				     <table width="" align="left" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="13" background="<%=path %>/images/wbg.gif" class='title'><span>任免管理</span></td>
					    </tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                 姓名：
						    </td>
						    <td align="left">
						        <input type="text" name="xingming" style="width: 130px;" value="${requestScope.ganbu.xingming}"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         性别：
						    </td>
						    <td align="left">
						        <c:if test="${requestScope.ganbu.xingbie=='男'}">
							        <input type="radio" name="xingbie" value="男" style="border: 0px;" checked="checked"/>男
							        &nbsp;&nbsp;&nbsp;
							        <input type="radio" name="xingbie" value="女" style="border: 0px;"/>女
						        </c:if>
						        <c:if test="${requestScope.ganbu.xingbie=='女'}">
							        <input type="radio" name="xingbie" value="男" style="border: 0px;"/>男
							        &nbsp;&nbsp;&nbsp;
							        <input type="radio" name="xingbie" value="女" style="border: 0px;"  checked="checked"/>女
						        </c:if>
						    </td>
						    <td align="right" style="width: 120px;">
						               出生年月：
						    </td>
						    <td align="left">
						        <input type="text" name="chushengnianyue" style="width: 130px;" value="${requestScope.ganbu.chushengnianyue}"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         拟免职务：
						    </td>
						    <td align="left">
						        <input type="text" name="zhiwu" style="width: 130px;" value="${requestScope.ganbu.zhiwu}"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         拟任职务：
						    </td>
						    <td align="left" colspan="3">
						        <input type="text" name="zhiwu1" style="width: 130px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         现机构：
						    </td>
						    <td align="left" colspan="5">
						        <input type="hidden" name="org_id" id="org_id" readonly="readonly"/>
						        <input type="text" name="xxxx" id="xxxx" readonly="readonly" value="${requestScope.ganbu.org.name}"/>
						        &nbsp;
						        <input type="button" value="选择机构" onclick="orgAll()"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         新机构：
						    </td>
						    <td align="left" colspan="5">
						        <input type="hidden" name="org_id1" id="org_id1" readonly="readonly"/>
						        <input type="text" name="xxxx1" id="xxxx1" readonly="readonly"/>
						        &nbsp;
						        <input type="button" value="选择机构" onclick="orgAll1()"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         
						    </td>
						    <td align="left" colspan="5">
						        <input type="hidden" name="id" value="${requestScope.ganbu.id}"/>
						        <input type="button" value="确认提交" style="width: 100px;" onclick="c()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
