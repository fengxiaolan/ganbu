<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
		       	var iWidth = 500; 
				var iHeight = 300; 
				var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
				var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
				
				var child = window.open(strUrl, "window", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
				// var ret = window.showModalDialog(strUrl,"","dialogWidth:350px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;"); 
			 
				
				//if(wind.closed){
					//var ret = wind.document.newform.newvalue.value();
				//} 
			    
			    //var ret = wind.document.newform.newvalue.value();
			    var ret = '';
			    if(!child.closed){
			     if(!window.close()){
			        var textValue = frm.txt.value;  
			        parent.formAdd.org_id.value  =  textValue;  
			        ret = parent.formAdd.org_id.value;
			        
			        orgGet(parent.formAdd.org_id.value);
			        if(ret==undefined && ret == ''){
				        ret="";
				    }else{   
				        document.formAdd.org_id.value= ret;
				        orgGet(ret);
				    }
			     }
			     else{
			      window.close(); 
			      child.close();
			     }
			    }
			    
			    
				/* if(ret==undefined && ret == ''){
			        ret="";
			    }else{   
			        document.formAdd.org_id.value= ret;
			        orgGet(ret);
			    } */
		    }
		    
		    function orgGet(ret)
			{
				dojo.xhrGet
				(
					{
				         url: <%=path %>+'/ganbu/org?type=orgGet&org_id='+ret,    //设置接受客户端请求的服务器端页面
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
				     <table width="" align="left" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;width: 100%;">
						<tr bgcolor="#EEF4EA">
					        <td colspan="13" background="<%=path %>/images/wbg.gif" class='title'><span>干部信息添加</span></td>
					    </tr>
					    <tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         机构：
						    </td>
						    <td align="left" colspan="5">
						        <input type="text" name="org_id" id="org_id" readonly="readonly"/>
						        <input type="text" name="xxxx" id="xxxx" readonly="readonly"/>
						        &nbsp;
						        <input type="button" value="选择机构" onclick="orgAll()"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                 姓名：
						    </td>
						    <td align="left">
						        <input type="text" name="xingming" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         性别：
						    </td>
						    <td align="left" >
						        <input type="radio" name="xingbie" value="男" style="border: 0px;" checked="checked"/>男
						        &nbsp;&nbsp;&nbsp;
						        <input type="radio" name="xingbie" value="女" style="border: 0px;"/>女
						    </td>
						    <td align="right" style="width: 120px;">
						               出生年月：
						    </td>
						    <td align="left">
						        <input type="text" name="chushengnianyue" style="width: 130px;"/>(格式：1980-02-12)
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                 民族：
						    </td>
						    <td align="left">
						        <input type="text" name="minzu" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         籍贯：
						    </td>
						    <td align="left">
						        <input type="text" name="jiguan" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						               出生地：
						    </td>
						    <td align="left">
						        <input type="text" name="chushengdi" style="width: 300px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         入党时间：
						    </td>
						    <td align="left">
						        <input type="text" name="rudangshi" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         参加工作时间：
						    </td>
						    <td align="left">
						        <input type="text" name="canjianshi" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						               健康状况：
						    </td>
						    <td align="left">
						        <input type="text" name="jiankang" style="width: 130px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         学历：
						    </td>
						    <td align="left">
						        <input type="text" name="xueli" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						               学位：
						    </td>
						    <td align="left" colspan="3">
						        <input type="text" name="xuewei" style="width: 130px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						                全日制教育：
						    </td>
						    <td align="left">
						        <input type="text" name="quanrijiaoyu" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         毕业院校及专业：
						    </td>
						    <td align="left" colspan="3">
						        <input type="text" name="biyexiao_quanri" style="width: 430px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         在职教育：
						    </td>
						    <td align="left">
						        <input type="text" name="zaizhijiaoyu" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         毕业院校及专业：
						    </td>
						    <td align="left" colspan="3">
						        <input type="text" name="biyexiao_zaizhi" style="width: 430px;"/>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF">
						    <td align="right" style="width: 120px;">
						         现任职务：
						    </td>
						    <td align="left">
						        <input type="text" name="zhiwu" style="width: 130px;"/>
						    </td>
						    <td align="right" style="width: 120px;">
						         职务级别：
						    </td>
						    <td align="left" colspan="3">
						        <select name="jibie" style="width: 130px;">
						             <option value="正处">正处</option>
						             <option value="副处">副处</option>
						        </select>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF"  >
						    <td align="right" style="width: 120px;height: 150px;">
						         简历：
						    </td>
						    <td align="left" colspan="7" style="height: 150px;">
						        <FCK:editor instanceName="jianli"  basePath="/fckeditor" width="800" height="120" value="" toolbarSet="Basic">
                                </FCK:editor>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF" >
						    <td align="right" style="width: 120px;height: 100px;">
						         培训情况：
						    </td>
						    <td align="left" colspan="7" style="height: 100px;">
						        <FCK:editor instanceName="peixun"  basePath="/fckeditor" width="800" height="100" value="" toolbarSet="Basic">
                                </FCK:editor>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF"  >
						    <td align="right" style="width: 120px;height: 100px;">
						         奖惩情况：
						    </td>
						    <td align="left" colspan="7" style="height: 100px;">
						        <FCK:editor instanceName="jiangcheng"  basePath="/fckeditor" width="800" height="100" value="" toolbarSet="Basic">
                                </FCK:editor>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF" >
						    <td align="right" style="width: 120px;height: 100px;">
						         年度考核结果：
						    </td>
						    <td align="left" colspan="7" style="height: 100px;">
						        <FCK:editor instanceName="niandukaohe"  basePath="/fckeditor" width="800" height="100" value="" toolbarSet="Basic">
                                </FCK:editor>
						    </td>
						</tr>
						<tr align='left' bgcolor="#FFFFFF"  >
						    <!--<td align="right" style="width: 120px;">
						         
						    </td>
						    --><td align="center" colspan="7">
						        <input type="button" value="确认提交" style="width: 100px;" onclick="c()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
