package com.educative.ecommerce.exception;

public class OrderNotFoundException extends IllegalArgumentException {
    public OrderNotFoundException(String msg) {
        super(msg);
    }
}