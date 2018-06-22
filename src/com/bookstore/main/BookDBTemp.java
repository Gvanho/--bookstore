package com.bookstore.main;
import java.sql.*;
import java.util.*;

import com.bookstore.db.BookDB;
import com.bookstore.db.DB;
import com.bookstore.main.Book;

public class BookDBTemp implements BookDB {
	
	@Override
    public List<Book> select(String sql, Object[] arr) {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            con=DB.getCon();//��һ���������ݿ�
            ps=con.prepareStatement(sql);//�ڶ�����Ԥ����
            if(arr!=null){
                for(int i=0;i<arr.length;i++){
                    ps.setObject(i+1, arr[i]);
                }
            }
            //���Ĳ�ִ��sql
            rs=ps.executeQuery();
            List<Book> list=new ArrayList<Book>();
            while(rs.next()){
                Book book=new Book();
                book.setBooks_id(rs.getInt("id"));
                book.setBooks_name(rs.getString("name"));
                book.setPrice(rs.getDouble("price"));
                book.setCatagory(rs.getString("category"));
                book.setPnum(rs.getInt("pnum"));
                book.setImgurl(rs.getString("imgurl"));
                book.setDescription(rs.getString("description"));
                
                list.add(book);
            }
            return list;
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            //�ر���Դ����������쳣
            DB.close(con, ps, rs);
        }
        
        return null;
    }

    @Override
    public Book getBook(Integer id) {
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            con=DB.getCon();//��һ���������ݿ�
            String sql="select * from product where id = ? ";
            ps=con.prepareStatement(sql);//�ڶ�����Ԥ����
            ps.setInt(1, id);
            
            //���Ĳ�ִ��sql
            rs=ps.executeQuery();
            while(rs.next()){
            	Book books=new Book();
                books.setBooks_id(rs.getInt("id"));
                books.setBooks_name(rs.getString("name"));
                books.setPrice(rs.getDouble("price"));
                books.setCatagory(rs.getString("category"));
                books.setPnum(rs.getInt("pnum"));
                books.setImgurl(rs.getString("imgurl"));
                books.setDescription(rs.getString("description"));
                
                return books;
            }
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            DB.close(con, ps, rs);
        }
        
        return null;
    }

}
