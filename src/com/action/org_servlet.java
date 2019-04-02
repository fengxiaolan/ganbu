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
import com.service.loginService;
import com.service.liuService;
public class org_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("orgMana"))
		{
			orgMana(req, res);
		}
		if(type.endsWith("orgAdd"))
		{
			orgAdd(req, res);
		}
		if(type.endsWith("orgDel"))
		{
			orgDel(req, res);
		}
		
		if(type.endsWith("orgAll"))
		{
			orgAll(req, res);
		}
		if(type.endsWith("orgGet"))
		{
			orgGet(req, res);
		}
	}
	
	public void orgMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List orgList=new ArrayList();
		String sql="select * from t_organization where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TOrganization organization=new TOrganization();
				organization.setId(rs.getInt("id"));
				organization.setName(rs.getString("name"));
				organization.setP_id(rs.getInt("p_id"));
				organization.setDel(rs.getString("del"));
				organization.setParenOrganization(liuService.getOrg(rs.getInt("p_id")));
				orgList.add(organization);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orgList", orgList);
		req.getRequestDispatcher("admin/org/orgMana.jsp").forward(req, res);
	}
	
	
	public void orgAdd(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		String name=req.getParameter("name");
		int p_id=Integer.parseInt(req.getParameter("p_id"));
		String del="no";
		
		String sql="insert into t_organization values(?,?,?)";
		Object[] params={name,p_id,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("msg", "添加成功");
		req.getRequestDispatcher("common/msg.jsp").forward(req, res);
	}
	
	public void orgDel(HttpServletRequest req,HttpServletResponse res)
	{
		int orgId=Integer.parseInt(req.getParameter("orgId"));
		String sql="update t_organization set del='yes' where id="+orgId;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "org?type=orgMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void orgAll(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List orgList=new ArrayList();
		String sql="select * from t_organization where del='no'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				TOrganization organization=new TOrganization();
				organization.setId(rs.getInt("id"));
				organization.setName(rs.getString("name"));
				organization.setP_id(rs.getInt("p_id"));
				organization.setDel(rs.getString("del"));
				organization.setParenOrganization(liuService.getOrg(rs.getInt("p_id")));
				orgList.add(organization);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("orgList", orgList);
		req.getRequestDispatcher("admin/org/orgAll.jsp").forward(req, res);
	}
	
	public void orgGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		TOrganization org=liuService.getOrg(Integer.parseInt(req.getParameter("org_id")));
		String s=org.getName();
		res.getWriter().print(s);
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
