<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		.STYLE1 {
			color: #FFFFFF;
			font-weight: bold;
			font-size: 12px;
		}
		.STYLE2 {
			font-size: 12px;
			color: #03515d;
		}
		a:link {font-size:13px; text-decoration:none; color:#03515d;}
		a:visited{font-size:13px; text-decoration:none; color:#03515d;}
		-->
		.leftmenu{
			cursor:hand;
			color: #fff;
		}
		.leftmenu a{
			color: #fff;
		}
		.leftmenu:hover a{
			color: #68cede;
			padding-bottom: 3px;
			border-bottom: 1px solid #68cede;
		}
	</style>
	<link rel="StyleSheet" href="<%=path %>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/dtree.js"></script>
  </head>
  
  <body>
		<table width="156" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" valign="top">
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td height="35" bgColor="#0D122E;">
								<div style="color: #fff; font-weight: 600;font-size: 16px;text-align: center;">功能菜单>></div>
							</td>
						</tr>
						<tr>
							<td align="center" valign="top" bgColor="#1F4380">
								<table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr height="10">
												   <td></td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-1.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu"
																    >
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/userinfo/userPw.jsp' target='I2'>修改个人密码</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-2.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/org?type=orgMana' target='I2'>机构信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-3.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/ganbu?type=ganbuMana' target='I2'>干部信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-4.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/ganbu/ganbuAdd.jsp' target='I2'>干部信息录入</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-5.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/updown/daochuExc.jsp' target='I2'>数据信息备份</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-6.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/ganbu/ganbuSearch.jsp' target='I2'>干部信息查询</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr height="45">
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left-7.png" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" class="leftmenu">
																	<span class="STYLE2">
																	    <a href='<%=path %>/ganbu?type=ganbuAll' target='I2'>任免信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
