package com.service;


import java.sql.ResultSet;

import com.dao.DB;
import com.orm.TOrganization;

public class liuService
{

	public static TOrganization getOrg(int id)
	{
		TOrganization organization=new TOrganization();
		
		if(id==0)
		{
			organization.setId(0);
		}
		else
		{
			String sql="select * from t_organization where id=?";
			Object[] params={id};
			DB mydb=new DB();
			try
			{
				mydb.doPstm(sql, params);
				ResultSet rs=mydb.getRs();
				rs.next();
				organization.setId(rs.getInt("id"));
				organization.setName(rs.getString("name"));
				rs.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			mydb.closed();
		}
		
		return organization;
	}
}
