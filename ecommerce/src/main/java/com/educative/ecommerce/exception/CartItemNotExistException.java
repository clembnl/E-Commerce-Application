package com.educative.ecommerce.exception;

public class CartItemNotExistException extends Exception {
    public CartItemNotExistException(String msg) {
        super(msg);
    }
}
