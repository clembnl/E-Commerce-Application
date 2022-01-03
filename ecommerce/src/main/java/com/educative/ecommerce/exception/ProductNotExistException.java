package com.educative.ecommerce.exception;

public class ProductNotExistException extends Exception{
    public ProductNotExistException(String msg) {
        super(msg);
    }
}
