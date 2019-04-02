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
		        if(document.formAdd.org_id.value=="")
		        {
		            alert("请选择机构");
		            return false;
		        }
		        if(document.formAdd.xingming.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		        
		        document.formAdd.submit();
		    } 
		    
		    
		    function orgAll()
		    {
		       	var strUrl = "<%=path %>/org?type=orgAll";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:350px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
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
        </script>
	</head>

	<body leftmargin="9" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/ganbu?type=ganbuAdd" name="formAdd" method="post">
				     <table width="" align="left" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="13" background="<%=path %>/images/wbg.gif" class='title'><span>干部信息</span></td>
					    </tr>
					    <tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         机构：
						    </td>
						    <td align="left" colspan="5">
						        <input type="hidden" name="org_id" id="org_id" readonly="readonly"/>
						        <input type="text" name="xxxx" id="xxxx" readonly="readonly" value="${requestScope.ganbu.org.name}"/>
						        &nbsp;
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						        姓名：
						    </td>
						    <td align="left">
						       ${requestScope.ganbu.xingming }
						    </td>
						    <td align="right" style="width: 120px;">
						         性别：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.xingbie }
						    </td>
						    <td align="right" style="width: 120px;">
						               出生年月：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.chushengnianyue }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                 民族：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.minzu }
						    </td>
						    <td align="right" style="width: 120px;">
						         籍贯：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.jiguan }
						    </td>
						    <td align="right" style="width: 120px;">
						               出生地：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.chushengdi }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         入党时间：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.rudangshi }
						    </td>
						    <td align="right" style="width: 120px;">
						         参加工作时间：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.canjianshi }
						    </td>
						    <td align="right" style="width: 120px;">
						               健康状况：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.jiankang }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         学历：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.xueli }
						    </td>
						    <td align="right" style="width: 120px;">
						               学位：
						    </td>
						    <td align="left" colspan="3">
						        ${requestScope.ganbu.xuewei }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                全日制教育：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.quanrijiaoyu }
						    </td>
						    <td align="right" style="width: 120px;">
						         毕业院校及专业：
						    </td>
						    <td align="left" colspan="3">
						        ${requestScope.ganbu.biyexiao_quanri }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         在职教育：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.zaizhijiaoyu }
						    </td>
						    <td align="right" style="width: 120px;">
						         毕业院校及专业：
						    </td>
						    <td align="left" colspan="3">
						        ${requestScope.ganbu.biyexiao_zaizhi }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         现任职务：
						    </td>
						    <td align="left">
						        ${requestScope.ganbu.zhiwu }
						    </td>
						    <td align="right" style="width: 120px;">
						         职务级别：
						    </td>
						    <td align="left" colspan="3">
						        ${requestScope.ganbu.jibie }
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         简历：
						    </td>
						    <td align="left" colspan="5" style="width: 450px;">
                                <c:out value="${requestScope.ganbu.jianli }" escapeXml="false"></c:out>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         培训情况：
						    </td>
						    <td align="left" colspan="5" style="width: 450px;">
                                <c:out value="${requestScope.ganbu.peixun }" escapeXml="false"></c:out>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         奖惩情况：
						    </td>
						    <td align="left" colspan="5" style="width: 450px;">
                                <c:out value="${requestScope.ganbu.jiangcheng }" escapeXml="false"></c:out>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         年度考核结果：
						    </td>
						    <td align="left" colspan="5" style="width: 450px;">
                                <c:out value="${requestScope.ganbu.niandukaohe }" escapeXml="false"></c:out>
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
