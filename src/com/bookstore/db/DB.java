package com.bookstore.db;

import java.sql.*;

public class DB {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3307/bookstore";
	private static String user="root";
	private static String password="123456";
	
	//�������ݿ�
	public static Connection getCon() throws ClassNotFoundException, SQLException{
        Class.forName(driver);//�������ݿ�����
        System.out.println("���Լ������ݿ�ɹ�");
        Connection con=DriverManager.getConnection(url, user, password);
        System.out.println("�������ݿ����ӳɹ�");
        return con;
    }
	
	 public static void close(Connection con,PreparedStatement ps,ResultSet rs){
	        if(rs!=null){//�ر���Դ����������쳣
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
	            con=DB.getCon();//��һ�� ���������ݿ�Ĳ���
	            ps=con.prepareStatement(sql);//�ڶ�����Ԥ����
	            //������������ֵ
	            if(arr!=null && arr.length!=0){
	                for(int i=0;i<arr.length;i++){
	                    ps.setObject(i+1, arr[i]);
	                }
	            }
	            int count=ps.executeUpdate();//���Ĳ���ִ��sql���
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
