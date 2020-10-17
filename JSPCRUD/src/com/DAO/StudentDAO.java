package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student;

public class StudentDAO {

	public static Connection getConnection()
	{
		Connection con= null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root", "");
		}
		catch(Exception e)
		{e.printStackTrace();}
	return con;
	}

	//update data based on id
		public static int UpdateData(Student s) {
			int status=0;
				try {
					Connection con = StudentDAO.getConnection();  
					String q="update student set sname=?,scontact=?,semail=?,scity=? where id=?";
					PreparedStatement pstmt = con.prepareStatement(q);
					
					pstmt.setString(1, s.getSname());
					pstmt.setInt(2, s.getScontact());
					pstmt.setString(3, s.getSemail());
					pstmt.setString(4, s.getScity());
					pstmt.setInt(5,s.getId());
					
					status=pstmt.executeUpdate();
			
				}
				catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
			return status;
		}
		
	
	
	//fatch data based on Id
	public static Student getDatabyId(int id)
	{
		Student s= null;
		try {
			
			Connection con=StudentDAO.getConnection();
			String q="select * from student where id=?";
			PreparedStatement pstmt= con.prepareStatement(q);
			pstmt.setInt(1, id);
			ResultSet rs=  pstmt.executeQuery();
			
			while(rs.next())
			{
				s=new Student();
				s.setId(rs.getInt(1));
				s.setSname(rs.getString(2));
				s.setScontact(rs.getInt(3));
				s.setSemail(rs.getString(4));
				s.setScity(rs.getString(5));				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();}
		return s;
	}
	
	
	
	//for Delete
	public static int Delete(Student s)
	{
		int status=0;
		try {
			
			Connection con =StudentDAO.getConnection();
			String q="delete from student where id=?";
			PreparedStatement pstmt= con.prepareStatement(q);
			pstmt.setInt(1,s.getId());
			status=pstmt.executeUpdate();
			
		}catch(Exception e)
		{e.printStackTrace();}
		return status;
		
	}
	
	//for fatch all data
	public static List<Student> getallData()
	{
		List<Student> l= new ArrayList<Student>();
		try {
			Connection con= StudentDAO.getConnection();
			String q="select * from student";
			PreparedStatement pstmt=  con.prepareStatement(q);
			
			ResultSet rs= pstmt.executeQuery();
			while(rs.next())
			{
				Student s = new Student();
				s.setId(rs.getInt(1));
				s.setSname(rs.getString(2));
				s.setScontact(rs.getInt(3));
				s.setSemail(rs.getString(4));
				s.setScity(rs.getString(5));
						
				l.add(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}
	
	
	
	
	// for insertion
	public static int save(Student s)
	{
		int status=0;
		
		try {
			
			Connection con= StudentDAO.getConnection();
			
			String q= "insert into student(sname,scontact,semail,scity) value(?,?,?,?)";
			PreparedStatement pstmt= con.prepareStatement(q);
			
			pstmt.setString(1, s.getSname());
			pstmt.setInt(2, s.getScontact());
			pstmt.setString(3, s.getSemail());
			pstmt.setString(4, s.getScity());
			
			status =pstmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
}
