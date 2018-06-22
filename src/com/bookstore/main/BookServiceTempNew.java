package com.bookstore.main;
import java.util.*;

import com.bookstore.db.*;

public class BookServiceTempNew implements BookService {
private BookDB db=new BookDBTemp();
    
    public List<Book> select(Book book){
        //String sql="select * from book ";
        StringBuilder sql=new StringBuilder("select * from product where 1=1 limit 1,4");
        //sql”Ôæ‰
        List<Object> list=new ArrayList<Object>();
        if(book!=null){
            
            if(book.getBooks_id()!=null){
                sql.append(" and books_id=? ");
                list.add(book.getBooks_id());
            }
            /*list.add(book.getBookname());
            list.add(book.getPrice());
            list.add(book.getAuthor());
            list.add(book.getPic());
            list.add(book.getPublish());*/
        }
        
        return db.select(sql.toString(), list.toArray());
    }

    @Override
    public Book getBook(Book book) {
        if(book.getBooks_id()!=null){
            return db.getBook(book.getBooks_id());
        }
        return null;
    }
}
