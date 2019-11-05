package com.ershoujy.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandler {
    @org.springframework.web.bind.annotation.ExceptionHandler(Exception.class)
    public ModelAndView handleSQLException() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        mv.addObject("ts","未知错误请重新登入");
        return mv;
    }

}
