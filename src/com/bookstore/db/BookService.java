package com.bookstore.db;
import java.util.List;

import com.bookstore.main.Book;

public interface BookService {
	public List<Book> select(Book book);
	
	public Book getBook(Book book);
}
