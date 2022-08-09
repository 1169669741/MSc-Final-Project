package com.boot.security.server.model;

public class RequestResult {

    public static final String STATE_SUCCESS = "200";
    public static final String STATE_DEBUGER = "500";


    private String state;
    private String message;
    private Object obj;

    public RequestResult(){

    }

    public RequestResult(String state, String message) {
        this.state = state;
        this.message = message;
    }

    public RequestResult(String state, String message, Object obj) {
        this.state = state;
        this.message = message;
        this.obj = obj;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    @Override
    public String toString() {
        return "RequestResult{" +
                "state='" + state + '\'' +
                ", message='" + message + '\'' +
                ", obj=" + obj +
                '}';
    }
}
