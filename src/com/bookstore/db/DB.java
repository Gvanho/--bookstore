package com.bookstore.db;

import java.sql.*;

public class DB {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3307/bookstore";
	private static String user="root";
	private static String password="123456";
	
	//连接数据库
	public static Connection getCon() throws ClassNotFoundException, SQLException{
        Class.forName(driver);//加载数据库驱动
        System.out.println("测试加载数据库成功");
        Connection con=DriverManager.getConnection(url, user, password);
        System.out.println("测试数据库链接成功");
        return con;
    }
	
	 public static void close(Connection con,PreparedStatement ps,ResultSet rs){
	        if(rs!=null){//关闭资源，避免出现异常
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        if(ps!=null){
	            try {
	                ps.close();
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	        if(con!=null){
	            try {
	                con.close();
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	    }
	 
	 public static boolean addUpdateDelete(String sql,Object[] arr){
	        Connection con=null;
	        PreparedStatement ps=null;
	        try {
	            con=DB.getCon();//第一步 ：连接数据库的操作
	            ps=con.prepareStatement(sql);//第二步：预编译
	            //第三步：设置值
	            if(arr!=null && arr.length!=0){
	                for(int i=0;i<arr.length;i++){
	                    ps.setObject(i+1, arr[i]);
	                }
	            }
	            int count=ps.executeUpdate();//第四步：执行sql语句
	            if(count>0){
	                return true;
	            }else{
	                return false;
	            }
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return false;
	    }
	 
	 public static void main(String[] args) {
	        try {
	            DB.getCon();
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }
	 
	 
	
}
