package com.educative.ecommerce.exception;

public class UpdateFailException extends IllegalArgumentException {
    public UpdateFailException(String msg) {
        super(msg);
    }
}