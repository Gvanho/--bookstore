package com.bookstore.main;

public class CartItem {
	private Book book;// 图书对象的成员变量
    private Integer number;// 购买的数量；

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}
