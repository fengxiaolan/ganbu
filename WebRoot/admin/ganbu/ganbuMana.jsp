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
		
        <script language="javascript">
           function ganbuDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/ganbu?type=ganbuDel&id="+id;
               }
           }
           
           function ganbuAdd()
           {
                 var url="<%=path %>/admin/ganbu/ganbuAdd.jsp";
				 window.location.href=url;
           }
           
           function ganbuDetailHou(id)
           {
                 window.location.href="<%=path %>/ganbu?type=ganbuDetailHou&id="+id;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/images/tbg.gif">&nbsp;干部信息管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="10%">机构</td>
					<td width="10%">姓名</td>
					<td width="5%">性别</td>
					<td width="10%">出生年月</td>
					<td width="10%">民族</td>
					<td width="10%">籍贯</td>
					<td width="10%">出生地</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.ganbuList}" var="ganbu" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${sta.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.org.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.xingming}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.xingbie}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.chushengnianyue}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.minzu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.jiguan}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${ganbu.chushengdi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="ganbuDel(${ganbu.id})"/>
						<input type="button" value="详细信息" onclick="ganbuDetailHou(${ganbu.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="ganbuAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
