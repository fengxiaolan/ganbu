<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@ page import="java.io.*" %>
<jsp:directive.page import="com.dao.DB"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="com.service.liuService"/>
<jsp:directive.page import="com.orm.Tganbu"/>
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
  
  <body> 
      <% 
      
            List ganbuList=new ArrayList();
			String sql="select * from t_ganbu order by org_id";
			Object[] params={};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				while(rs.next())
				{
					Tganbu ganbu=new Tganbu();
				
					ganbu.setId(rs.getInt("id"));
					ganbu.setOrg_id(rs.getInt("org_id"));
					ganbu.setXingming(rs.getString("xingming"));
					ganbu.setXingbie(rs.getString("xingbie"));
					
					ganbu.setChushengnianyue(rs.getString("chushengnianyue"));
					ganbu.setMinzu(rs.getString("minzu"));
					ganbu.setJiguan(rs.getString("jiguan"));
					ganbu.setChushengdi(rs.getString("chushengdi"));
					
					ganbu.setRudangshi(rs.getString("rudangshi"));
					ganbu.setCanjianshi(rs.getString("canjianshi"));
					ganbu.setJiankang(rs.getString("jiankang"));
					ganbu.setXueli(rs.getString("xueli"));
					
					ganbu.setXuewei(rs.getString("xuewei"));
					ganbu.setQuanrijiaoyu(rs.getString("quanrijiaoyu"));
					ganbu.setBiyexiao_quanri(rs.getString("biyexiao_quanri"));
					ganbu.setZaizhijiaoyu(rs.getString("zaizhijiaoyu"));
					
					ganbu.setBiyexiao_zaizhi(rs.getString("biyexiao_zaizhi"));
					ganbu.setZhiwu(rs.getString("zhiwu"));
					ganbu.setJibie(rs.getString("jibie"));
					ganbu.setJianli(rs.getString("jianli"));
					
					ganbu.setPeixun(rs.getString("peixun"));
					ganbu.setJiangcheng(rs.getString("jiangcheng"));
					ganbu.setNiandukaohe(rs.getString("niandukaohe"));
					
					ganbu.setOrg(liuService.getOrg(rs.getInt("org_id")));
					
					ganbuList.add(ganbu);
			    }
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
      
            
      
            HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("new sheet");
			
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell=row.createCell((short)0);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("机构");
					
			cell=row.createCell((short)1);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("姓名");
					
			cell=row.createCell((short)2);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("性别");
			
			cell=row.createCell((short)3);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("出生年月");
			
			cell=row.createCell((short)4);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("民族");
			
			cell=row.createCell((short)5);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("籍贯");
			
			cell=row.createCell((short)6);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("出生地");
			
			cell=row.createCell((short)7);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("入党时间");
			
			cell=row.createCell((short)8);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("参加工作时间");
			
			cell=row.createCell((short)9);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("健康状况");
			
			cell=row.createCell((short)10);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("学历");
			
			cell=row.createCell((short)11);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("学位");
			
			cell=row.createCell((short)12);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("全日制教育");
			
			cell=row.createCell((short)13);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("毕业院校及专业");
			
			cell=row.createCell((short)14);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("在职教育");
			
			cell=row.createCell((short)15);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("毕业院校及专业");
			
			cell=row.createCell((short)16);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("现任职务");
			
			cell=row.createCell((short)17);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("职务级别");
			
			cell=row.createCell((short)18);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("简历");
			
			cell=row.createCell((short)19);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("培训情况");
			
			cell=row.createCell((short)20);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("奖惩情况");
			
			cell=row.createCell((short)21);
			cell.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell.setCellValue("年度考核结果");
			
			
			
			
			for(int i=0;i<ganbuList.size();i++)
			{
				Tganbu ganbu=(Tganbu)ganbuList.get(i);
				
				row=sheet.createRow(i+1);
				cell=row.createCell((short)0);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getOrg().getName());
						
				cell=row.createCell((short)1);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getXingming());
				
				cell=row.createCell((short)2);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getXingbie());
				
				cell=row.createCell((short)3);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getChushengnianyue());
				
				cell=row.createCell((short)4);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getMinzu());
				
				cell=row.createCell((short)5);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getJiguan());
				
				cell=row.createCell((short)6);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getChushengdi());
				
				cell=row.createCell((short)7);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getRudangshi());
				
				cell=row.createCell((short)8);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getCanjianshi());
				
				cell=row.createCell((short)9);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getJiankang());
				
				cell=row.createCell((short)10);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getXueli());
				
				cell=row.createCell((short)11);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getXuewei());
				
				cell=row.createCell((short)12);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getQuanrijiaoyu());
				
				cell=row.createCell((short)13);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getBiyexiao_quanri());
				
				cell=row.createCell((short)14);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getZaizhijiaoyu());
				
				cell=row.createCell((short)15);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getBiyexiao_zaizhi());
				
				cell=row.createCell((short)16);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getZhiwu());
				
				cell=row.createCell((short)17);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getJibie());
				
				cell=row.createCell((short)18);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getJianli());
				
				cell=row.createCell((short)19);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getPeixun());
				
				cell=row.createCell((short)20);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getJiangcheng());
				
				cell=row.createCell((short)21);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(ganbu.getNiandukaohe());
				
			}
			
			
			String fujianPath="c:\\数据备份.xls";
			try
			{
				FileOutputStream fileOut = new FileOutputStream(fujianPath);
				wb.write(fileOut);
				fileOut.close();
			} 
			catch (Exception e)
			{
			       e.printStackTrace();
			}
			
          
      
          
          SmartUpload su = new SmartUpload(); // 新建一个SmartUpload对象 

          su.initialize(pageContext); // 初始化 

          su.setContentDisposition(null); 
          // 设定contentDisposition为null以禁止浏览器自动打开文件， 
          //保证点击链接后是下载文件。若不设定，则下载的文件扩展名为 
          //doc时，浏览器将自动用word打开它。扩展名为pdf时，将用acrobat打开

          //su.downloadFile("/uploadPath/file/liu.doc"); // 下载英文文件
          su.downloadFile(fujianPath, null, new String(java.net.URLDecoder.decode("数据备份.xls","UTF-8").getBytes(), "ISO8859-1")); // 下载中文文件
          //downloadFile(String sourceFilePathName, String contentType, String destFileName)
          out.clear();
          out=pageContext.pushBody(); 
      %> 

      
  </body>
</html>
