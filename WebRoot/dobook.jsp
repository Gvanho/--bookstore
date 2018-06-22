<%@page import="com.bookstore.main.BookServiceTemp"%>
<%@page import="com.bookstore.db.BookService"%>
<%@page import="com.bookstore.main.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理图书详细信息的页面</title>
</head>
<body>
<%
    Book book=new Book();
    String sid=request.getParameter("id");
    Integer id=Integer.parseInt(sid);
    BookService service=new BookServiceTemp();
    book.setBooks_id(id);
    Book books=service.getBook(book);
    
    session.setAttribute("book", books);
    response.sendRedirect("detail.jsp");
%>
</body>
</html>