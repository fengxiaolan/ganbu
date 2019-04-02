package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TOrganization;
import com.orm.Tganbu;import com.service.loginService;
import com.service.liuService;
public class ganbu_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
        if(type.endsWith("ganbuAdd"))
		{
			ganbuAdd(req, res);
		}
        if(type.endsWith("ganbuMana"))
		{
			ganbuMana(req, res);
		}
		if(type.endsWith("ganbuDel"))
		{
			ganbuDel(req, res);
		}
		
		if(type.endsWith("ganbuDetailHou"))
		{
			ganbuDetailHou(req, res);
		}
		if(type.endsWith("ganbuSearch"))
		{
			ganbuSearch(req, res);
		}
		if(type.endsWith("ganbuAll"))
		{
			ganbuAll(req, res);
		}
		if(type.endsWith("ganbuEditPre"))
		{
			ganbuEditPre(req, res);
		}
		if(type.endsWith("ganbuEdit"))
		{
			ganbuEdit(req, res);
		}
		
	}
	
	public void ganbuAdd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		int org_id=Integer.parseInt(req.getParameter("org_id"));
		
		String xingming=req.getParameter("xingming").trim();
		String xingbie=req.getParameter("xingbie").trim();
		String chushengnianyue=req.getParameter("chushengnianyue").trim();
		String minzu=req.getParameter("minzu").trim();
		
		String jiguan=req.getParameter("jiguan").trim();
		String chushengdi=req.getParameter("chushengdi").trim();
		String rudangshi=req.getParameter("rudangshi").trim();
		String canjianshi=req.getParameter("canjianshi").trim();
		
		
		String jiankang=req.getParameter("jiankang").trim();
		String xueli=req.getParameter("xueli").trim();
		String xuewei=req.getParameter("xuewei").trim();
		String quanrijiaoyu=req.getParameter("quanrijiaoyu").trim();
		
		
		String biyexiao_quanri=req.getParameter("biyexiao_quanri").trim();
		String zaizhijiaoyu=req.getParameter("zaizhijiaoyu").trim();
		String biyexiao_zaizhi=req.getParameter("biyexiao_zaizhi").trim();
		String zhiwu=req.getParameter("zhiwu").trim();
		
		
		String jibie=req.getParameter("jibie").trim();
		String jianli=req.getParameter("jianli").trim();
		String peixun=req.getParameter("peixun").trim();
		String jiangcheng=req.getParameter("jiangcheng").trim();
		
		
		String niandukaohe=req.getParameter("niandukaohe").trim();
		
		
		String sql="insert into t_ganbu values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={org_id,xingming,xingbie,chushengnianyue,
				         minzu,jiguan,chushengdi,rudangshi,
				         canjianshi,jiankang,xueli,xuewei,
				         quanrijiaoyu,biyexiao_quanri,zaizhijiaoyu,biyexiao_zaizhi,
				         zhiwu,jibie,jianli,peixun,
				         jiangcheng,niandukaohe};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "添加成功");
		req.getRequestDispatcher("common/msg.jsp").forward(req, res);
	}
	
	public void ganbuMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
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
		
		req.setAttribute("ganbuList", ganbuList);
		req.getRequestDispatcher("admin/ganbu/ganbuMana.jsp").forward(req, res);
	}
	
	
	
	
	public void ganbuDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tganbu ganbu=new Tganbu();
		String sql="select * from t_ganbu where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
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
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("ganbu", ganbu);
		req.getRequestDispatcher("admin/ganbu/ganbuDetailHou.jsp").forward(req, res);
	}
	
	
	public void ganbuSearch(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List ganbuList=new ArrayList();
		String org_id=req.getParameter("org_id").trim();
		String xingming=req.getParameter("xingming").trim();
		String xingbie=req.getParameter("xingbie").trim();
		String chushengnianyue1=req.getParameter("chushengnianyue1").trim();
		String chushengnianyue2=req.getParameter("chushengnianyue2").trim();
		String xueli=req.getParameter("xueli").trim();
		
		StringBuffer sql=new StringBuffer("select * from t_ganbu where 1=1");
		if(org_id !=null && org_id !="")
		{
			sql.append(" and org_id="+Integer.parseInt(org_id));
		}
		if(xingming !=null && xingming !="")
		{
			sql.append(" and xingming like '%"+xingming+"%'");
		}
		if(xingbie !=null && xingbie !="")
		{
			sql.append(" and xingbie='"+xingbie+"'");
		}
		if(chushengnianyue1 !=null && chushengnianyue1 !="")
		{
			sql.append(" and chushengnianyue>'"+chushengnianyue1+"'");
		}
		if(chushengnianyue2 !=null && chushengnianyue2 !="")
		{
			sql.append(" and chushengnianyue<'"+chushengnianyue2+"'");
		}
		if(xueli !=null && xueli !="")
		{
			sql.append(" and xueli like '%"+xueli+"%'");
		}
		
		sql.append(" order by org_id");
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql.toString(), params);
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
		
		req.setAttribute("ganbuList", ganbuList);
		req.getRequestDispatcher("admin/ganbu/ganbuMana.jsp").forward(req, res);
	}
	
	
	
	public void ganbuDel(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from t_ganbu where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "删除成功");
		req.getRequestDispatcher("common/msg.jsp").forward(req, res);
	}
	
	
	public void ganbuAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
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
		
		req.setAttribute("ganbuList", ganbuList);
		req.getRequestDispatcher("admin/ganbu/ganbuAll.jsp").forward(req, res);
	}
	
	
	public void ganbuEditPre(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		Tganbu ganbu=new Tganbu();
		String sql="select * from t_ganbu where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
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
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("ganbu", ganbu);
		req.getRequestDispatcher("admin/ganbu/ganbuEditPre.jsp").forward(req, res);
	}
	
	
	public void ganbuEdit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		int org_id1=Integer.parseInt(req.getParameter("org_id1"));
		String zhiwu1=req.getParameter("zhiwu1").trim();
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		
		String sql="update t_ganbu set org_id=?,zhiwu=? where id=?";
		Object[] params={org_id1,zhiwu1,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "编辑成功");
		req.getRequestDispatcher("common/msg.jsp").forward(req, res);
	}
	
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
