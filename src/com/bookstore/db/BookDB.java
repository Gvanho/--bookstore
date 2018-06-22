package com.bookstore.db;

import java.util.*;

import com.bookstore.main.Book;

public interface BookDB {
	public List<Book> select(String sql,Object[] arr);
	
	public Book getBook(Integer id);
	
}
